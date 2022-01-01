import { allColumnList } from '@/libs/map.js'
const getters = {
  sidebar: state => state.app.sidebar,
  size: state => state.app.size,
  device: state => state.app.device,
  visitedViews: state => state.tagsView.visitedViews,
  cachedViews: state => state.tagsView.cachedViews,
  token: state => state.user.token,
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  introduction: state => state.user.introduction,
  roles: state => state.user.roles,
  permissions: state => state.user.permissions,
  permission_routes: state => state.permission.routes,
  topbarRouters:state => state.permission.topbarRouters,
  defaultRoutes:state => state.permission.defaultRoutes,
  sidebarRouters:state => state.permission.sidebarRouters,

  // 登录状态
  isLogin: (state) => state.user.isLogin,
  // 用户姓名
  username: (state) => state.user.userInfoObj.username,
  // 用户ID
  userId: (state) => state.user.userInfoObj.userId,
  // 表格显示列
  selectedColumnList: (state) =>
    state.fileList.selectedColumnList === null
      ? allColumnList
      : state.fileList.selectedColumnList.split(','),
  // 文件查看模式
  fileModel: (state) =>
    state.fileList.fileModel === null ? 0 : Number(state.fileList.fileModel),
  // 网格模式 & 时间线模式下 文件图标大小
  gridSize: (state) => state.fileList.gridSize,
  // 剩余存储空间
  remainderStorageValue: (state) =>
    state.sideMenu.totalStorageValue - state.sideMenu.storageValue
}
export default getters
