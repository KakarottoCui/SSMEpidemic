package com.tjcu.epidemic.service;

import com.tjcu.epidemic.bean.DailyEpidemicInfo;
import com.tjcu.epidemic.bean.EpidemicDetailInfo;
import com.tjcu.epidemic.bean.ProvinceInfo;

import java.util.List;

public interface EpidemicService {
    public List<ProvinceInfo> saveEpidemicInfos(Integer userId, DailyEpidemicInfo dailyEpidemicInfo);

    public List<EpidemicDetailInfo> findEpidemicInfoTotal();

    EpidemicDetailInfo queryEpidemicInfoByProvince(String province);
}
