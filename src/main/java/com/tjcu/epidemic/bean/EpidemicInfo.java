package com.tjcu.epidemic.bean;

import java.util.Date;

public class EpidemicInfo {
    private Integer serialId;
    private Integer provinceId;
    private Integer dataYear,dataMonth,dataDay;
    private Integer affirmed,suspected,isolated,dead,cured,userId;
    private Date inputDate;

    public EpidemicInfo() {
    }

    public EpidemicInfo(Integer serialId, Integer provinceId, Integer dataYear, Integer dataMonth, Integer dataDay, Integer affirmed, Integer suspected, Integer isolated, Integer dead, Integer cured, Integer userId, Date inputDate) {
        this.serialId = serialId;
        this.provinceId = provinceId;
        this.dataYear = dataYear;
        this.dataMonth = dataMonth;
        this.dataDay = dataDay;
        this.affirmed = affirmed;
        this.suspected = suspected;
        this.isolated = isolated;
        this.dead = dead;
        this.cured = cured;
        this.userId = userId;
        this.inputDate = inputDate;
    }

    public Integer getSerialId() {
        return serialId;
    }

    public void setSerialId(Integer serialId) {
        this.serialId = serialId;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
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

    public Integer getAffirmed() {
        return affirmed;
    }

    public void setAffirmed(Integer affirmed) {
        this.affirmed = affirmed;
    }

    public Integer getSuspected() {
        return suspected;
    }

    public void setSuspected(Integer suspected) {
        this.suspected = suspected;
    }

    public Integer getIsolated() {
        return isolated;
    }

    public void setIsolated(Integer isolated) {
        this.isolated = isolated;
    }

    public Integer getDead() {
        return dead;
    }

    public void setDead(Integer dead) {
        this.dead = dead;
    }

    public Integer getCured() {
        return cured;
    }

    public void setCured(Integer cured) {
        this.cured = cured;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getInputDate() {
        return inputDate;
    }

    public void setInputDate(Date inputDate) {
        this.inputDate = inputDate;
    }

    @Override
    public String toString() {
        return "EpidemicInfo{" +
                "serialId=" + serialId +
                ", provinceId=" + provinceId +
                ", dataYear=" + dataYear +
                ", dataMonth=" + dataMonth +
                ", dataDay=" + dataDay +
                ", affirmed=" + affirmed +
                ", suspected=" + suspected +
                ", isolated=" + isolated +
                ", dead=" + dead +
                ", cured=" + cured +
                ", userId=" + userId +
                ", inputDate=" + inputDate +
                '}';
    }
}
