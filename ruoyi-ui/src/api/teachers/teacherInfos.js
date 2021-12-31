import request from '@/utils/request'

// 查询老师信息列表
export function listTeacherInfos(query) {
  return request({
    url: '/edu-admin/teachers/teacherInfos/list',
    method: 'get',
    params: query
  })
}

// 查询老师信息详细
export function getTeacherInfos(id) {
  return request({
    url: '/edu-admin/teachers/teacherInfos/' + id,
    method: 'get'
  })
}

// 新增老师信息
export function addTeacherInfos(data) {
  return request({
    url: '/edu-admin/teachers/teacherInfos',
    method: 'post',
    data: data
  })
}

// 修改老师信息
export function updateTeacherInfos(data) {
  return request({
    url: '/edu-admin/teachers/teacherInfos',
    method: 'put',
    data: data
  })
}

// 删除老师信息
export function delTeacherInfos(id) {
  return request({
    url: '/edu-admin/teachers/teacherInfos/' + id,
    method: 'delete'
  })
}
