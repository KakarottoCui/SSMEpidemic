package com.tjcu.epidemic.bean;

/**
 * 该类是ajax请求后响应给页面的json格式对象
 */
public class AjaxResponseInfo<T> {
    private int code; //请求成功的响应码，0表示请求成功，-1表示请求失败,-2表示权限不足
    private String msg; //给响应页面的字符串信息
    private T data; //请求的数据

    public AjaxResponseInfo() {
    }

    public AjaxResponseInfo(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "AjaxResponseInfo{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }
}
