import axios from "@/utils/axios";

/**
 * 获取影视基础信息
 */
export function getvideo() {
    return axios({
        url: "/video/all",
        method: "get",
    });
}

/**
 * 获取影视基础信息 id
 */
export function getvideobyid(id) {
    return axios({
        url: "/video/getviod",
        method: "post",
        data: {
            id
        }
    });
}

/**
 * 获取影视基础信息 搜索
 */
export function getviodtitle(title) {
    return axios({
        url: "/video/getviodtitle",
        method: "post",
        data: {
            title
        }
    });
}

/**
 * 获取分类信息
 */
export function getcate() {
    return axios({
        url: "/video/getcate",
        method: "get",
    });
}

/**
 * 修改影视基础信息
 */
export function setviod(params){
    return axios({
        url: "/video/setviod",
        method: "post",
        data: params
    });
}

/**
 * 获取影视详细信息
 */
export function getallset() {
    return axios({
        url: "/video/allset",
        method: "get",
    });
}

/**
 * 获取影视详细信息 id
 */
export function allsetid(id) {
    return axios({
        url: "/video/allsetid",
        method: "post",
        data:{
            id
        }
    });
}
/**
 * 修改影视基础信息
 */
export function setviodse(params){
    return axios({
        url: "/video/setviodse",
        method: "post",
        data: params
    });
}

/**
 * 修改影视剧集信息
 */
export function setviodepis(params){
    return axios({
        url: "/video/setviodepis",
        method: "post",
        data: params
    });
}

/**
 * 新增全部信息
 */
export function installset(id){
    return axios({
        url: "/video/installset",
        method: "get",
        data: {
            id
        }
    });
}

/**
 * 删除全部信息
 */
export function dalelist(id){
    return axios({
        url: "/video/dalelist",
        method: "post",
        data: {
            id
        }
    });
}