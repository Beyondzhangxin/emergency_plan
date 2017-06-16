package com.aiidc.sps.ep.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.aiidc.base.dao.BaseMapper;
import com.aiidc.sps.ep.entity.EmResponsePlanDetail;

@Mapper
public interface EmResponsePlanMapper extends BaseMapper<EmResponsePlanDetail>{
	
	
	
	
	
	@Select("select seq_em_plan_id.nextval from dual")
	public int genPlanId();
	
	
	
	
}
