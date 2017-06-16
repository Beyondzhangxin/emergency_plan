package com.aiidc.sps.ep.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.aiidc.base.ActionInfo;
import com.aiidc.base.ControllerInfo;
import com.aiidc.sps.ep.services.PublicService;

@Controller
@RequestMapping("pub")
@ControllerInfo(order=10,value="公共方法")
public class PublicController {
	
	@Autowired
	private PublicService pubService;

	@ActionInfo(name="获取预案类型",access=07,index=1)
	@RequestMapping(value="planTypeForSelect")
	public ModelAndView planTypeForSelect() 
	{
		ModelAndView m = new ModelAndView();
		m.getModel().put("options", pubService.getAllEmResponsePlanType());
		m.setViewName("pub/selectEmPlanType");
		return m;
	}
	
	@ActionInfo(name="获取预案应用领域",access=07,index=2)
	@RequestMapping(value="planUsageForSelect")
	public ModelAndView planUsageForSelect() 
	{
		ModelAndView m = new ModelAndView();
		m.getModel().put("options", pubService.getAllEmResponsePlanUsageType());
		m.setViewName("pub/selectEmUsage");
		return m;
	}
	
	@ActionInfo(name="获取演练类型",access=07,index=3)
	@RequestMapping(value="drillTypeForSelect")
	public ModelAndView drillTypeForSelect() 
	{
		ModelAndView m = new ModelAndView();
		m.getModel().put("options", pubService.findEmDrillTypeList());
		m.setViewName("pub/selectDrillType");
		return m;
	}
	
	@ActionInfo(name="获取演练方式",access=07,index=4)
	@RequestMapping(value="drillModeForSelect")
	public ModelAndView drillModeForSelect() 
	{
		ModelAndView m = new ModelAndView();
		m.getModel().put("options", pubService.findEmDrillModeList());
		m.setViewName("pub/selectDrillMode");
		return m;
	}
	
	@ActionInfo(name="错误页面",access=07,index=0)
	@RequestMapping(value="error")
	public String error() 
	throws Exception
	{
		return "error";
	}
	
	
	
	
}
