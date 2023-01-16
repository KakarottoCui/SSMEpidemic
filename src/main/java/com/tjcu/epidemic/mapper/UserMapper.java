package com.tjcu.epidemic.mapper;

import com.tjcu.epidemic.bean.UserInfo;
import org.apache.ibatis.annotations.*;

@Mapper
public interface UserMapper {
    //@Select(value= {"",""})
    @Select("select * from users where account=#{account} and password=#{password}")
    UserInfo login(UserInfo userInfo);

    
    @Select("select * from users where account=#{account}")
    UserInfo queryUserByAccount(@Param("account") String account);

    @Update("UPDATE users SET account=#{account} , password=#{password} , user_name=#{userName} WHERE user_id=#{userId};")
    int updateUser(UserInfo userInfo);
}
