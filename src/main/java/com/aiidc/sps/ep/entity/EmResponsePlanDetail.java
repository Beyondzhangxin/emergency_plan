package com.aiidc.sps.ep.entity;

import org.hibernate.annotations.Subselect;

import javax.persistence.Column;

@Subselect("select a.*,b.name company_name,c.plan_type_name,d.usage_name "
		+ "from em_response_plan a ,em_enterprise_info b ,em_response_plan_type c,em_response_plan_usage_type d "
		+ "where a.company_id=b.id(+) and a.plan_type=c.plan_type_id and a.usage_scope=d.usage_id")
public class EmResponsePlanDetail extends EmResponsePlan {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2496461896904683424L;

	@Column(name="PLAN_TYPE_NAME")
	private String planTypeName;
	@Column(name="USAGE_NAME")
	private String planUsageName;
	@Column(name="company_name")
	private String companyName;
	
	public String getPlanTypeName() {
		return planTypeName;
	}

	public String getPlanUsageName() {
		return planUsageName;
	}

	public void setPlanTypeName(String planTypeName) {
		this.planTypeName = planTypeName;
	}

	public void setPlanUsageName(String planUsageName) {
		this.planUsageName = planUsageName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

}
