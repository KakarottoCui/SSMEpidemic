package com.tjcu.epidemic.bean;

public class EpidemicDetailInfo {
    private Integer provinceId;
    private String provinceName;
    private Integer dataYear,dataMonth,dataDay;
    private Integer affirmedTotal,suspectedTotal, isolatedTotal, deadTotal, curedTotal;

    public EpidemicDetailInfo() {
    }

    public EpidemicDetailInfo(Integer provinceId, String provinceName, Integer dataYear, Integer dataMonth, Integer dataDay, Integer affirmedTotal, Integer suspectedTotal, Integer isolatedTotal, Integer deadTotal, Integer curedTotal) {
        this.provinceId = provinceId;
        this.provinceName = provinceName;
        this.dataYear = dataYear;
        this.dataMonth = dataMonth;
        this.dataDay = dataDay;
        this.affirmedTotal = affirmedTotal;
        this.suspectedTotal = suspectedTotal;
        this.isolatedTotal = isolatedTotal;
        this.deadTotal = deadTotal;
        this.curedTotal = curedTotal;
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

    public Integer getDataYear() {
        return dataYear;
    }

    public void setDataYear(Integer dataYear) {
        this.dataYear = dataYear;
    }

    public Integer getDataMonth() {
        return dataMonth;
    }

    public void setDataMonth(Integer dataMonth) {
        this.dataMonth = dataMonth;
    }

    public Integer getDataDay() {
        return dataDay;
    }

    public void setDataDay(Integer dataDay) {
        this.dataDay = dataDay;
    }

    public Integer getAffirmedTotal() {
        return affirmedTotal;
    }

    public void setAffirmedTotal(Integer affirmedTotal) {
        this.affirmedTotal = affirmedTotal;
    }

    public Integer getSuspectedTotal() {
        return suspectedTotal;
    }

    public void setSuspectedTotal(Integer suspectedTotal) {
        this.suspectedTotal = suspectedTotal;
    }

    public Integer getIsolatedTotal() {
        return isolatedTotal;
    }

    public void setIsolatedTotal(Integer isolatedTotal) {
        this.isolatedTotal = isolatedTotal;
    }

    public Integer getDeadTotal() {
        return deadTotal;
    }

    public void setDeadTotal(Integer deadTotal) {
        this.deadTotal = deadTotal;
    }

    public Integer getCuredTotal() {
        return curedTotal;
    }

    public void setCuredTotal(Integer curedTotal) {
        this.curedTotal = curedTotal;
    }

    @Override
    public String toString() {
        return "EpidemicDetailInfo{" +
                "provinceId=" + provinceId +
                ", provinceName='" + provinceName + '\'' +
                ", dataYear=" + dataYear +
                ", dataMonth=" + dataMonth +
                ", dataDay=" + dataDay +
                ", affirmedTotal=" + affirmedTotal +
                ", suspectedTotal=" + suspectedTotal +
                ", isolatedTotal=" + isolatedTotal +
                ", deadTotal=" + deadTotal +
                ", curedTotal=" + curedTotal +
                '}';
    }
}
