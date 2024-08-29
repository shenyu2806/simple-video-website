<template>
  <div class="home-box">
    <div class="vidoe" v-show="showSearch">
      <el-input v-model="input" placeholder="输入影片名称" />
      <el-button type="primary" @click="serag">搜索</el-button>
    </div>
    <right-toolbar
          v-model:showSearch="showSearch" :have-import="false" @queryTable="gettable"
          @onOutClick="onDownTemplate"
          @onAddClick="install"
    ></right-toolbar>
    <div class="table-column">
      <el-card>
        <el-table  	v-loading="loading" :data="tableData" style="width: 100%" @cell-click="dxan" @selection-change="deletesw">
          <el-table-column property="id" type="selection" width="55" align="center"/>
          <el-table-column property="title" label="影片名称" width="320" align="left"/>
          <el-table-column property="season" label="状态"  align="left"/>
          <el-table-column property="updatetime" label="更新时间" align="center"/>
          <el-table-column property="recommend" label="推荐" align="center" width="60px">
            <template #default="{row}">
              <el-tag size="large" v-if="row.recommend == 1">是</el-tag>
              <el-tag size="large" type="info" v-else>否</el-tag>
            </template>
          </el-table-column>
          <el-table-column property="date" label="番剧播放时间" width="180" align="center"/>
          <el-table-column property="createtime" label="创建时间"  width="180" align="center"/>
        </el-table>
      </el-card>
      <div class="button-main">
        <el-button type="danger" @click="getdalelist">删除</el-button>
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
import axios from "@/utils/axios";
import {getvideo,getviodtitle,installset,dalelist} from "@/api/video_list.js"
import vasicinfor from "../components/Basicinfor.vue"
import {bus} from "@/utils/mitt"
import {type} from "node:os";

const length = ref(0)
const useri =ref()
const input = ref('')
const loading = ref(true)
const tableData = ref([])
const gettable = async () =>{
  let ops = 0
  const  res = await getvideo()
  tableData.value = res.data
  loading.value = false
  ops = res.data.length - 1
  length.value = res.data[ops].id
  length.value++
}
gettable()
const dxan = (val) =>{
  bus.emit("void",val)
  useri.value.open()
}
//导出
const onDownTemplate = async () => {
  window.open('/api/excel/download-excel', '_blank');
};
//新增
const install = async () =>{
const res = await installset(length.value)
  if(res.status.error_code == 0){
    ElMessage({
      message: '新增成功',
      type: 'success',
      plain: true,
    })
  }
}
const serag = async () =>{
  const  res = await getviodtitle(input.value)
  tableData.value = res.data
}
//删除方法
const getdalelist = async () =>{
  const  res = await dalelist(a.value)
  if(res.status.error_code == 0){
    ElMessage({
      message: '删除成功',
      type: 'success',
      plain: true,
    })
  }
}
const a = ref("")
const deletesw = (val) =>{
  a.value = ""
  if(val.length > 0){
    for (let i =0;i<val.length - 1;i++){
      a.value += val[i].id+","
    }
    a.value += val[val.length - 1].id
  }
  console.log(a)
}
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