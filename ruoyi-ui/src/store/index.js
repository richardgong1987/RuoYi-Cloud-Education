import Vue from 'vue'
import Vuex from 'vuex'
import app from './modules/app'
import user from './modules/user'
import tagsView from './modules/tagsView'
import permission from './modules/permission'
import settings from './modules/settings'
import getters from './getters'

import fileList from './modules/fileList' //  文件列表模块
import sideMenu from './modules/sideMenu' //  左侧菜单模块
import common from './modules/common' //  公共模块

Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    app,
    user,
    tagsView,
    permission,
    settings,
    fileList,
    sideMenu,
    common
  },
  getters
})

export default store
