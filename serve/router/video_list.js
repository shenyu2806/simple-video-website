const express = require('express')
const router = express.Router()
const fs = require('fs');
const image = require("imageinfo");
const db = require('../db');

//获取影片信息
router.get('/all', (req, res) => {
    sql = "SELECT id,title,season,updatetime,recommend,date,createtime FROM animation";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "获取失败"
                }
            })
            return;
        }
        res.send({
            status: {
                error_code: 0,
                error_msg: "获取成功"
            },
            data: result,
            length: result.length
        })
    });
});
//获取影片信息
router.post('/getviod', (req, res) => {
    const { id } = req.body;
    sql = "SELECT * FROM animation where id = " + id + "";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "获取失败",
                    err
                }
            })
            return;
        }
        res.send({
            status: {
                error_code: 0,
                error_msg: "获取成功"
            },
            data: result
        })
    });
});
//获取影片信息 搜索
router.post('/getviodtitle', (req, res) => {
    const { title } = req.body;
    sql = "SELECT * FROM animation where title like '%" + title + "%'";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "获取失败",
                    err
                }
            })
            return;
        }
        res.send({
            status: {
                error_code: 0,
                error_msg: "获取成功"
            },
            data: result
        })
    });
});
//获取分类信息
router.get('/getcate', (req, res) => {
    sql = "SELECT * FROM categories";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "获取失败",
                    err
                }
            })
            return;
        }
        try {
            const filtersConfig = {
                filtersConfig: result.map(category => {
                    return {
                        name: category.name,
                        id: category.id,
                    };
                })
            };
            const categories = result.map(category => {
                const categoriesParsed = category.categories ? JSON.parse(category.categories) : [];
                return { ops: categoriesParsed }
            })

            res.send({
                status: {
                    error_code: 0,
                    error_msg: "获取成功"
                },
                data: filtersConfig,
                cate: categories,
                length: result.length
            })
        } catch (parseError) {
            logger.error('解析categories字段失败:', parseError);
            res.status(400).send({
                code: 400,
                error_code: 1,
                error_msg: "获取失败",
                message: "无效的categories字段格式"
            });
        }
    });
});
//修改影片信息
router.post('/setviod', (req, res) => {
    const {
        id,
        title,
        cover,
        season,
        type,
        category,
        recommend,
        date,
        updatetime
    } = req.body;
    sql = "update animation set  ? where id = " + id;
    db.query(sql, {
        title,
        cover,
        season,
        type,
        category,
        recommend,
        date,
        updatetime
    }, (err, result) => {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "修改失败",
                    err

                }
            })
        }
        res.send({
            status: {
                error_code: 0,
                error_msg: "修改成功"
            },
        })
    });
});
//获取影片详细信息
router.get('/allset', (req, res) => {
    sql = "SELECT * FROM detailed";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "获取失败"
                }
            })
            return;
        }
        try {
            const data = result.map(category => {
                const vode = category.categories ? JSON.parse(category.categories) : [];
                return {
                    id: category.id,
                    title: category.title,
                    actors: JSON.parse(category.actors),
                    categories: JSON.parse(category.categories),
                    cover: category.cover,
                    createtime: category.createtime,
                    lang: category.lang,
                    master: category.master,
                    playlist: JSON.parse(category.playlist),
                    datelist: JSON.parse(category.datelist),
                    rank: category.rank,
                    region: category.region,
                    season: category.season,
                }
            })
            res.send({
                status: {
                    error_code: 0,
                    error_msg: "获取成功"
                },
                data
            })
        } catch (parseError) {
            res.status(400).send({
                code: 400,
                error_code: 1,
                error_msg: "获取失败",
                message: "无效的categories字段格式"
            });
        }
    });
});
//获取影片详细信息 id
router.post('/allsetid', (req, res) => {
    const {id} = req.body
    sql = "SELECT * FROM detailed where id = " + id + "";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "获取失败"
                }
            })
            return;
        }
        try {
            const data = result.map(category => {
                const vode = category.categories ? JSON.parse(category.categories) : [];
                return {
                    id: category.id,
                    title: category.title,
                    actors: JSON.parse(category.actors),
                    categories: JSON.parse(category.categories),
                    cover: category.cover,
                    createtime: category.createtime,
                    lang: category.lang,
                    master: category.master,
                    playlist: JSON.parse(category.playlist),
                    datelist: JSON.parse(category.datelist),
                    rank: category.rank,
                    region: category.region,
                    season: category.season,
                }
            })
            res.send({
                status: {
                    error_code: 0,
                    error_msg: "获取成功"
                },
                data
            })
        } catch (parseError) {
            res.status(400).send({
                code: 400,
                error_code: 1,
                error_msg: "获取失败",
                message: "无效的categories字段格式"
            });
        }
    });
});
//修改详细影片信息
router.post('/setviodse', (req, res) => {
    const {
        id,
        title,
        actors1,
        categories1,
        master,
        cover,
        season,
        rank,
        region
    } = req.body;
   // 将字符串转换为数组
   const actors = (actors1 || '[]').split(',').map(actor => actor.trim());
   const categories = (categories1 || '[]').split(',').map(category => category.trim());
    sql = "update detailed set  ? where id = " + id;
    db.query(sql, {
        title,
        actors: JSON.stringify(actors), // 假设数据库中的actors字段是JSON字符串
        categories: JSON.stringify(categories), // 同上
        cover,
        master,
        season,
        rank,
        region
    }, (err, result) => {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "修改失败",
                    err
                }
            })
            return
        }
        res.send({
            status: {
                error_code: 0,
                error_msg: "修改成功"
            },
        })
    });
});

//修改影片集数
router.post('/setviodepis', (req, res) => {
    const {
        id,
        textarea1,
        textarea2
    } = req.body;
    const actors = (textarea1 || '[]').split(',').map(actor => actor.trim());
    const actors1 = (textarea2 || '[]').split(',').map(actor => actor.trim());
    const playlist1 = actors.map((actor, index) => ({
        link: '',
        title: `${index + 1}集`
    }));
    const playlist2 = actors1.map((actor, index) => ({
        link: '',
        title: `${index + 1}集`
    }));
    const playlist = {
        "1": playlist1,
        "2": playlist2
    }
    const datelist = {
        "1":actors,
        "2":actors1,
    }
    sql = `update detailed set  ? where id = ${id}`;
    db.query(sql, {
        datelist: JSON.stringify(datelist),
        playlist: JSON.stringify(playlist)
    }, (err, result) => {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "修改失败",
                    err

                }
            })
            return
        }
        res.send({
            status: {
                error_code: 0,
                error_msg: "修改成功"
            },
        })
    });
});

//一键新增
router.get('/installset', (req, res) => {
    const id = req.query.id;
    const data = new Date();
    sql = "insert into animation values(?,'新数据','','完结','你需要修改这个数据',1,1001,0,0,'2021-08-29',?,?)";
    db.query(sql, [id,data,"周一"], (err, result) => {
        if (err) {
            res.send({
                status: {
                    error_code: 1,
                    error_msg: "新增失败1",
                    err
                }
            })
            return
        }
        sql = "insert into detailed values(?,'新数据','[\"梅田修一朗\",\"遠野光\",\"若山詩音\",\"寺澤百花\",\"種崎敦美\",\"田中美海\",\"小林裕介\"]', '[\"喜剧\", \"奇幻\", \"校园\"]', 'http://172.17.1.13:1008/images/nav.webp', '2024-08-03', '日语', '北村翔太郎 ', '{\"1\": [{\"link\": \"\", \"title\": \"1集\"}], \"2\": [{\"link\": \"\", \"title\": \"1集\"}, {\"link\": \"\", \"title\": \"2集\"}, {\"link\": \"\", \"title\": \"3集\"}, {\"link\": \"\", \"title\": \"4集\"}, {\"link\": \"\", \"title\": \"5集\"}, {\"link\": \"\", \"title\": \"6集\"}, {\"link\": \"\", \"title\": \"7集\"}]}', '{\"1\": [\"http://172.17.1.13:1008/mp4/败犬女主太多了/playGV26006-1-1.mp4\"], \"2\": [\"https://v11.tlkqc.com/wjv11/202407/14/469JNKg4eQ83/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/21/6Az9pTuZWd84/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202407/28/Ujh4vytMGZ84/video/index.m3u8\", \"https://v10.tlkqc.com/wjv10/202408/04/4xqW26cvUA82/video/index.m3u8\", \"https://v7.tlkqc.com/wjv7/202408/12/sjmtFms8Xs79/video/index.m3u8\", \"https://v5.tlkqc.com/wjv5/202408/18/AagQt11gaH77/video/index.m3u8\", \"https://v12.tlkqc.com/wjv12/202408/25/LArnhy29St84/video/index.m3u8\"]}', '9.0', '日本', '更新中')";
        db.query(sql,id,(err, result) => {
            if (err) {
                res.send({
                    status: {
                        error_code: 1,
                        error_msg: "新增失败2",
                        err
                    }
                })
                return
            }
            res.send({
                status: {
                    error_code: 0,
                    error_msg: "新增成功"
                },
            })
         })
    });
})
//删除操作
router.post('/dalelist', (req, res) => {
    const { id } = req.body;
    const ids = Array.isArray(id) ? id : [id];
    const placeholders = ids.map(() => '?').join(', ');
    
    function deleteFromTable(tableName) {
        const sql = `DELETE FROM ${tableName} WHERE id IN (${placeholders})`;
        db.query(sql, ids, function(err, results, fields) {
            if (err) {
                return res.send({
                    status: {
                        error_code: 1,
                        error_msg: `Error deleting from ${tableName}: ${err.message}`
                    }
                });
            }
            // 如果需要，可以在这里处理 results 或 fields
        });
    }
    
    ['animation', 'detailed'].forEach(deleteFromTable);
    
    // 注意：由于使用了回调函数，下面的 res.send 可能会立即执行，
    // 而在数据库操作完成之前。你可能需要另一种方式来处理响应。
    // 一种方法是使用额外的逻辑来跟踪所有查询的完成情况。
    res.send({
        status: {
            error_code: 0,
            error_msg: "删除成功"
        }
    });
});
module.exports = router;