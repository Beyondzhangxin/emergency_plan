package com.aiidc.sps.ep.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity(name="Navigation")
@Table(name="NAVIGATION")

public class Navigation implements Serializable {
	
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 744278426478005258L;
	@Column(name="id")
	private int id;
	@Column(name="text")
	private String text;
	@Column(name="icon_cls")
	private String iconCls;
	@Column(name="funcid")
	private String funcid;
	@Column(name="action")
	private String action;
	@Column(name="pid")
	private int pid;
	@Column(name="SYS_ID")
	private int sysId;
	
	private List<Navigation> children ;

	public int getId() {
		return id;
	}

	public String getText() {
		return text;
	}

	public String getIconCls() {
		return iconCls;
	}

	public String getFuncid() {
		return funcid;
	}

	public String getAction() {
		return action;
	}

	public int getPid() {
		return pid;
	}

	public List<Navigation> getChildren() {
		return children;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public void setFuncid(String funcid) {
		this.funcid = funcid;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getSysId() {
		return sysId;
	}

	public void setSysId(int sysId) {
		this.sysId = sysId;
	}

	public void setChildren(List<Navigation> children) {
		this.children = children;
	}
	
	
}
