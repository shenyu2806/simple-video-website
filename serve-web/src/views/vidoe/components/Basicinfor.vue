<template>
  <el-dialog v-model="dialogUserVisible" title="影片信息" width="500px" center draggable>
    <el-form :model="form" label-width="auto">
      <el-form-item label="影片名称">
        <el-input v-model="form.title" />
      </el-form-item>
      <el-form-item label="影片首页展示封面">
        <el-input v-model="form.cover" />
      </el-form-item>
      <el-form-item label="动漫状态">
        <el-select v-model="form.season" placeholder="请选择状态">
          <el-option label="完结" value="完结" />
          <el-option label="更新中" value="更新中" />
          <el-option label="未上映" value="未上映" />
        </el-select>
      </el-form-item>
      <el-form-item label="一级分类">
        <el-select v-model="form.type" placeholder="请选择">
          <el-option :label="item.name" :value="item.id" v-for="item in opserws" :key="item.id"/>
        </el-select>
      </el-form-item>
      <el-form-item label="二级分类">
<!--        <el-input v-model="form.category" />-->
        <el-select v-model="form.category" placeholder="请选择">
          <el-option :label="item.classname" :value="item.classid" v-for="item in opserws2" :key="item.id"/>
        </el-select>
        <el-button type="primary" style="margin-left: 15px" @click="getcateas(2)">刷新</el-button>
      </el-form-item>
      <el-form-item label="推荐">
        <el-select v-model="form.recommend" placeholder="请选择">
          <el-option label="是" value="1" />
          <el-option label="否" value="0" />
        </el-select>
      </el-form-item>
      <el-form-item label="开始时间">
        <el-date-picker
            v-model="form.date"
            type="date"
            placeholder="Pick a Date"
            format="YYYY/MM/DD"
            value-format="YYYY-MM-DD"
        />
      </el-form-item>
      <el-form-item label="更新时间">
        <el-select v-model="form.updatetime" placeholder="请选择星期">
          <el-option label="周一" value="周一" />
          <el-option label="周二" value="周二" />
          <el-option label="周三" value="周三" />
          <el-option label="周四" value="周四" />
          <el-option label="周五" value="周五" />
          <el-option label="周六" value="周六" />
          <el-option label="周日" value="周日" />
        </el-select>
      </el-form-item>
      <div class="tru_button">
        <el-button  @click="plk">取消</el-button>
        <el-button type="primary" @click="getsetviod">确定</el-button>
      </div>
    </el-form>
  </el-dialog>
</template>

<script setup>
import {reactive, ref,watch} from "vue";
import {getvideobyid,getcate,setviod} from "@/api/video_list"
import {bus} from "@/utils/mitt"
import {ElMessage} from "element-plus";

bus.on("void",res=>{
  form.id = res.id
})

const form = reactive({
  id:'',
  title:'',
  cover:'',
  season:'',
  type:'',
  category:'',
  recommend:'',
  date:'',
  updatetime:''
})

//获取数据 id
const uiop = async () =>{
  const res = await getvideobyid(form.id)
  form.title = res.data[0].title
  form.cover = res.data[0].cover
  form.season = res.data[0].season
  form.type = res.data[0].type
  form.category = res.data[0].category
  form.recommend = res.data[0].recommend
  form.date = res.data[0].date
  form.updatetime = res.data[0].updatetime
  getcateas()
}

//获取分类
const opserws = ref([])
const opserws2 = ref([])
const getcateas = async (ac) =>{
  if(ac == 2){
    form.category = ""
  }
  const res = await getcate()
  let a = form.type - 1
  opserws.value = res.data.filtersConfig
  opserws2.value = res.cate[a].ops
  console.log(res.cate[a].ops)
  // console.log(res.cate[0].ops)
}

const size = ref<'default' | 'large' | 'small'>('default')

const getsetviod= async ()=>{
  const res = await setviod(form)
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