package com.aiidc.sps.ep.entity;

import javax.persistence.Column;

public class EmDrillDetail extends EmDrill {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3968491253621958883L;
	@Column(name="COMPANY_NAME")
	private String companyName;
	@Column(name="TYPE_NM")
	private String typeName;
	@Column(name="MODE_NM")
	private String modeName;
	@Column(name="PLAN_NAME")
	private String planName;
	public String getCompanyName() {
		return companyName;
	}
	public String getTypeName() {
		return typeName;
	}
	public String getModeName() {
		return modeName;
	}
	public String getPlanName() {
		return planName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public void setModeName(String modeName) {
		this.modeName = modeName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}

}
