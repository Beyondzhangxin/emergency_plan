package com.aiidc.sps.ep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aiidc.base.ActionInfo;
import com.aiidc.base.ControllerInfo;
import com.aiidc.sps.ep.services.EmResponsePlanService;

@Controller
@RequestMapping("plan_stat")
@ControllerInfo(order=10,value="应急预案统计")
public class EmPlanStatController {

	@Autowired
	private EmResponsePlanService emPlanService;
	
	@RequestMapping("list")
	@ActionInfo(name="应急预案统计列表页",access=06,index=0)
	public String  listPage()
	throws Exception
	{
		return "plan_stat/list";
	}
	
	
	@RequestMapping("table")
	@ActionInfo(name="应急预案统计数据内容",access=06,index=1)
	public ModelAndView table()
	throws Exception
	{
		
		ModelAndView m = new ModelAndView();
		m.getModel().put("planStatList", emPlanService.getEmPlanStat());
		m.setViewName("plan_stat/table");
		return m;
	}
	
	@RequestMapping("showCompanyPlan")
	@ActionInfo(name="应急预案统计数据内容",access=06,index=1)
	public String showCompanyPlan()
	throws Exception
	{
		return  "plan_stat/showCompanyPlan";
	}
	
	
	
}
