package com.ruoyi.auth.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.nacos.api.common.Constants;
import com.ruoyi.auth.form.LoginBody;
import com.ruoyi.auth.form.RegisterBody;
import com.ruoyi.auth.service.SysLoginService;
import com.ruoyi.common.core.domain.R;
import com.ruoyi.common.core.exception.ServiceException;
import com.ruoyi.common.core.utils.JwtUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.security.auth.AuthUtil;
import com.ruoyi.common.security.service.TokenService;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.api.model.LoginUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

import java.util.Map;

/**
 * token 控制
 *
 * @author ruoyi
 */
@Slf4j
@RestController
public class TokenController {
    @Autowired
    private TokenService tokenService;

    @Autowired
    private SysLoginService sysLoginService;

    @PostMapping("login")
    public R<?> login(@RequestBody LoginBody form)
    {
        // 用户登录
        LoginUser userInfo = sysLoginService.login(form.getUsername(), form.getPassword());
        // 获取登录token
        return R.ok(tokenService.createToken(userInfo));
    }

    @PostMapping("wxlogin")
    public R<?> wxlogin(String appId, String code) {
        String _prefix = "【小程序登录】";
        log.info("{}appId：{}, 临时凭证：{}", _prefix, appId, code);
        try {
            if (StringUtils.isEmpty(appId)) {
                throw new ServiceException("appId为空");
            }
            // 用户登录凭证（有效期五分钟）
            if (StringUtils.isEmpty(code)) {
                throw new ServiceException("登录凭证不能为空");
            }
//            WxConfig config = new WxConfigImpl(appId);
//            WxaLogin wxaLogin = new WxaLogin(config);
//            String result = wxaLogin.code2Session(code);
//            log.info("{}微信根据code获取用户信息结果：{}", _prefix, result);
//            JSONObject code2SessionRes = JSON.parseObject(result);
//            String openId = code2SessionRes.getString("openid");
//            String sessionKey = code2SessionRes.getString("session_key");
//            if (StringUtils.isEmpty(openId)) {
//                throw new ServiceException("登录失败，无效的登录凭证");
//            }
//             生成令牌
//            LoginUser userInfo = sysLoginService.wxLogin(openId, sessionKey);
//            Map<String, Object> token = tokenService.createToken(userInfo);
//            return R.ok(token);
//            log.info("{}生成的token：{}", _prefix, token);
//            return R.ok(token);
        } catch (Exception e) {
            String msg = "接口异常";
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            log.error("{}接口发生异常：{}", _prefix, e);
            throw new ServiceException(msg);
        }
        // 用户登录
//        LoginUser userInfo = sysLoginService.wxLogin(form.getUsername(), form.getPassword());
        // 获取登录token
//        return R.ok(tokenService.createToken(userInfo));
        return R.ok(tokenService.createToken(new LoginUser()));
    }

    @DeleteMapping("logout")
    public R<?> logout(HttpServletRequest request)
    {
        String token = SecurityUtils.getToken(request);
        if (StringUtils.isNotEmpty(token))
        {
            String username = JwtUtils.getUserName(token);
            // 删除用户缓存记录
            AuthUtil.logoutByToken(token);
            // 记录用户退出日志
            sysLoginService.logout(username);
        }
        return R.ok();
    }

    @PostMapping("refresh")
    public R<?> refresh(HttpServletRequest request)
    {
        LoginUser loginUser = tokenService.getLoginUser(request);
        if (StringUtils.isNotNull(loginUser))
        {
            // 刷新令牌有效期
            tokenService.refreshToken(loginUser);
            return R.ok();
        }
        return R.ok();
    }

    @PostMapping("register")
    public R<?> register(@RequestBody RegisterBody registerBody)
    {
        // 用户注册
        sysLoginService.register(registerBody.getUsername(), registerBody.getPassword());
        return R.ok();
    }
}
