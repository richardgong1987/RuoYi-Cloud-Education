import request from '@/utils/request'

// 查询会员管理列表
export function listManagementMemberships(query) {
  return request({
    url: '/edu-admin/peoples/managementMemberships/list',
    method: 'get',
    params: query
  })
}

// 查询会员管理详细
export function getManagementMemberships(id) {
  return request({
    url: '/edu-admin/peoples/managementMemberships/' + id,
    method: 'get'
  })
}

// 新增会员管理
export function addManagementMemberships(data) {
  return request({
    url: '/edu-admin/peoples/managementMemberships',
    method: 'post',
    data: data
  })
}

// 修改会员管理
export function updateManagementMemberships(data) {
  return request({
    url: '/edu-admin/peoples/managementMemberships',
    method: 'put',
    data: data
  })
}

// 删除会员管理
export function delManagementMemberships(id) {
  return request({
    url: '/edu-admin/peoples/managementMemberships/' + id,
    method: 'delete'
  })
}
