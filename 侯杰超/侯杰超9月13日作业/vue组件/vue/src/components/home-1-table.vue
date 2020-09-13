<template>
  <div>
    <el-card>
      <el-table :data="table" height="650" border style="width: 100%">
        <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column prop="id" label="ID"> </el-table-column>
        <el-table-column prop="name" label="姓名"> </el-table-column>
        <el-table-column prop="user" label="账号"> </el-table-column>
        <el-table-column prop="phone" label="手机号"> </el-table-column>
        <el-table-column prop="emli" label="邮箱"> </el-table-column>
        <el-table-column label="状态">
          <template slot-scope="scope">
            <span
              :class="scope.row.status == 1 ? 'statusActive' : 'statusDel'"
              >{{ scope.row.status == 1 ? "有效" : "无效" }}</span
            >
          </template>
        </el-table-column>
        <el-table-column prop="time" :formatter="TimeFormat" label="创建时间">
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button
              type="primary"
              round
              icon="el-icon-edit"
              @click="edit(scope.row)"
            ></el-button>
            <el-button
              type="danger"
              round
              icon="el-icon-delete"
              @click="del(scope.row.id)"
            ></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!-- 修改对话框 -->
    <el-dialog title="修改信息" :visible.sync="dialogFormEditVisible">
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
        <el-form-item label="状态">
          <br />
          <el-select v-model="form.status" auto-complete="off">
            <el-option label="有效" :value="1"></el-option>
            <el-option label="无效" :value="0"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormEditVisible = false">取 消</el-button>
        <el-button type="primary" @click="Editformation">修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
export default {
  data() {
    return {
      dialogFormEditVisible: false,
      form: {
        id: "",
        name: "",
        user: "",
        phone: "",
        emli: "",
        status: "0",
      },
    };
  },
  props: ["table"],
  methods: {
    TimeFormat(row) {
      return new Date(row.time).toLocaleDateString();
    },
    del(id) {
      //发起请求到服务器，让服务器删除
      this.$axios
        .get("/api/delhomeTable", {
          params: {
            id: id,
          },
        })
        .then((res) => {
          let result = res.data;
          if (result.message == "删除成功") {
            this.$alert(result.message);
            this.$emit("setData");
          } else {
            this.$alert(result.message);
          }
        })
        .catch((err) => {
          console.log(err);
          this.$alert("请求出错，请检查");
        });
    },
    edit(obj) {
      this.dialogFormEditVisible = true;
      this.form.id = obj.id;
      this.form.name = obj.name;
      this.form.user = obj.user;
      this.form.phone = obj.phone;
      this.form.emli = obj.emli;
      this.form.status = obj.status;
    },
    Editformation() {
      //将修改的数据发给服务器，接收服务器的响应并进行处理
      this.$axios
        .post("/api/edithomeTable", {
          id: this.form.id,
          name: this.form.name,
          user: this.form.user,
          phone: this.form.phone,
          emli: this.form.emli,
          status: this.form.status,
        })
        .then((res) => {
          let result = res.data;
          if (result.message === "修改成功") {
            this.$alert(result.message);
						this.$emit("setData");
						this.dialogFormEditVisible = false;
          } else {
            this.$alert(result.message);
          }
        })
        .catch((err) => {
          console.log(err);
          this.$alert("请求出错");
        });
    },
  },
};
</script>
<style>
.statusActive {
  padding: 5px 10px;
  color: snow;
  background-color: green;
}
.statusDel {
  padding: 5px 10px;
  color: snow;
  background-color: red;
}
</style>
