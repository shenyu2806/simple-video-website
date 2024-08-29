<template>
  <div class="home-box">
    <div class="vidoe" v-show="showSearch">
      <el-input v-model="input" placeholder="输入影片名称" />
      <el-button type="primary">搜索</el-button>
    </div>
    <right-toolbar
          v-model:showSearch="showSearch" :have-import="false" @queryTable="gettable"
          @onOutClick="onDownTemplate"
          @onAddClick="onDownTemplate"
    ></right-toolbar>
    <div class="table-column">
      <el-card>
        <el-table  	v-loading="loading" :data="tableData" style="width: 100%" @cell-click="dxan">
          <el-table-column property="id" type="selection" width="55" align="center"/>
          <el-table-column property="title" label="影片名称" width="320" align="left"/>
          <el-table-column property="datelist" label="播放源"  width="180" align="center">
            <template #default="{row}">
              <el-tag>{{ ops(row.datelist)}}</el-tag>
            </template>
          </el-table-column>
          <el-table-column property="playlist" label="集数"  width="180" align="center">
            <template #default="{row}">
              <el-tag v-if=" row.playlist['1'].length > 0">{{row.playlist["1"].length}}</el-tag>
              <el-tag v-else>暂无</el-tag>
            </template>
          </el-table-column>
          <el-table-column property="season" label="状态"  width="180" align="center"/>
          <el-table-column property="rank" label="评分"  width="180" align="center"/>
          <el-table-column property="createtime" label="创建时间"  width="180" align="center"/>
        </el-table>
      </el-card>
      <div class="button-main">
        <el-button type="danger">删除</el-button>
        <div class="paons">
          <el-pagination  :hide-on-single-page="paonsvalue" background layout="prev, pager, next" :total="10" />
        </div>
      </div>
    </div>
  <vasicinfor ref='useri'></vasicinfor>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import {ElMessage, ElTable} from 'element-plus'
import {getallset} from "@/api/video_list.js"
import vasicinfor from "../components/episodesinfor.vue"
import {bus} from "@/utils/mitt"

const useri =ref()
const input = ref('')
const loading = ref(true)
const tableData = ref([])
const gettable = async () =>{
  const  res = await getallset()
  tableData.value = res.data
  loading.value = false
}
const ops = (data) =>{
  let totalLength = 0;
// 遍历对象的每个属性
  for (let key in data) {
    if (data.hasOwnProperty(key) && Array.isArray(data[key])) {
      // 检查属性值是否为数组，并累加其长度
      totalLength += data[key].length;
    }
  }
  if(totalLength % 2 == 0){
    totalLength = totalLength / 2
  }
  return totalLength
}
gettable()
const dxan = (val) =>{
  bus.emit("voidxx",val)
  useri.value.open()
}
const onDownTemplate = () => {
  ElMessage.error("联系管理员");
};
//搜索开关
const showSearch = ref(true);
//分页开关
const paonsvalue = ref(false)
</script>

<style scoped lang="scss">
.vidoe{
  display: flex;
  margin-bottom: 15px;
  .el-input{
    width: 300px;
  }
  .el-button{
    margin-left: 15px;
  }
}
.button-main{
  margin-top: 15px;
  .paons{
  float: right;
  }
}

</style>