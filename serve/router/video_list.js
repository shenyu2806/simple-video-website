const express = require('express')
const router = express.Router()
const fs = require('fs');
const image = require("imageinfo"); 
const db = require('../db');

//获取影片信息
router.get('/all', (req, res) => {
    sql="SELECT * FROM animation";
    db.query(sql, function (err, result) {
        if (err) {
            res.send({
                code:500,
                msg:"获取失败"
            })
        }
        res.send({
            code:200,
            msg:"获取成功",
            data:result
        })
    });
});

//写入影片信息
router.get('/set', (req, res) => {
    const { id , text } = req.query;
    const playlist = JSON.stringify({
        1:{
            link:"",
            title:text
        }
    })
        

    sql="update detailed set  ? where id = " + id ;
    db.query(sql,{
        playlist
    },(err, result) => {
        if (err) {
            res.send({
                code:500,
                msg:"失败",
                err
            })
        }
        res.send({
            code:200,
            msg:"成功",
            data:result
        })
    });
});

module.exports = router;