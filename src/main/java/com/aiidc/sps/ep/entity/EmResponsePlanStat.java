package com.aiidc.sps.ep.entity;

import java.io.Serializable;

import javax.persistence.Column;

import org.hibernate.annotations.Subselect;

@Subselect("select a.*,b.name companyname from ("
		  + "select company_id companyid,"
		  + "sum(decode(plan_type,'1',1,0)) spcomp,"
		  + "sum(decode(plan_type,'2',1,0)) spspec,"
		  + "sum(decode(plan_type,'3',1,0)) spdisp,"
		  + "sum(decode(plan_type,'4',1,0)) spother,"
		  + "sum(decode(plan_type,'5',1,0)) epcomp,"
		  + "sum(decode(plan_type,'6',1,0)) epspec,"
		  + "sum(decode(plan_type,'7',1,0)) epdisp,"
		  + "sum(decode(plan_type,'8',1,0)) epother "
		  + "from EM_RESPONSE_PLAN where COMPANY_ID is not null group by company_id) a,"
		  + "EM_ENTERPRISE_INFO b where a.companyid=b.id")
public class EmResponsePlanStat implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3579496327500393777L;
	@Column(name="companyid")
	private String  companyId;
	@Column(name="companyname")
	private String  companyName;
	@Column(name="spcomp")
	private Integer spComp;
	@Column(name="spspec")
	private Integer spSpec;
	@Column(name="spdisp")
	private Integer spDisp;
	@Column(name="spother")
	private Integer spOther;
	@Column(name="epcomp")
	private Integer epComp;
	@Column(name="epSpec")
	private Integer epSpec;
	@Column(name="epDisp")
	private Integer epDisp;
	@Column(name="epOther")
	private Integer epOther;
	public String getCompanyId() {
		return companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public Integer getSpComp() {
		return spComp;
	}
	public Integer getSpSpec() {
		return spSpec;
	}
	public Integer getSpDisp() {
		return spDisp;
	}
	public Integer getSpOther() {
		return spOther;
	}
	public Integer getEpComp() {
		return epComp;
	}
	public Integer getEpSpec() {
		return epSpec;
	}
	public Integer getEpDisp() {
		return epDisp;
	}
	public Integer getEpOther() {
		return epOther;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public void setSpComp(Integer spComp) {
		this.spComp = spComp;
	}
	public void setSpSpec(Integer spSpec) {
		this.spSpec = spSpec;
	}
	public void setSpDisp(Integer spDisp) {
		this.spDisp = spDisp;
	}
	public void setSpOther(Integer spOther) {
		this.spOther = spOther;
	}
	public void setEpComp(Integer epComp) {
		this.epComp = epComp;
	}
	public void setEpSpec(Integer epSpec) {
		this.epSpec = epSpec;
	}
	public void setEpDisp(Integer epDisp) {
		this.epDisp = epDisp;
	}
	public void setEpOther(Integer epOther) {
		this.epOther = epOther;
	}

}
