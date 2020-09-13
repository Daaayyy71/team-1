<template>
  <div id="Home-one">
    <!-- 面包屑 -->
    <div>
      <el-card>
        <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/home-one' }"
          >选项一</el-breadcrumb-item
        >
      </el-breadcrumb>
      </el-card>
    </div>
    <!-- 操作 自定义属性传值-->
    <home1Add @setData="RequestData" />
    <!-- 列表 -->
    <home1Table :table="table" @setData="RequestData"/>
  </div>
</template>

<script>
import home1Table from "./home-1-table.vue";
import home1Add from "./home-1-add.vue";
export default {
  name: "Home-one",
  components: {
    home1Table,
    home1Add,
  },
  data() {
    return {
      table: [],
    };
  },
  mounted() {
    this.RequestData();
  },
  methods: {
    RequestData() {
      this.$axios.post("/api/homeTable").then((data) => {
        let result = data.data;
        if (result.code === 200) {
          this.table = result.data.reverse();
        } else {
          this.$alert(result.message);
        }
      });
    },
  },
};
</script>
<style></style>
