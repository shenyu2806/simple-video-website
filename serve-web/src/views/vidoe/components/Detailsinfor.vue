<template>
  <el-dialog v-model="dialogUserVisible" title="影片信息" width="500px" center draggable>
    <el-form :model="form" label-width="auto">
      <el-form-item label="影片名称">
        <el-input v-model="form.title" />
      </el-form-item>
      <el-form-item label="影片详情封面">
        <el-input v-model="form.cover" />
      </el-form-item>
      <el-form-item label="配音">
        <el-input v-model="form.actors" />
      </el-form-item>
      <el-form-item label="导演">
        <el-input v-model="form.master" />
      </el-form-item>
      <el-form-item label="标签">
        <el-input v-model="form.categories" />
      </el-form-item>
      <el-form-item label="动漫状态">
        <el-select v-model="form.season" placeholder="请选择状态">
          <el-option label="完结" value="完结" />
          <el-option label="更新中" value="更新中" />
          <el-option label="未上映" value="未上映" />
        </el-select>
      </el-form-item>
      <el-form-item label="评分">
        <el-input v-model="form.rank" />
      </el-form-item>
      <el-form-item label="地区">
        <el-input v-model="form.region" />
      </el-form-item>

      <div class="tru_button">
        <el-button  @click="plk">取消</el-button>
        <el-button type="primary" @click="getsetviod">确定</el-button>
      </div>
    </el-form>
  </el-dialog>
</template>

<script setup>
import {reactive, ref} from "vue";
import {allsetid,getcate,setviodse} from "@/api/video_list"
import {bus} from "@/utils/mitt"
import {ElMessage} from "element-plus";

bus.on("voidxx",res=>{
  form.id = res.id
})

const form = reactive({
  id:'',
  title:'',
  actors:"",
  categories:"",
  cover:'',
  season:'',
  master:'',
  rank:'',
  region:'',
  actors1:'',
  categories1:''
})
//获取分类
const opserws = ref([])
const opserws2 = ref([])
const getcateas = async () =>{
  const res = await getcate()
  opserws.value = res.data.filtersConfig
  opserws2.value = res.cate[0].ops
}
getcateas()
//获取数据 id
const uiop = async () =>{
  const res = await allsetid(form.id)
  form.title = res.data[0].title
  form.cover = res.data[0].cover
  form.categories = res.data[0].categories.join(',')
  form.actors = res.data[0].actors.join(',')
  form.season = res.data[0].season
  form.master = res.data[0].master
  form.rank = res.data[0].rank
  form.region = res.data[0].region
}

const getsetviod = async ()=>{
  form.actors1 = form.actors
  form.categories1 = form.categories
  const res = await setviodse(form)
  if(res.status.error_code == 0){
    ElMessage({
      message: '修改成功',
      type: 'success',
    })
    dialogUserVisible.value = false
  }
}

//控制弹窗
const dialogUserVisible = ref(false)
const plk = () =>{
  dialogUserVisible.value = false
}
//打开创建管理员弹窗
const open = async() =>{
  uiop()
  dialogUserVisible.value = true
}
defineExpose({
  open
})
</script>

<style scoped lang="scss">
  .opsdf{
    padding: 10px;
  }
.tru_button{
  display: flex;
  justify-items: right;
  justify-content: flex-end;
}
</style>