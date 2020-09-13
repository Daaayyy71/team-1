<template>
  <el-card class="box-card">
    <h1>W227</h1>
    <h4>登陆</h4>
    <el-form
      :label-position="labelPosition"
      label-width="80px"
      :model="formLabelAlign"
    >
      <el-form-item label="用户名">
        <el-input v-model="formLabelAlign.user"></el-input>
      </el-form-item>
      <el-form-item label="密码">
        <el-input :type="password" v-model="formLabelAlign.pwd"></el-input>
      </el-form-item>
      <el-button type="primary" @click="submitForm()">登陆</el-button>
    </el-form>
  </el-card>
</template>
<script>
export default {
  name: "login",
  data() {
    return {
      labelPosition: "right",
      formLabelAlign: {
        user: "",
        pwd: "",
      },
      password: "password",
    };
  },
  methods: {
    submitForm() {
      if (this.formLabelAlign.user.length === 0) {
        this.$message({
          message: "请输入用户名",
          type: "warning",
        });
      } else if (this.formLabelAlign.pwd.length === 0) {
        this.$message({
          message: "请输入密码",
          type: "warning",
        });
      } else {
        //发起请求到服务器
        this.$axios
          .post("/api/userLogin", {
            user: this.formLabelAlign.user,
            pwd: this.formLabelAlign.pwd,
          })
          .then((data) => {
            if (data.data.message == "登陆成功") {
              const h = this.$createElement;
              this.$notify({
                title: "成功",
                message: h("i", data.data.message),
                duration: 1000,
                type: "success",
              });
              //登陆成功跳转首页
              this.$router.push({ path:'/home' });
            } else {
              const h = this.$createElement;
              this.$notify({
                title: "警告",
                message: h("i", data.data.message),
                duration: 1000,
                type: "warning",
              });
            }
          })
          .catch((err) => {
            console.log(err);
            this.$message.error("请求出错，请联系管理员");
          });
      }
    },
  },
};
</script>
<style>
.box-card {
  width: 480px;
  margin: auto;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
	text-align: center;
}
</style>
