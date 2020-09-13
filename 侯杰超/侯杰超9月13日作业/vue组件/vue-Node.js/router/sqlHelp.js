const mysql = require('mysql');					//引用mysql
function DbOper(sql,param,callback){
	const conn = mysql.createConnection({
		host:'localhost',
		user:'root',
		password:'',
		port:3306,
		database:'w227'
	});
	conn.connect();
	conn.query(sql,param,callback);
	conn.end();
}
module.exports = {
	query:DbOper												
}																			//暴露