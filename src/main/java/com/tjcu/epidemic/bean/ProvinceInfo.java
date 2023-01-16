package com.tjcu.epidemic.bean;

public class ProvinceInfo {
    private Integer provinceId;
    private String provinceName;
    private String provincePy;
    private Integer delFlag;

    public ProvinceInfo() {
    }

    public ProvinceInfo(Integer provinceId, String provinceName, String provincePy, Integer delFlag) {
        this.provinceId = provinceId;
        this.provinceName = provinceName;
        this.provincePy = provincePy;
        this.delFlag = delFlag;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getProvincePy() {
        return provincePy;
    }

    public void setProvincePy(String provincePy) {
        this.provincePy = provincePy;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    public String toString() {
        return "ProvinceInfo{" +
                "provinceId=" + provinceId +
                ", provinceName='" + provinceName + '\'' +
                ", provincePy='" + provincePy + '\'' +
                ", delFlag=" + delFlag +
                '}';
    }
}
