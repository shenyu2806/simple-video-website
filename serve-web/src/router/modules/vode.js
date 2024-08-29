/** When your routing table is too long, you can split it into small modules**/

import Layout from "@/layout";

export default {
    path: "/vodeo",
    component: Layout,
    redirect: "/vodeo/list",
    alwaysShow: true, // will always show the root menu
    name: "videolist",
    meta: {
        title: "影片管理",
        icon: "permission"
    },
    children:[
        {
            path: "/vodeo/list",
            component: () => import("@/views/vidoe/basicinfor/index.vue"),
            name: "videodelist",
            meta: { title: "基础信息", icon: "role" }
        },
        {
            path: "/vodeo/detailslist",
            component: () => import("@/views/vidoe/details/index.vue"),
            name: "detailslist",
            meta: { title: "详细信息", icon: "role" }
        },
        {
            path: "/vodeo/episodeslist",
            component: () => import("@/views/vidoe/episodes/index.vue"),
            name: "episodeslist",
            meta: { title: "影片剧集", icon: "role" }
        },
    ]
}