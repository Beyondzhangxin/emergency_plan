package com.aiidc.sps.ep.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity(name="EmUserInfo")
@Table(name="USER_INFO")
public class EmUserInfo implements Serializable {

	private static final long serialVersionUID = -7215666295130343609L;

	@Column(name="USER_NAME")
	@Id
	private String userName;
	@Column(name="COMPANY_ID")
	private String companyId;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
