package com.tjcu.epidemic.controller;

import com.tjcu.epidemic.bean.AjaxResponseInfo;
import com.tjcu.epidemic.bean.UserInfo;
import com.tjcu.epidemic.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
@Controller //该注解表示当前类被springmvc框架管理
@RequestMapping("/user")
public class UserController {
    //UserService userService=new UserServiceImpl(); ioc:将原来创建对象的权利交给spring工厂
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(UserInfo userInfo, Model model, HttpSession session){
        //System.out.println(userInfo);
        UserInfo login =userService.login(userInfo);
        System.out.println("usercontroller"+login);
        if(login!=null){
            //System.out.println("登录成功！");
            if(login.getDelFlag().equals(0)){
                //登录成功，记录用户的登录状态
                session.setAttribute("loginedUser",login);
                //重定向，跳转页面
                return "redirect:/main.jsp";
            }else {
                session.setAttribute("loginedUser",login);
                return "redirect:/epidemic.jsp";
            }

        }else{
            //System.out.println("登录失败！");
            //请求转发
            //跳转到  /login.jsp
            model.addAttribute("msg","账号或密码有误！");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
//        session.setAttribute("loginedUser",null);
//        session.removeAttribute("loginedUser");
        session.invalidate(); //使所有Attribute失效
        return "redirect:/login.jsp";
    }

    @RequestMapping("/input")
    public String userInput(UserInfo userInfo,Model model){
        userInfo.setDelFlag(1);
        System.out.println(userInfo);
        userService.userInput(userInfo);
        model.addAttribute("msg1","用户录入成功！");
        return "admin/user_input";
    }

    @RequestMapping("/ajax/query")
    @ResponseBody
    public AjaxResponseInfo queryUserByAccount(@RequestBody String account){
        UserInfo userInfo = userService.queryUserByAccount(account);
        AjaxResponseInfo ajaxResponseInfo = new AjaxResponseInfo();
        if(userInfo!=null){
            ajaxResponseInfo.setCode(0);
            ajaxResponseInfo.setMsg("查询成功");
            ajaxResponseInfo.setData(userInfo);
        }else{
            ajaxResponseInfo.setCode(-1);
            ajaxResponseInfo.setMsg("该账号不存在！");
        }
        return ajaxResponseInfo;
    }

    @RequestMapping("/ajax/update")
    @ResponseBody
    public AjaxResponseInfo updateUser(@RequestBody UserInfo userInfo){
//        System.out.println(userInfo);
        AjaxResponseInfo ajaxResponseInfo = new AjaxResponseInfo();
        int res = userService.updateUser(userInfo);
        if(res>0){
            ajaxResponseInfo.setCode(0);
            ajaxResponseInfo.setMsg("修改成功！");
        }else{
            ajaxResponseInfo.setCode(-1);
            ajaxResponseInfo.setMsg("修改失败！");
        }
        return ajaxResponseInfo;
    }
}
