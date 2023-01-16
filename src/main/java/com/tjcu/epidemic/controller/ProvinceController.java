package com.tjcu.epidemic.controller;

import com.tjcu.epidemic.bean.AjaxResponseInfo;
import com.tjcu.epidemic.bean.ProvinceInfo;
import com.tjcu.epidemic.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/province")
public class ProvinceController {
    @Autowired
    private ProvinceService provinceService;

    @ResponseBody //只返回数据，不返回视图
    @RequestMapping("/ajax/noDataList")
    public AjaxResponseInfo noDataProvinceList(String date){
        System.out.println("ProvinceController "+date);
        AjaxResponseInfo ajaxResponseInfo = new AjaxResponseInfo();

        if(!StringUtils.isEmpty(date)){
            //表示页面的日期有效
            //使用服务层的对象调用服务层的方法
            List<ProvinceInfo> provinceInfos = provinceService.noDataProvinceList(date);
            ajaxResponseInfo.setCode(0);
            ajaxResponseInfo.setMsg("请求成功");
            ajaxResponseInfo.setData(provinceInfos);
        }else{
            //表示页面没有提交日期
            ajaxResponseInfo.setCode(-1);
            ajaxResponseInfo.setMsg("请求参数有误");
        }
        return ajaxResponseInfo;
    }
}
