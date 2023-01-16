package com.tjcu.epidemic.mapper;

import com.tjcu.epidemic.bean.ProvinceInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProvinceMapper {
    @Select("SELECT \n" +
            "  * \n" +
            "FROM\n" +
            "  provinces \n" +
            "WHERE province_id NOT IN \n" +
            "  (SELECT \n" +
            "    province_id \n" +
            "  FROM\n" +
            "    epidemics \n" +
            "  WHERE data_year = #{arg0} \n" +
            "    AND data_month = #{arg1} \n" +
            "    AND data_day = #{arg2}) \n" +
            "ORDER BY province_id \n" +
            "LIMIT 0, 6 ;")
    List<ProvinceInfo> findNoDataProvinceList(int year, int month, int day);
}
