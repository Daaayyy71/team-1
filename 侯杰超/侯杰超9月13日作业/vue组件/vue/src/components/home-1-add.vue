<template>
  <div>
		<el-card>
			<el-button type="primary" @click="dialogFormVisible = true">添 加</el-button>
		</el-card>
    <el-dialog title="添加信息" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="姓名">
          <el-input v-model="form.name" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="账号">
          <el-input v-model="form.user" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="form.phone" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="form.emli" auto-complete="off"></el-input>
        </el-form-item>
        <!-- <el-form-item label="状态">
          <el-input v-model="form.stutas" auto-complete="off"></el-input>
        </el-form-item>
        <el-form-item label="创建时间">
          <el-input v-model="form.time" auto-complete="off"></el-input>
        </el-form-item> -->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="AddInformation">添 加</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
export default {
  data() {
    return {
			dialogFormVisible: false,
			table: [],
      form: {
        name: "",
        user: "",
        phone: "",
        emli: "",
      },
    };
  },
  mounted() {

  },
  methods: {
    AddInformation() {
      //1.获取数据导服务器，进行添加,接受服务器的响应
      this.$axios
        .post("/api/addhomeTable", {
          name: this.form.name,
          user: this.form.user,
          phone: this.form.phone,
          emli: this.form.emli,
        })
        .then((data) => {
          let result = data.data;
          if (result.code === 200) {
            this.$alert(result.message);
            if (result.message == "添加成功") {
              this.$emit('setData');
            }
            //2.添加对话框关闭
            this.dialogFormVisible = false;
          } else {
            this.$alert(result.message);
          }
        })
        .catch(() => {
          this.$alert("请求出错");
        });
    },
  },
};
</script>
<style>
.el-card{
	margin: 15px 0;
}
</style>
