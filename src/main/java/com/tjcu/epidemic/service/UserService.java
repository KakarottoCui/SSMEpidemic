package com.tjcu.epidemic.service;

import com.tjcu.epidemic.bean.UserInfo;

public interface UserService {
    UserInfo login(UserInfo userInfo);

    void userInput(UserInfo userInfo);

    UserInfo queryUserByAccount(String account);

    int updateUser(UserInfo userInfo);
}
