package com.aiidc.sps.ep.parameter;

import org.hibernate.annotations.Subselect;

@SuppressWarnings("serial")
@Subselect("select a.*,b.name company_name,c.plan_type_name,d.usage_name "
		+ "from em_response_plan a ,em_enterprise_info b ,em_response_plan_type c,em_response_plan_usage_type d "
		+ "where a.company_id=b.id(+) and a.plan_type=c.plan_type_id and a.usage_scope=d.usage_id and a.company_id is not null")
public class EntEmPlanParameter extends EmPlanParameter{

	
	
	

}
