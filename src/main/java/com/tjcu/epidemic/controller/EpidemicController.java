package com.tjcu.epidemic.controller;

import com.tjcu.epidemic.bean.*;
import com.tjcu.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/epidemicData")
public class EpidemicController {
    @Autowired
    private EpidemicService epidemicService;

    @RequestMapping("/ajax/input")
    //@RequestBody作用是将页面提交的json格式的数据转换成对象
    @ResponseBody //将return对象转换成json格式响应给页面
    public AjaxResponseInfo saveEpidemicInfo(@RequestBody DailyEpidemicInfo dailyEpidemicInfo, HttpSession session){
        AjaxResponseInfo ajaxResponseInfo=new AjaxResponseInfo();

        UserInfo loginedUser = (UserInfo) session.getAttribute("loginedUser");
        System.out.println("saveEpidemicInfo "+dailyEpidemicInfo);
//        System.out.println("loginedUser "+loginedUser.getUserId());
        if(loginedUser!=null){
            //已经登录
            Integer userId = loginedUser.getUserId();
            List<ProvinceInfo> provinceInfos = epidemicService.saveEpidemicInfos(userId, dailyEpidemicInfo);
            ajaxResponseInfo.setCode(0);
            ajaxResponseInfo.setMsg("保存成功");
            ajaxResponseInfo.setData(provinceInfos);
        }else{
            //表示用户没有登录
            ajaxResponseInfo.setCode(-2);
            ajaxResponseInfo.setMsg("权限不足，请登录后再试");
        }
        return ajaxResponseInfo;
    }

    @RequestMapping("/ajax/lastestData")
    @ResponseBody
    public AjaxResponseInfo findEpidemicInfoTotal(){
        List<EpidemicDetailInfo> epidemicInfoTotals = epidemicService.findEpidemicInfoTotal();
        AjaxResponseInfo ajaxResponseInfo = new AjaxResponseInfo();
        ajaxResponseInfo.setCode(0);
        ajaxResponseInfo.setMsg("查询成功");
        ajaxResponseInfo.setData(epidemicInfoTotals);
        return ajaxResponseInfo;
    }

    @RequestMapping("/ajax/queryProvince")
    @ResponseBody
    public AjaxResponseInfo queryEpidemicInfoByProvince(@RequestBody String province){
        EpidemicDetailInfo epidemicDetailInfo = epidemicService.queryEpidemicInfoByProvince(province);
        AjaxResponseInfo ajaxResponseInfo = new AjaxResponseInfo();
        if(epidemicDetailInfo!=null){
            ajaxResponseInfo.setCode(0);
            ajaxResponseInfo.setMsg("查询成功");
            ajaxResponseInfo.setData(epidemicDetailInfo);
        }else{
            ajaxResponseInfo.setCode(-1);
            ajaxResponseInfo.setMsg("查询失败");
        }
        return ajaxResponseInfo;
    }
}
