<template>
  <el-dialog v-model="dialogUserVisible" title="影片信息" width="800px" center draggable>
    <el-form :model="form" label-width="auto">
      <el-form-item label="影片名称">
        <el-input v-model="form.title" disabled/>
      </el-form-item>
      <el-form-item label="资源1集数">
      <el-input
          v-model="form.textarea1"
          style="width: 100%"
          :rows="6"
          type="textarea"
          placeholder="Please input"
      />
      </el-form-item>
      <el-form-item label="资源2集数">
        <el-input
            v-model="form.textarea2"
            style="width: 100%"
            :rows="6"
            type="textarea"
            placeholder="Please input"
        />
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
import {allsetid,getcate,setviodepis} from "@/api/video_list"
import {bus} from "@/utils/mitt"
import {ElMessage} from "element-plus";

bus.on("voidxx",res=>{
  cxid.value = res.id
})
const cxid = ref("")
const form = reactive({
  id:'',
  title:'',
  textarea1:'',
  textarea2:''
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
  const res = await allsetid(cxid.value)
  form.title = res.data[0].title
  form.id = cxid.value
  ops(res.data[0].datelist)
}
const ops = (obj) =>{
  // 遍历对象的每个属性
  for (let key in obj) {
    if (obj.hasOwnProperty(key) && Array.isArray(obj[key])) {
      // 对于每个数组，遍历其元素
      if(key == 1 ){
        obj[key].forEach(element => {
          form.textarea1 += element + "\n"
        });
      }
      if(key == 2 ){
        obj[key].forEach(element => {
          form.textarea2 += element + "\n"
        });
      }
    }
  }
}

const getsetviod = async ()=>{
  form.textarea1 = uio(form.textarea1)
  form.textarea2 = uio(form.textarea2)
  const res = await setviodepis(form)
  if(res.status.error_code == 0){
    ElMessage({
      message: '修改成功',
      type: 'success',
    })
    dialogUserVisible.value = false
  }
}
const uio = (text) =>{
  // 检查字符串的最后一个字符是否为换行符，并去除它
  if (text.endsWith('\n')) {
    let test = text.slice(0, -1);// 去除最后一个字符
    return  test.replace(/\n\s*/g, ',')//换成,
  }
}

//控制弹窗
const dialogUserVisible = ref(false)
const plk = () =>{
  dialogUserVisible.value = false
}
const qk = (state) =>{
  // 重置每个属性
  for (let key in state) {
    state[key] = "";
  }
}
//打开创建管理员弹窗
const open = async() =>{
  qk(form)
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