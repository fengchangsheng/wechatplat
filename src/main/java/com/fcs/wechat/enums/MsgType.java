package com.fcs.wechat.enums;

/**
 * Created by Lucare.Feng on 2016/6/2.
 */
public enum MsgType {

    TEXT("text"),
    IMAGE("image"),
    ENENT("event");

    private String name;

    MsgType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
