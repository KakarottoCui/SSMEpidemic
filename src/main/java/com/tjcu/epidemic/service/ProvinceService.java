package com.tjcu.epidemic.service;

import com.tjcu.epidemic.bean.ProvinceInfo;

import java.util.List;

public interface ProvinceService {
    List<ProvinceInfo> noDataProvinceList(String date);
}
