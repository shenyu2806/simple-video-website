const express = require('express')
const router = express.Router()
const fs = require('fs');
const image = require("imageinfo");

const getCodeOfRandom = () => {
	// 所需随机抽取的样本数组
	const nums = new Array("q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
	// 初始化 拼接字符串
	let str = "";
	for (let i = 0; i < 4; i++) {
		// 每次生成一个0 - 61 之间的 number 作为随机获取验证码的下标
		const p = Math.floor(Math.random() * 1000) % 36;
		// 拼接验证码  随机抽取大小写字母和数字
		str += nums[p];
	}
	return str;
};

//验证码获取
router.post('/getCaptchaCode', (req, res) => {
    res.send(
        {
            "status": {
                "error_code": 0,
                "error_msg": "success"
            },
            "obj": {
                "code_key": "6012e9ba65b442d2e5e7fec6e8eabcfd",
                "code": getCodeOfRandom()//验证码
            }
        }
    )
});

//用户登录
router.post('/login', (req, res) => {
    const { username,password,captcha_code,code_key } = req.body;
    res.send(
        {
            "status": {
                "error_code": 0,
                "error_msg": "success"
            },
            "obj": {
                "sys_token": "d33a7fdf547d2a086a96f4d38253cbc9",
                "admin_nick_name": "神月恭平",
                "admin_id": "1",
                "avatar": "https://foruda.gitee.com/avatar/1723290893308622047/8841114_fs529_1723290893.png!avatar200"
            }
        }
    )
});
router.post('/getPermission', (req, res) => {
res.send({status: {
    error_code: 0,
    error_msg: "success"
},
obj: [
    {
        id: "1",
        name: "权限管理",
        parent_id: "0",
        type: "1",
        url: "/adminAuth/getRoleList",
        icon: "permission",
        children: [
            // {
            //     id: "1-1",
            //     name: "角色列表",
            //     parent_id: "1",
            //     type: "2",
            //     url: "/adminAuth/getRoleList",
            //     icon: "permission",
            //     hidden: true,
            //     buttonList: [
            //         {
            //             id: "1-1-1",
            //             name: "查询",
            //             parent_id: "2",
            //             type: "3",
            //             url: "/adminAuth/getRoleList",
            //             hidden: true
            //         },
            //         {
            //             id: "1-1-2",
            //             name: "配置权限",
            //             parent_id: "2",
            //             type: "3",
            //             url: "/adminAuth/setting",
            //             hidden: true
            //         }
            //     ]
            // },
            // {
            //     id: "1-2",
            //     name: "账号列表",
            //     parent_id: "1",
            //     icon: "permission",
            //     type: "2",
            //     url: "/adminAuth/adminList",
            //     hidden: true,
            //     buttonList: [
            //         {
            //             id: "1-2-1",
            //             name: "查询",
            //             parent_id: "1-2",
            //             type: "3",
            //             url: "/adminAuth/list",
            //             hidden: true
            //         },
            //         {
            //             id: "1-2-2",
            //             name: "查看",
            //             parent_id: "1-2",
            //             type: "3",
            //             url: "/adminAuth/look",
            //             hidden: true
            //         },
            //         {
            //             id: "1-2-3",
            //             name: "角色",
            //             parent_id: "1-2",
            //             type: "3",
            //             url: "/adminAuth/role",
            //             hidden: true
            //         },
            //         {
            //             id: "1-2-4",
            //             name: "删除",
            //             parent_id: "1-2",
            //             type: "3",
            //             url: "/adminAuth/del",
            //             hidden: true
            //         }
            //     ]
            // },
            {
                id: "1-3",
                name: "权限列表",
                icon: "permission",
                parent_id: "1",
                type: "2",
                url: "/adminAuth/permissionList"

             },
            // {
            //     id: "1-4",
            //     name: "账号详情",
            //     icon: "permission",
            //     parent_id: "1",
            //     type: "2",
            //     url: "/account/detail",
            //     hidden: true

            // }
        ]
    },{
        id: "2",
        name: "影片管理",
        parent_id: "0",
        type: "2",
        url: "/vodeo/list",
        icon: "permission",
        children: [
            {
                "id": "2-1",
                "name": "基础信息",
                "icon": "permission",
                "parent_id": "1",
                "type": "2",
                "url": "/vodeo/list",
            },
            {
                "id": "2-2",
                "name": "详细信息",
                "icon": "permission",
                "parent_id": "2",
                "type": "2",
                "url": "/vodeo/detailslist",
            },
            {
                "id": "2-3",
                "name": "影片剧集",
                "icon": "permission",
                "parent_id": "3",
                "type": "2",
                "url": "/vodeo/episodeslist",
            }
        ]
    }]
})
});
module.exports = router;