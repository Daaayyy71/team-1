<template>
  <div class="home">
    <el-container>
      <el-header>
        <h1>W227-Giao</h1>
      </el-header>
      <el-container>
        <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
          <el-menu :default-openeds="['1', '3']">
            <el-submenu index="1">
              <template slot="title"
                ><i class="el-icon-message"></i>导航一</template
              >
              <el-menu-item-group>
                <template slot="title">分组一</template>
                <router-link to="/home-one"
                  ><el-menu-item index="1-1">选项1</el-menu-item></router-link
                >
                <router-link to="/home-two"
                  ><el-menu-item index="1-1">选项2</el-menu-item></router-link
                >
              </el-menu-item-group>
              <el-menu-item-group title="分组2">
                <router-link to="/home-three"
                  ><el-menu-item index="1-3">选项3</el-menu-item></router-link
                >
              </el-menu-item-group>
              <el-submenu index="1-4">
                <template slot="title">选项4</template>
                <router-link to="/home-four"
                  ><el-menu-item index="1-4-1"
                    >选项4-1</el-menu-item
                  ></router-link
                >
              </el-submenu>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title"
                ><i class="el-icon-menu"></i>导航二</template
              >
              <el-menu-item-group>
                <template slot="title">分组一</template>
                <el-menu-item index="2-1">选项1</el-menu-item>
                <el-menu-item index="2-2">选项2</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="分组2">
                <el-menu-item index="2-3">选项3</el-menu-item>
              </el-menu-item-group>
              <el-submenu index="2-4">
                <template slot="title">选项4</template>
                <el-menu-item index="2-4-1">选项4-1</el-menu-item>
              </el-submenu>
            </el-submenu>
            <el-submenu index="3">
              <template slot="title"
                ><i class="el-icon-setting"></i>导航三</template
              >
              <el-menu-item-group>
                <template slot="title">分组一</template>
                <el-menu-item index="3-1">选项1</el-menu-item>
                <el-menu-item index="3-2">选项2</el-menu-item>
              </el-menu-item-group>
              <el-menu-item-group title="分组2">
                <el-menu-item index="3-3">选项3</el-menu-item>
              </el-menu-item-group>
              <el-submenu index="3-4">
                <template slot="title">选项4</template>
                <el-menu-item index="3-4-1">选项4-1</el-menu-item>
              </el-submenu>
            </el-submenu>
          </el-menu>
        </el-aside>
        <el-main>
          <h1>欢迎来到W227</h1>
          <router-view></router-view>
        </el-main>
      </el-container>
      <el-footer><h3>2020@W227-Giao</h3></el-footer>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "Home",
};
</script>
<style>
h3 {
  text-align: center;
}
.el-header {
  background-color: pink;
  color: snow;
}
.el-main{
  min-height: 800px;
}
.el-aside {
  color: snow;
}
.el-footer {
  background-color: pink;
  color: snow;
}
</style>
