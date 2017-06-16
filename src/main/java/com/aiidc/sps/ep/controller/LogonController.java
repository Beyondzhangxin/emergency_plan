package com.aiidc.sps.ep.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.aiidc.base.ActionInfo;
import com.aiidc.base.ControllerInfo;
import com.aiidc.sps.ep.entity.Navigation;
import com.aiidc.sps.ep.services.LogonService;

@Controller
@RequestMapping("logon")
@ControllerInfo(order=10,value="登录成功页面")
public class LogonController 
{
	
	@Autowired
	private LogonService longonService;

	@RequestMapping("frame")
	@ActionInfo(name="框架页面",access=06,index=0)
	public ModelAndView frame()
	throws Exception
	{
		ModelAndView m = new ModelAndView();
		List<Navigation> list = longonService.getNavigation();
		m.getModel().put("navList", list);
		m.setViewName("logon/frame");
		
		return m;
	}
	
	
	@RequestMapping("subframe")
	@ActionInfo(name="框架页面",access=06,index=1)
	public ModelAndView subframe(@RequestParam(name="parentId") int parentId)
	throws Exception
	{
		ModelAndView m = new ModelAndView();
		List<Navigation> list = longonService.getNavigation(parentId);
		m.getModel().put("navList", list);
		m.setViewName("logon/subframe");
		
		return m;
	}
	
}