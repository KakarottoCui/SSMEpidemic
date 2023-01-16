package com.tjcu.epidemic.service.impl;

import com.tjcu.epidemic.bean.UserInfo;
import com.tjcu.epidemic.mapper.UserMapper;
import com.tjcu.epidemic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 如果要纳入spring容器的类，不属于框架的任何一层，就加@Component
 * 如果该类属于控制层，就加@Controller
 * 服务层，就加@Service
 * 持久层，就加@Repository/@Mapper
 * 以上注解可以通用
 */
//@Component
@Service("userService")  //将该类与实现类纳入spring容器的管理
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public UserInfo login(UserInfo userInfo) {
        UserInfo user = userMapper.login(userInfo);
        System.out.println("userservice"+user);
        return user;
    }

    @Override
    public void userInput(UserInfo userInfo) {
        userMapper.userInput(userInfo);
    }

    @Override
    public UserInfo queryUserByAccount(String account) {
        UserInfo userInfo = userMapper.queryUserByAccount(account);
        return userInfo;
    }

    @Override
    public int updateUser(UserInfo userInfo) {
        return userMapper.updateUser(userInfo);
    }
}
