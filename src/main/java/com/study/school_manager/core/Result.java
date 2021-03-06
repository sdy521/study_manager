package com.study.school_manager.core;

public class Result {
    private int code;
    private String msg;

    public Result() {
        this.code = 0;
        this.msg = "操作成功";
    }

    public Result(int code, String msg) {
        this.code = code;
        this.msg = msg;
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
}
