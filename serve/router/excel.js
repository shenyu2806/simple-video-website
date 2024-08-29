const express = require('express')
const router = express.Router()
const ExcelJS = require('exceljs');
const fs = require('fs');
const db = require('../db');
const image = require("imageinfo"); 
const mysql = require('mysql2/promise')

//数据只是这个功能使用来连接数据库
const mydb = {
    host:'localhost',//数据库地址
    user:'root',//用户名
    password:'123456',//密码
    database:'mp4'//数据库名称
}

router.get('/download-excel', async (req, res) => {
    let workbook = new ExcelJS.Workbook();
    let worksheet = workbook.addWorksheet('set position');

    // 设置工作表的列
    worksheet.columns = [
        { header: '序号', key: 'id', width: 10 },
        { header: '影片名称', key: 'title', width: 30 },
        { header: '状态', key: 'season', width: 10 },
        { header: '更新时间', key: 'updatetime', width: 10 },
        { header: '推荐', key: 'recommend', width: 10 },
        { header: '番剧播放时间', key: 'date', width: 10 },
        { header: '创建时间', key: 'createtime', width: 10 }
    ];

    try {
        let connection = await mysql.createConnection(mydb);
        await connection.connect();

        // 执行SQL查询
        let [rows] = await connection.execute('SELECT * FROM animation');

        // 将查询结果添加到工作表中
        rows.forEach(row => {
            worksheet.addRow({
                id: row.id,
                title: row.title,
                season: row.season,
                updatetime: row.updatetime,
                recommend: row.recommend == 0 ? "否" : "是",
                date: row.date,
                createtime: row.createtime
            });
        });

        // 关闭数据库连接
        await connection.end();

        // 将工作簿写入Buffer并发送
        let buffer = await workbook.xlsx.writeBuffer();

        // 设置响应头
        res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.setHeader('Content-Disposition', 'attachment; filename="set_position.xlsx"');

        // 发送文件
        res.send(buffer);
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = router;