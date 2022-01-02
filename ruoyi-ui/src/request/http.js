import request from "@/utils/request";

export function get(url, params) {
  return request({
    url: `/file${url}`,
    method: 'get',
    params: params
  })
}
export function post(url, data = {}, info) {
  return request({
    url: `/file${url}`,
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
    url: `/file${url}`,
    method: 'put',
    data: params
  })
}

/**
 * 封装 axiosDelete 方法，对应 DELETE 请求
 * @param {string} url 请求url
 * @param {object} params 请求体
 * @returns {Promise}
 */
export function axiosDelete(url, params = {}) {
  return request({
    url: `/file${url}`,
    method: 'delete'
  })
}
