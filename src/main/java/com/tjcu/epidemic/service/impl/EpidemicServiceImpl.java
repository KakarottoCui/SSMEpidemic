package com.tjcu.epidemic.service.impl;

import com.tjcu.epidemic.bean.DailyEpidemicInfo;
import com.tjcu.epidemic.bean.EpidemicDetailInfo;
import com.tjcu.epidemic.bean.EpidemicInfo;
import com.tjcu.epidemic.bean.ProvinceInfo;
import com.tjcu.epidemic.mapper.EpidemicMapper;
import com.tjcu.epidemic.mapper.ProvinceMapper;
import com.tjcu.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Service
public class EpidemicServiceImpl implements EpidemicService {
    @Autowired
    private EpidemicMapper epidemicMapper;

    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<ProvinceInfo> saveEpidemicInfos(Integer userId, DailyEpidemicInfo dailyEpidemicInfo) {
        String date = dailyEpidemicInfo.getDate();
        List<EpidemicInfo> array = dailyEpidemicInfo.getArray();
        String[] strings = date.split("-");
        int year = Integer.parseInt(strings[0]);
        int month = Integer.parseInt(strings[1]);
        int day = Integer.parseInt(strings[2]);
        for(int i=0;i<array.size();i++){
            //epidemicInfo封装页面提交过来的数据
            EpidemicInfo epidemicInfo = array.get(i);
            epidemicInfo.setDataYear(year);
            epidemicInfo.setDataMonth(month);
            epidemicInfo.setDataDay(day);
            epidemicInfo.setUserId(userId);
            epidemicInfo.setInputDate(new Date()); //设置当前时间作为数据录入时间
            //保存所有的疫情信息数据
            epidemicMapper.saveEpidemicInfos(epidemicInfo);
        }
        //返回下一组
        List<ProvinceInfo> noDataProvinceList = provinceMapper.findNoDataProvinceList(year, month, day);
        return noDataProvinceList;
    }

    @Override
    public List<EpidemicDetailInfo> findEpidemicInfoTotal() {
        GregorianCalendar calendar = new GregorianCalendar();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH)+1;
        int day = calendar.get(Calendar.DATE);

        List<EpidemicDetailInfo> epidemicInfoTotals = epidemicMapper.findEpidemicInfoTotal(year, month, day);
        return epidemicInfoTotals;
    }

    @Override
    public EpidemicDetailInfo queryEpidemicInfoByProvince(String province) {
        GregorianCalendar calendar = new GregorianCalendar();
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH)+1;
        int day = calendar.get(Calendar.DATE);

        EpidemicDetailInfo epidemicDetailInfo = epidemicMapper.queryEpidemicInfoByProvince(year, month, day, province);
        return epidemicDetailInfo;
    }
}
