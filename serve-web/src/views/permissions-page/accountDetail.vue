<template>
	<div class="user-info-container">
		<el-card class="print-box">
			<el-button v-print="printObj" type="primary" :loading="printLoading">打印</el-button>
		</el-card>
		<el-card>
			<div id="userInfoBox" class="user-info-box">
				<!-- 标题 -->
				<h2 class="title">账号信息</h2>

				<div class="header">
					<!-- 头部渲染表格 -->
					<el-descriptions :column="2" border>
						<el-descriptions-item label="用户ID">1035946</el-descriptions-item>
						<el-descriptions-item label="性别">
							男
						</el-descriptions-item>
						<el-descriptions-item label="民族">
							汉族
						</el-descriptions-item>
						<el-descriptions-item label="手机号">
							178XXX9875
						</el-descriptions-item>
						<el-descriptions-item label="居住地">广东省中山市xxx</el-descriptions-item>
						<el-descriptions-item label="入职时间">2021年04月06日</el-descriptions-item>
						<el-descriptions-item label="备注" :span="2">
							<el-tag size="small">项目经理</el-tag><el-tag style="margin-left: 5px" size="small">运维师</el-tag>
						</el-descriptions-item>
						<el-descriptions-item
							label="联系地址"
							:span="2"
						>
							浙江省杭州市上城区xxx
						</el-descriptions-item>
					</el-descriptions>
					<!-- 头像渲染 -->
					<el-image
						class="avatar"
						src="https://foruda.gitee.com/avatar/1723290893308622047/8841114_fs529_1723290893.png!avatar200"
					></el-image>
				</div>
				<div class="body">
					<!-- 内容渲染表格 -->
					<el-descriptions direction="vertical" :column="1" border>
						<el-descriptions-item label="经历">
							<ul>
								<li>
									<span>2021~2024</span>
									<span>广东省xxxx公司</span>
									<span>项目经理、产品经理、主管</span>
								</li>
							</ul>
						</el-descriptions-item>
						<el-descriptions-item label="专业">
							计算机应用技术、软件技术、项目架构师、UI设计师
						</el-descriptions-item>
					</el-descriptions>
				</div>
				<!-- 尾部签名 -->
				<div class="foot">签字：___________日期:___________</div>
			</div>
		</el-card>
	</div>
</template>

<style lang="scss" scoped>
.print-box {
  margin-bottom: 20px;
  text-align: right;
}
.user-info-box {
  margin: 0 auto;
  width: 1024px;
  .title {
    margin-bottom: 18px;
    text-align: center;
  }
  .header {
    display: flex;
    ::v-deep .el-descriptions {
      flex-grow: 1;
    }
    .avatar {
      box-sizing: border-box;
      padding: 30px 20px;
      border: 1px solid #ebeef5;
      border-left: none;
      width: 187px;
    }
    .remark {
      margin-right: 12px;
    }
  }
  .body {
    ul {
      list-style: none;
      li {
        span {
          margin-right: 62px;
        }
      }
    }
  }
  .foot {
    margin-top: 42px;
    text-align: right;
  }
}
</style>

<script setup>
import { useRoute } from "vue-router";
import { ref, watch } from "vue";

const route = useRoute();

const userInfo = ref({});

// 打印相关
const printLoading = ref(false);
const printObj = {
	// 打印区域
	id: "userInfoBox",
	// 打印标题
	popTitle: "admin-vue3-vite",
	// 打印前
	beforeOpenCallback(vue) {
		printLoading.value = true;
	},
	// 执行打印
	openCallback(vue) {
		printLoading.value = false;
	}
};
watch(
	() => route.query.id,
	val => {
		if (val) {
			userInfo.value = route.query;
			//console.log("watch= ", route.query);
		}
	}, // 第一次进来也触发
	{
		immediate: true
	}
);
</script>
<script>
export default {
	name: "account-detail"
};
</script>