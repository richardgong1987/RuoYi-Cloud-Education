import request from '@/utils/request'

// 查询班级管理列表
export function listTeacherClasses(query) {
  return request({
    url: '/edu-admin/teachers/teacherClasses/list',
    method: 'get',
    params: query
  })
}

// 查询班级管理详细
export function getTeacherClasses(id) {
  return request({
    url: '/edu-admin/teachers/teacherClasses/' + id,
    method: 'get'
  })
}

// 新增班级管理
export function addTeacherClasses(data) {
  return request({
    url: '/edu-admin/teachers/teacherClasses',
    method: 'post',
    data: data
  })
}

// 修改班级管理
export function updateTeacherClasses(data) {
  return request({
    url: '/edu-admin/teachers/teacherClasses',
    method: 'put',
    data: data
  })
}

// 删除班级管理
export function delTeacherClasses(id) {
  return request({
    url: '/edu-admin/teachers/teacherClasses/' + id,
    method: 'delete'
  })
}
