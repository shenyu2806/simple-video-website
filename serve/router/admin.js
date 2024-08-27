const express = require('express')
const router = express.Router()
const fs = require('fs');
const image = require("imageinfo");

//登录
router.post('/login', (req, res) => {
    res.send(
        {
            "code": "00000",
            "data": {
                "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImRlcHRJZCI6MSwiZGF0YVNjb3BlIjoxLCJleHAiOjE3MjQ3NDQxODEsInVzZXJJZCI6MiwiaWF0IjoxNzI0NzM2OTgxLCJhdXRob3JpdGllcyI6WyJST0xFX0FETUlOIl0sImp0aSI6IjFmNzdjZWM3NDlkMjQ1Yjc5MDY5ZWNlNmQzZWRlZGIwIn0.dKO6Xxk7UOGkuoZA751A57TpFQOPJadoqQOHNG_kgiQ",
                "tokenType": "Bearer",
                "refreshToken": null,
                "expires": null
            },
            "msg": "一切ok"
        }
    )
});

//用户登录
router.get('/users/me', (req, res) => {
    res.send(
        {
            "code": "00000",
            "data": {
                "userId": 2,
                "username": "admin",
                "nickname": "系统管理员",
                "avatar": "https://foruda.gitee.com/images/1723603502796844527/03cdca2a_716974.gif",
                "roles": [
                    "ADMIN"
                ],
                "perms": []
            },
            "msg": "一切ok"
        }
    )
});

router.get('/menus/routes', (req, res) => {
    res.send({
        "code": "00000",
            "data": [
                {
                    "path": "/system",
                    "component": "Layout",
                    "redirect": "/system/user",
                    "name": "/system",
                    "meta": {
                        "title": "系统管理",
                        "icon": "system",
                        "hidden": false,
                        "alwaysShow": false,
                        "params": null
                    },
                    "children": [
                        {
                            "path": "user",
                            "component": "system/user/index",
                            "name": "User",
                            "meta": {
                                "title": "用户管理",
                                "icon": "el-icon-User",
                                "hidden": false,
                                "keepAlive": true,
                                "alwaysShow": false,
                                "params": null
                            }
                        },
                        {
                            "path": "role",
                            "component": "system/role/index",
                            "name": "Role",
                            "meta": {
                                "title": "角色管理",
                                "icon": "role",
                                "hidden": false,
                                "keepAlive": true,
                                "alwaysShow": false,
                                "params": null
                            }
                        },
                        {
                            "path": "log",
                            "component": "system/log/index",
                            "name": "Log",
                            "meta": {
                                "title": "系统日志",
                                "icon": "document",
                                "hidden": false,
                                "keepAlive": true,
                                "alwaysShow": false,
                                "params": null
                            }
                        },
                        {
                            "path": "config",
                            "component": "system/config/index",
                            "name": "Config",
                            "meta": {
                                "title": "系统配置",
                                "icon": "setting",
                                "hidden": false,
                                "keepAlive": true,
                                "alwaysShow": false,
                                "params": null
                            }
                        }
                    ]
                },
                {
                    "path": "/video",
                    "component": "Layout",
                    "redirect": "/video/basis",
                    "name": "/video",
                    "meta": {
                        "title": "影视管理",
                        "icon": "video",
                        "hidden": false,
                        "alwaysShow": false,
                        "params": null
                    },
                    "children": [
                        {
                            "path": "basis",
                            "component": "video/basis/index",
                            "name": "basis",
                            "meta": {
                                "title": "影视基础信息",
                                "icon": "setting",
                                "hidden": false,
                                "keepAlive": true,
                                "alwaysShow": false,
                                "params": null
                            }
                        },
                        {
                            "path": "content",
                            "component": "video/content/index",
                            "name": "content",
                            "meta": {
                                "title": "影视内容信息",
                                "icon": "setting",
                                "hidden": false,
                                "keepAlive": true,
                                "alwaysShow": false,
                                "params": null
                            }
                        }
                    ]
                }
            ],
            "msg": "一切ok"
    })
});
router.get('/captcha', (req, res) => {
res.send({
    "code": "00000",
    "data": {
        "captchaKey": "4d5d1b76260d46fd9b9bb67704b4ada0",
        "captchaBase64": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAAoCAYAAAA16j4lAAAC/klEQVR4Xu2ZzW8SQRTA+/+Y+F950Iu2xmg0fkU9GL2oiacmGk3QW60pNjExMVrbi22hUFOEQgvUWgO7JcvaBXbnubObbmem24JhFtjh/cjLzs57e+HHMB87AYjSTIgdiFqgYMVBwYoTS8Fnzq1ygZxM7ASHCQ3rQ3xiJfg0kaflxhkUrDgoWHFiJZgSJjKsD/GJnWAKrqJ7J5aCkd7hBFukDUkzDQ/25+BS/Y0bCa9N+2guSpzlpBeDpDCZ6hpxJxCsOSbc0mfgfO1VaNAcrYkKFBwNnmCHEHjUmA9k3tZmoGYbXrDSaQ1xPzIg5SyQojt/mvvePSe4qbu5FSCVdeYJ+agk8iQ8wWutCjdaF61CUPD1IMflaK0U9F0guSVf7MZiINjZ+OZfc4tAtF/iU1IZG8EvjQVO4o6tBwXVjsblXri1MiH1Kjir80eCVz4AqUn6EXVhbATf1Wc5iaZjBQVNYnE5WisFOoJ/+iM4GMlMm15pTZSwgrfurEPhchqK1zNQfZqHxlIdiCNnOhomnuBJd8XMSnSYedZ279jclFsrg1PnYLdv0HNwWOxOl0DSkiNgfbb039EPnuALtdecRHYhRdtsjtZGwTBW0TvP8mAsa9CutcCxbGhmG1C6meUk65//iI/1hSivl+iHriO4Q6IZwSLDEByGsaJzgiuPc2JJrAifg0krKDCimoNHFMe0OcGbV9fEkljRdRVd6dS5nOxV9KghCi5ey4glfSH+/fYS/RC6D16w8kHBl6j2wSOK8V3jBFefHH0XMhDl9RL9EH6Spb/zT7Kc4ydZtFYFyg83QPv4G6xtE2yjA85f25t/izcynGDaF2dG5ix60LASQ2MqBfVktPtwmbxtnQ2C5djbpDkzBff093CxnvCCtmlf1G+TBk17zwL90x7sPC/A9v0f3mJq80raa+8lynCw1RQfGVlEqew9vg9WABSsMKLcQw77UXDMQcGKg4IVBwUrDgpWHBSsOCh4DBAl4z5YMVDwGEClHgYLClYcFKw4/wA5Q4155LwUrwAAAABJRU5ErkJggg=="
    },
    "msg": "一切ok"
})
});
module.exports = router;