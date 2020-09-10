var vm = new Vue({
  el: "#app",
  data: {
    stu: stuArr,
    searchValue: "",
    searchGrade: "",
    addStuObj: {
      stuID: "",
      stuNum: "",
      name: "",
      grade: "",
    },
    resetStuObj: {
      stuID: "",
      stuNum: "",
      name: "",
      grade: "",
    },
    cache: {
      index: null,
      resetDiv: false,
      addDiv: false,
    },
    selected: "",
    options: [1, 2, 3],
  },
  methods: {
    //封装寻找下标函数
    findIndex(arr, key, value) {
      for (let i = 0; i < arr.length; i++) {
        if (arr[i][key] == value) {
          return i;
        }
      }
    },
    //封装编号重复BUG
    doubleIDbug(arr, value, callback) {
      if (arr.indexOf(value) == -1) {
        callback();
      } else {
        alert("编号不能重复");
      }
    },
    //删除事件
    delStu(stuID) {
      //寻找下标
      let index = this.findIndex(this.stu, "stuID", stuID);
      this.stu.splice(index, 1);
      //清理闭包
      index = null;
    },
    //添加事件
    addStu() {
      //将所有学生的ID生成一个新数组
      let stuIDArr = this.stu.reduce((pre, val) => {
        pre.push(val.stuID);
        return pre;
      }, []);
      //判断条件是否重复，选择性执行回调函数
      this.doubleIDbug(stuIDArr, this.addStuObj.stuID, () => {
        this.stu.push({ ...this.addStuObj });
        //隐藏addDiv窗口
        this.cache.addDiv = false;
        alert("添加成功");
      });
    },
    //修改
    resetStu(stuID) {
      //打开resetDiv窗口
      this.cache.resetDiv = true;
      //获取下标
      let index = this.findIndex(this.stu, "stuID", stuID);
      //将原值传入文本框
      this.resetStuObj.stuID = this.stu[index].stuID;
      this.resetStuObj.stuNum = this.stu[index].stuNum;
      this.resetStuObj.name = this.stu[index].name;
      this.resetStuObj.grade = this.stu[index].grade;
      // 将当前下标临时存储到cache
      this.cache.index = index;
      //清理index闭包缓存
      index = null;
    },
    // 确认修改
    resetStuEnd() {
      this.stu.splice(this.cache.index, 1, { ...this.resetStuObj });
      // 清除index缓存
      this.cache.index = null;
      //关闭窗口
      this.cache.resetDiv = false;
    },
    selectDel() {
      //创建一个数组存需要删除的下标
      let indexDel = [];
      this.stu.forEach((value, index) => {
        if (
          value.stuID.indexOf(this.searchValue) != -1 &&
          (!this.selected || value.grade == this.selected)
        ) {
          //将要算出的下标存入数组
          indexDel.push(index);
        }
      });
      //倒叙遍历删除下标并删除原数组，正序会出bug
      for (let i = indexDel.length - 1; i >= 0; i--) {
        this.stu.splice(indexDel[i], 1);
      }
    },
  },
  computed: {
    // 搜索
    searchStu() {
      return this.stu.filter((x) => {
        return (
          x.stuID.indexOf(this.searchValue) != -1 &&
          (!this.selected || x.grade == this.selected)
        );
      });
    },
    //遍历学生数据生成去重的年级数组
    gradeArr() {
      return this.stu.reduce((pre, val) => {
        if (pre.indexOf(val.grade) == -1) {
          pre.push(val.grade);
        }
        return pre;
      }, []);
    },
  },
  filters: {},
});
