const express = require('express')
const router = express.Router()
const fs = require('fs');
const image = require("imageinfo");
const db = require("../db/index")
const { promisify } = require('util');

// 假设 db.query 是 Node.js 中的一个函数，我们使用 promisify 将其转换为返回 Promise 的函数
const queryPromise = promisify(db.query).bind(db);

// 获取混合列表
router.get('/getIndex', async (req, res) => {
    try {
        // 并发执行所有查询
        const [
            banner,
            chinese_comic,
            results,
            japancomic,
            latest,
            perweek1,
            perweek2,
            perweek3,
            perweek4,
            perweek5,
            perweek6,
            perweek7,
            theatre_comic
        ] = await Promise.all([
            queryPromise("select cover,id,title from animation order by createtime desc limit 4"),
            queryPromise("select detailed.cover,detailed.id,detailed.season,detailed.title from detailed INNER JOIN animation on detailed.title = animation.title where region='中国'"),
            queryPromise("select cover,id,season,title,date,description from animation order by viewing desc limit 5"),
            queryPromise("select cover,id,season,title from animation where season = '完结' limit 5"),
            queryPromise("select cover,id,season,title from animation order by createtime desc limit 5"),
            queryPromise("select id,season,title from animation where updatetime = '周一'"),
            queryPromise("select id,season,title from animation where updatetime = '周二'"),
            queryPromise("select id,season,title from animation where updatetime = '周三'"),
            queryPromise("select id,season,title from animation where updatetime = '周四'"),
            queryPromise("select id,season,title from animation where updatetime = '周五'"),
            queryPromise("select id,season,title from animation where updatetime = '周六'"),
            queryPromise("select id,season,title from animation where updatetime = '周天'"),
            queryPromise("select cover,id,season,title from animation where recommend = 1")
        ]);

        // 组织响应数据
        res.send({
            code: 200,
            message: "一切正常",
            data: {
                banner,
                chinese_comic,
                hots: {
                    results
                }
                ,
                japancomic,
                latest,
                perweek: {
                    0: perweek1,
                    1: perweek2,
                    2: perweek3,
                    3: perweek4,
                    4: perweek5,
                    5: perweek6,
                    6: perweek7,
                },
                theatre_comic
            }
        });
    } catch (err) {
        console.log(err);
        res.send({
            code: 501,
            message: "数据库查询错误"
        });
    }
});

// 获取视频地址集
router.get('/getVideo/:id', (req, res) => {
    const id = req.params.id;
    // 使用参数化查询来防止 SQL 注入
    const sql = "SELECT datelist FROM detailed WHERE id =" + id + "";
    db.query(sql, function (err, result) {
        if (err) {
            console.log(err);
            res.send({
                code: 501,
                message: "数据库查询错误"
            });
            return; // 提前返回以避免进一步执行
        }

        if (result.length === 0) {
            // 如果没有找到数据，则返回适当的响应
            res.send({
                code: 404,
                message: "未找到数据"
            });
            return; // 提前返回
        }
        // 假设 datelist 是一个 JSON 字符串，尝试解析它
        try {
            const data = JSON.parse(result[0].datelist)
            res.send({
                code: 200,
                message: "获取成功",
                data
            });
        } catch (e) {
            // 如果解析 JSON 失败，则返回错误
            console.error("解析 JSON 时出错:", e);
            res.send({
                code: 500,
                message: "内部服务器错误：无法解析数据",
                data: result[0].datelist
            });
        }
    });
});
// 获取动漫详情
router.get('/getAnime/:id', (req, res) => {
    const id = req.params.id;
    sql = `SELECT * FROM detailed WHERE id = ${id}`;
    db.query(sql,function (err, result) {
        if (err) {
            console.log(err);
            res.send({
                code: 501,
                message: "数据库查询错误"
            });
            return; // 提前返回以避免进一步执行
        }
        if (result.length === 0) {
            // 如果没有找到数据，则返回适当的响应
            res.send({
                code: 404,
                message: "未找到数据",
                length:result.length
            });
            return; // 提前返回
        }
        try {
            const actors = JSON.parse(result[0].actors);
            const categories = JSON.parse(result[0].categories);
            const playlist = JSON.parse(result[0].playlist);
            res.send({
                code: 200,
                message: "获取成功",
                data: {
                    actors,
                    categories,
                    cover: result[0].cover,
                    first_date: result[0].createtime,
                    lang: result[0].lang,
                    master: result[0].master,
                    playlist,
                    rank: result[0].rank,
                    region: result[0].region,
                    season: result[0].season,
                    title: result[0].title,
                }

            });
        } catch (e) {
            // 如果解析 JSON 失败，则返回错误
            console.error("解析 JSON 时出错:", e);
            res.send({
                code: 500,
                message: "内部服务器错误：无法解析数据",
                data: result[0].playlist
            });
        }
    })
})
//根据名称获取动漫列表
router.get('/search/:name', (req, res) => {
    const searchName = req.params.name;
    const page = req.query.page ? parseInt(req.query.page, 10) : 1;
    const pageSize = 10; // 每页显示的记录数

    // 查询数据
    const sqlGetData = "SELECT category, cover, date, description, id, season, title FROM animation WHERE title LIKE ? LIMIT ?, ?";
    db.query(sqlGetData, ['%' + searchName + '%', (page - 1) * pageSize, pageSize], (err, result) => {
        if (err) {
            console.log(err);
            res.send({
                code: 501,
                message: "数据库查询错误"
            });
            return;
        }

        // 计算总记录数
        const sqlGetCount = "SELECT COUNT(*) as total FROM animation WHERE title LIKE ?";
        db.query(sqlGetCount, ['%' + searchName + '%'], (err, countResult) => {
            if (err) {
                console.log(err);
                res.send({
                    code: 501,
                    message: "数据库查询错误（计算总数）"
                });
                return;
            }

            const pagetotal = Math.ceil(countResult[0].total / pageSize); // 计算总页数

            if (result.length === 0) {
                res.send({
                    code: 404,
                    message: "未找到数据"
                });
            } else {
                res.send({
                    code: 200,
                    message: "获取成功",
                    data: {
                        pageindex: page,
                        pagetotal: pagetotal,
                        result
                    }
                });
            }
        });
    });
});
//动漫筛选
router.get('/filter', (req, res) => {
    let { type, category, order, letter, year, page } = req.query;
    let sql = "SELECT cover, date, description, id, season, title FROM animation ";
    let whereClause = [];
    let orderByClause = "ORDER BY id ASC"; // 默认按title升序

    // 构建WHERE子句
    if (type) whereClause.push(`type = '${type}'`);
    if (category) whereClause.push(`category = '${category}'`);
    if (letter) whereClause.push(`title LIKE '${letter}%'`);
    // if (year) whereClause.push(`date LIKE '%${year}%'`);

    if (order) {
        if(order === 'time'){
            order = "date"
        }
        orderByClause = `ORDER BY ${order} ASC`; // 假设默认升序，根据需要调整
    }

    if (whereClause.length > 0) {
        sql += `WHERE ${whereClause.join(' AND ')} `;
    }

    // 分页处理
    if (page && parseInt(page, 10) > 0) {
        const pageSize = 10; // 假设每页10条数据
        const offset = (parseInt(page, 10) - 1) * pageSize;
        sql += `${orderByClause} LIMIT ${pageSize} OFFSET ${offset}`;
    } else {
        sql += orderByClause;
    }

    db.query(sql, (err, result) => {
        if (err) {
            console.log(err);
            res.send({
                code: 501,
                message: "数据库查询错误"
            });
            return;
        }
        res.send({
            code: 200,
            message: "查询成功",
            data: {
                "current_page": 1,
                "total_pages": 1,
                "total": result.length,//查询到的数量
                results:result
            }
        });
    });
});
//获取动漫配置
router.get('/getConfig', (req, res) => {
    const sql = "SELECT id, name, categories FROM categories"; // 只选择需要的列
    db.query(sql, (err, result) => {
        if (err) {
            logger.error('数据库查询错误:', err); // 使用日志记录错误
            res.status(500).send({
                code: 500,
                message: "内部服务器错误：数据库查询失败"
            });
            return;
        }

        try {
            const filtersConfig = {
                filtersConfig: result.map(category => {
                    // 尝试解析categories字段，如果失败则设置为空数组
                    const categoriesParsed = category.categories ? JSON.parse(category.categories) : [];
                    return {
                        name: category.name,
                        id: category.id,
                        categories: categoriesParsed
                    };
                })
            };
            res.send({
                code: 200,
                message: "获取成功",
                data: filtersConfig
            });
        } catch (parseError) {
            logger.error('解析categories字段失败:', parseError);
            res.status(400).send({
                code: 400,
                message: "无效的categories字段格式"
            });
        }
    });
});
module.exports = router;