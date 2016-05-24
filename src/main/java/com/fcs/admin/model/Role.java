package com.fcs.admin.model;

import com.fcs.platform.model.BaseModel;

import java.io.Serializable;
/**
 *角色实体类
 */
public class Role extends BaseModel {

	private String name;
	private String des;
	private Integer sn;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getSn() {
		return this.sn;
	}

	public void setSn(Integer sn) {
		this.sn = sn;
	}

}
