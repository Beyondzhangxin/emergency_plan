package com.aiidc.sps.ep.parameter;

import org.hibernate.annotations.Subselect;

@Subselect("select a.*,b.name company_name,c.plan_type_name,d.usage_name "
		+ "from em_response_plan a ,em_enterprise_info b ,em_response_plan_type c,em_response_plan_usage_type d "
		+ "where a.company_id=b.id(+) and a.plan_type=c.plan_type_id and a.usage_scope=d.usage_id and a.company_id is null")
public class GovEmPlanParameter extends EmPlanParameter{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8504606596439511874L;

	
	
	

}
