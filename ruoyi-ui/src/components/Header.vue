<template>
  <div class="header-wrapper">
    <el-menu
      :default-active="activeIndex"
      class="top-menu-list"
      mode="horizontal"
      router
    >
      <el-menu-item
        index="index"
        :route="{ path: backName }"
      >返回
      </el-menu-item>
      <el-menu-item v-if="teacherName"
      >{{teacherName}}>老师的讲义
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script>
import {mapGetters} from 'vuex'
import cache from "@/plugins/cache";

export default {
  name: 'Header',
  data() {
    return {
      backName: '/index',
      teacherName:''
    }
  },
  created() {
    if (location.pathname.includes("/teachers/teacherHandouts/")) {
      this.backName =   "/teachers/teacherInfos";
      this.teacherName = cache.session.get("teacherName");
    } else {
      this.backName =   "/index";
      this.teacherName = '';
    }
  },
  computed: {
    ...mapGetters(['isLogin', 'username']),
    // 当前激活菜单的 index
    activeIndex() {
      return this.$route.name || 'Home' //  获取当前路由名称
    },
    isProductEnv() {
      return (
        process.env.NODE_ENV !== 'development' &&
        location.origin === 'https://pan.qiwenshare.com'
      )
    },
    // 屏幕宽度
    screenWidth() {
      return this.$store.state.common.screenWidth
    }
  },
  methods: {
    /**
     * 退出登录
     * @description 清除 cookie 存放的 token  并跳转到登录页面
     */
    exitButton() {
      this.$message.success('退出登录成功！')
      this.$store.dispatch('getUserInfo').then(() => {
        this.removeCookies(this.$config.tokenKeyName)
        this.$router.push({path: '/login'})
      })
    }
  }
}
</script>

<style lang="scss" scoped>
@import '~_a/styles/varibles.scss';

.header-wrapper {
  width: 100%;
  padding: 0 20px;
  box-shadow: $tabBoxShadow;
  display: flex;

  .logo {
    margin: 14px 24px 0 24px;
    display: inline-block;
    height: 40px;
    cursor: pointer;
  }

  .logo-xs {
    display: none;
  }

  ::v-deep .el-menu--horizontal {
    .el-menu-item:not(.is-disabled):hover {
      border-bottom-color: $Primary !important;
      background: $tabBackColor;
    }

    .external-link {
      padding: 0;

      a {
        display: block;
        padding: 0 20px;
      }
    }
  }

  .top-menu-list {
    flex: 1;

    .login, .register, .username, .exit, .user-exit-submenu {
      float: right;
    }
  }
}
</style>
