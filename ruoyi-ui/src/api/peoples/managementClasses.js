import request from '@/utils/request'

// 查询班级管理列表
export function listManagementClasses(query) {
  return request({
    url: '/edu-admin/peoples/managementClasses/list',
    method: 'get',
    params: query
  })
}

// 查询班级管理详细
export function getManagementClasses(id) {
  return request({
    url: '/edu-admin/peoples/managementClasses/' + id,
    method: 'get'
  })
}

// 新增班级管理
export function addManagementClasses(data) {
  return request({
    url: '/edu-admin/peoples/managementClasses',
    method: 'post',
    data: data
  })
}

// 修改班级管理
export function updateManagementClasses(data) {
  return request({
    url: '/edu-admin/peoples/managementClasses',
    method: 'put',
    data: data
  })
}

// 删除班级管理
export function delManagementClasses(id) {
  return request({
    url: '/edu-admin/peoples/managementClasses/' + id,
    method: 'delete'
  })
}
