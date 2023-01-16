package com.tjcu.epidemic.service.impl;

import com.tjcu.epidemic.bean.ProvinceInfo;
import com.tjcu.epidemic.mapper.ProvinceMapper;
import com.tjcu.epidemic.service.ProvinceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProvinceServiceImpl implements ProvinceService {
    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<ProvinceInfo> noDataProvinceList(String date) {
        //2022-11-16
        String[] strings = date.split("-"); //["2022","11","16"]
        int year = Integer.parseInt(strings[0]);
        int month = Integer.parseInt(strings[1]);
        int day = Integer.parseInt(strings[2]);
        List<ProvinceInfo> noDataProvinceList = provinceMapper.findNoDataProvinceList(year, month, day);
        return noDataProvinceList;
    }
}
