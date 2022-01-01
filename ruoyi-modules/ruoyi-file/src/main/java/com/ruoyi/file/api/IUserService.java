package com.ruoyi.file.api;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qiwenshare.common.result.RestResult;
import com.ruoyi.file.domain.UserBean;

public interface IUserService extends IService<UserBean> {

    UserBean getUserBeanByToken(String token);

    UserBean selectUserByopenid(String openid);

    /**
     * 用户注册
     *
     * @param userBean 用户信息
     * @return 结果
     */
    RestResult<String> registerUser(UserBean userBean);


    UserBean findUserInfoByTelephone(String telephone);


}
