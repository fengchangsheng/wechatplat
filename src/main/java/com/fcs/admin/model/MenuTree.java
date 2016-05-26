package com.fcs.admin.model;

import com.fcs.platform.model.BaseModel;

import java.util.List;
import java.util.Map;

/**
 * Created by Lucare on 2016/1/29.
 */
public class MenuTree extends BaseModel{

    private String text;

    private String iconCls;

    private String url;

    private String parentId;

    private String state;

    private String checked;//临时属性

    private Integer type;

    private List<MenuTree> children;//临时属性

    private List<MenuTree> others;//临时属性

    private Map<String,Object> attributes;//临时属性

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public List<MenuTree> getChildren() {
        return children;
    }

    public void setChildren(List<MenuTree> children) {
        this.children = children;
    }

    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public List<MenuTree> getOthers() {
        return others;
    }

    public void setOthers(List<MenuTree> others) {
        this.others = others;
    }

    @Override
    public String toString() {
        return "MenuTree{" +
                "text='" + text + '\'' +
                ", iconCls='" + iconCls + '\'' +
                ", url='" + url + '\'' +
                ", parentId='" + parentId + '\'' +
                ", state='" + state + '\'' +
                ", checked=" + checked +
                ", type=" + type +
                ", children=" + children +
                ", others=" + others +
                ", attributes=" + attributes +
                '}';
    }
}
