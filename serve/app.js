const express = require('express');
const fs = require('fs');
const path = require('path');
// 导入 cors 中间件——支持跨域访问
const cors = require('cors')

 
const app = express();
const port = 1008;
app.use(cors()) 

//静态托管
const multer = require("multer")
const upload = multer({dest:'./public/upload'})
app.use(upload.any())
// 设置静态文件目录
app.use(express.static("./public"))

//路由
const indexRouter =require('./router/index')
app.use('/',indexRouter)
const capiRouter =require('./router/api')
app.use('/api',capiRouter)
const adminRouter =require('./router/admin')
app.use('/admin',adminRouter)
const videoRouter =require('./router/video_list')
app.use('/video',videoRouter)
 
app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});

//打印错误，防止异常
process.on('uncaughtException', function (err) { 
    //打印出错误 
    console.log(err); 
    //打印出错误的调用栈方便调试 
    console.log(err.stack);
});