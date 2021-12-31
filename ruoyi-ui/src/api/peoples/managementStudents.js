import request from '@/utils/request'

// 查询学生管理列表
export function listManagementStudents(query) {
  return request({
    url: '/edu-admin/peoples/managementStudents/list',
    method: 'get',
    params: query
  })
}

// 查询学生管理详细
export function getManagementStudents(id) {
  return request({
    url: '/edu-admin/peoples/managementStudents/' + id,
    method: 'get'
  })
}

// 新增学生管理
export function addManagementStudents(data) {
  return request({
    url: '/edu-admin/peoples/managementStudents',
    method: 'post',
    data: data
  })
}

// 修改学生管理
export function updateManagementStudents(data) {
  return request({
    url: '/edu-admin/peoples/managementStudents',
    method: 'put',
    data: data
  })
}

// 删除学生管理
export function delManagementStudents(id) {
  return request({
    url: '/edu-admin/peoples/managementStudents/' + id,
    method: 'delete'
  })
}
