import request from "@/utils/request";
import {getUserId} from "@/utils/ruoyi";

export function get(url, params={}) {
  params.userId = getUserId();
  return request({
    url: `/file${url}`,
    method: 'get',
    params: params
  })
}
function setUserIdToUrl(url) {
  let userId = getUserId();
  return `/file${url}?userId=${userId}`
}
export function post(url, data = {}, info) {
  return request({
    url: setUserIdToUrl(url),
    method: 'post',
    data: data
  })
}

/**
 * 封装 put 方法，对应 PUT 请求
 * @param {string} url 请求url
 * @param {object} params 请求体
 * @returns {Promise}
 */
export function put(url, params = {}) {

  return request({
    url: setUserIdToUrl(url),
    method: 'put',
    data: params
  })
}
