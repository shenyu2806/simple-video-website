const mysql = require('mysql')
const mydb = {
	host:'localhost',//数据库地址
	user:'root',//用户名
	password:'123456',//密码
	database:'mp4'//数据库名称
}
const db =mysql.createPool({
	host:mydb.host,
	user:mydb.user,
	password:mydb.password,
	database:mydb.database,
	dateStrings:true//强制日期类型
})

module.exports = db