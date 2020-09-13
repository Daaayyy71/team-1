//引用模块
const myexpress = require("express");
const bodyParser = require("body-parser");
const db = require("./router/sqlHelp"); //引用封装的mysql
const app = myexpress();

// bodyparser 的配置
app.use(bodyParser.json()); //支持json
app.use(bodyParser.urlencoded({ extended: false })); //url解码
app.use(myexpress.static(__dirname + "/public")); //静态资源路径
//定义接口
//登陆页面
app.post("/userLogin", function (req, res) {
  //1.接受用户传递的参数
  let username = req.body.user;
  let pwd = req.body.pwd;
  console.log(username, pwd);
  let sql = "SELECT`user`.*FROM`user`WHERE`user`.`user` =?  AND`user`.pwd =? ";
  db.query(sql, [username, pwd], function (err, data) {
    //err : null,表示没有错误
    if (err) {
      console.log(err);
      res.send({ code: 500, message: "数据库异常" });
    } else {
      if (data.length > 0) {
        res.send({ code: 200, message: "登陆成功", data: data[0] });
      } else {
        res.send({ code: 200, message: "用户名或密码错误" });
      }
    }
  });
});
//部门数据列表
app.post("/homeTable", function (req, res) {
  let sql = "SELECT `hometable` . *FROM `hometable`";
  db.query(sql, [], function (err, data) {
    //err : null,表示没有错误
    if (err) {
      console.log(err);
      res.send({ code: 500, message: "数据库异常" });
    } else {
      res.send({ code: 200, data: data });
    }
  });
});
//添加部门数据列表
app.post("/addhomeTable", function (req, res) {
  //1.接受参数
  let name = req.body.name;
  let user = req.body.user;
  let phone = req.body.phone;
  let emli = req.body.emli;
  console.log(req.body);
  //2.添加数据
  let sql = "insert into hometable(name,user,phone,emli) values(?,?,?,?)";
  db.query(sql, [name, user, phone, emli], function (err, data) {
    //err : null,表示没有错误
    if (err) {
      console.log(err);
      res.send({ code: 500, message: "数据库异常" });
    } else {
      //添加，删除，修改都不会返回数据列表，他返回的数据当中有一个受影响的行数
      if (data.affectedRows > 0) {
        res.send({ code: 200, message: "添加成功" });
      } else {
        res.send({ code: 200, message: "添加失败" });
      }
    }
  });
});
//删除数据
app.get("/delhomeTable", function (req, res) {
  let id = req.query.id;
  console.log(id);
  let sql = "UPDATE hometable SET status = 0 WHERE id = ?";
  db.query(sql, [id], function (err, data) {
    if (err) {
      console.log(err);
      res.send({ code: 500, message: "数据库异常" });
    } else {
      if (data.affectedRows > 0) {
        res.send({ code: 200, message: "删除成功" });
      } else {
        res.send({ code: 200, message: "删除失败" });
      }
    }
  });
});
//修改数据
app.post("/edithomeTable", function (req, res) {
  //1.接受参数
  let id = req.body.id;
  let name = req.body.name;
  let user = req.body.user;
  let phone = req.body.phone;
  let emli = req.body.emli;
  let status = req.body.status;
  console.log(req.body);
  //2.添加数据
  let sql = "update hometable set name = ?,user = ?,phone = ?,emli = ?,status = ? where id =?";
  db.query(sql, [name, user, phone, emli,status,id], function (err, data) {
    //err : null,表示没有错误
    if (err) {
      console.log(err);
      res.send({ code: 500, message: "数据库异常" });
    } else {
      //添加，删除，修改都不会返回数据列表，他返回的数据当中有一个受影响的行数
      if (data.affectedRows > 0) {
        res.send({ code: 200, message: "修改成功" });
      } else {
        res.send({ code: 200, message: "修改失败" });
      }
    }
  });
});
app.listen(8888, function () {
  console.log("服务启动");
});
