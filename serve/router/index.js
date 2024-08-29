const express = require('express')
const router = express.Router()
const ExcelJS = require('exceljs');
const fs = require('fs');
const db = require('../db');
const image = require("imageinfo"); 
const mysql = require('mysql2/promise')

// 主页路由
router.get('/', (req, res) => {
  res.send({
	  code:200,
	  msg:"一切正常"
  })
});

// GET请求案例
router.get('/name/:name', (req, res) => {
	const name = req.params.name; // 获取路由参数
	//const name = req.name; // 获取查询字符串作为对象
	res.send({
		name: "欢迎"+name
	});
});


router.get('/img', function(req, res, next) {
	if(req.query.url == null){
		res.send({
			code:403,
			msg:"数据异常！"
		})
	}else{
		function readFileList(path, filesList) {
      var files = fs.readdirSync(path);
      files.forEach(function (itm, index) {
          var stat = fs.statSync(path + itm);
          if (stat.isDirectory()) {
          //递归读取文件
              readFileList(path + itm + "/", filesList)
          } else {
              var obj = {};//定义一个对象存放文件的路径和名字
              obj.path = path;//路径
              obj.filename = itm//名字
              filesList.push(obj);
          }

      })

	}
  var getFiles = {
    getFileList: function (path) {
        var filesList = [];
        readFileList(path, filesList);
        return filesList;
    },
    getImageFiles: function (path) {
        var imageList = [];

        this.getFileList(path).forEach((item) => {
            var ms = image(fs.readFileSync(item.path + item.filename));

            ms.mimeType && (imageList.push(item.path +item.filename))
        });
        res.send(imageList);
        return imageList;

    }
};
   getFiles.getImageFiles("./public/images/"+req.query.url);//getFiles.getFileList("./public/images/");
}
});

module.exports = router;