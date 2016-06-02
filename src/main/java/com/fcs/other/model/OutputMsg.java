package com.fcs.other.model;

/**
 * Created by Lucare.Feng on 2016/6/2.
 */
public class OutputMsg {

    private String ToUserName;
    private String FromUserName;
    private Long CreateTime;
    private String MsgType;

    private ImageMsg Image;

    public String getToUserName() {
        return ToUserName;
    }

    public void setToUserName(String toUserName) {
        ToUserName = toUserName;
    }

    public String getFromUserName() {
        return FromUserName;
    }

    public void setFromUserName(String fromUserName) {
        FromUserName = fromUserName;
    }

    public Long getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(Long createTime) {
        CreateTime = createTime;
    }

    public String getMsgType() {
        return MsgType;
    }

    public void setMsgType(String msgType) {
        MsgType = msgType;
    }

    public ImageMsg getImage() {
        return Image;
    }

    public void setImage(ImageMsg image) {
        Image = image;
    }
}
