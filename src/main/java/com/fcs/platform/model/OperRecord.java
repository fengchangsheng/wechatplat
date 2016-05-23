package com.fcs.platform.model;

import java.util.Date;

/**
 * Created by Lucare.Feng on 2016/5/23.
 */
public class OperRecord {

    private String id;
    private String operateid;
    private String operater;
    private String text;
    private Date operatetime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOperateid() {
        return operateid;
    }

    public void setOperateid(String operateid) {
        this.operateid = operateid;
    }

    public String getOperater() {
        return operater;
    }

    public void setOperater(String operater) {
        this.operater = operater;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getOperatetime() {
        return operatetime;
    }

    public void setOperatetime(Date operatetime) {
        this.operatetime = operatetime;
    }
}
