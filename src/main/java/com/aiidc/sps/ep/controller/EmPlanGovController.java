package com.aiidc.sps.ep.controller;

import java.util.List;

import javax.validation.Valid;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aiidc.base.ActionInfo;
import com.aiidc.base.AiidcException;
import com.aiidc.base.ControllerInfo;
import com.aiidc.base.ControllerUtils;
import com.aiidc.sps.ep.entity.EmResponsePlanDetail;
import com.aiidc.sps.ep.entity.EmResponsePlanForUpload;
import com.aiidc.sps.ep.parameter.GovEmPlanParameter;
import com.aiidc.sps.ep.services.EmResponsePlanService;

@Controller
@RequestMapping("em_plan_gov")
@ControllerInfo(order=10,value="应急预案")
public class EmPlanGovController {

	@Autowired
	private EmResponsePlanService emPlanService;
	
	@RequestMapping("list")
	@ActionInfo(name="应急预案列表页",access=06,index=0)
	public String listPage()
	throws Exception
	{
		
		return "em_plan_gov/list";
	}
	
	@RequestMapping("table")
	@ActionInfo(name="应急预案表格数据",access=06,index=0)
	public ModelAndView table(GovEmPlanParameter emPlan)
	throws Exception
	{
		ModelAndView m = new ModelAndView();
		m.getModel().put("emplanList", emPlanService.getGovEmPlanList(emPlan));
		m.getModel().put("total"     , emPlanService.getGovEmPlanTotal(emPlan));
		m.setViewName("em_plan_gov/table");
		return m;
	}
	
	@RequestMapping("detail")
	@ActionInfo(name="应急预案详细信息",access=06,index=1)
	public ModelAndView detail(@RequestParam(name="planId",required=false) Integer planId)
	throws Exception
	{
		ModelAndView m = new ModelAndView();
		if(planId!=null)
			m.getModel().put("emplan", emPlanService.getEmPlan(planId));
		else
			m.getModel().put("emplan", new EmResponsePlanDetail());
		m.setViewName("em_plan_gov/details");
		return m;
	}
	
	
	
	@ActionInfo(name="应急预案内容下载",access=06,index=2)
	@RequestMapping(value="download",produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<byte[]> download(@RequestParam("planId") int planId) 
	throws Exception
	{
		
		HttpHeaders headers = new HttpHeaders();    
        EmResponsePlanDetail emPlan = emPlanService.getEmPlan(planId);
        String fileName = emPlan.getFileName();
        fileName = new String(fileName.getBytes(),"ISO-8859-1");
        headers.setContentDispositionFormData("attachment", fileName);   
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);   
        return new ResponseEntity<byte[]>(emPlan.getContent(),    
                                          headers, HttpStatus.CREATED); 
	}
	
	
	@ActionInfo(name="新增修改应急预案",access=06,index=3)
	@RequestMapping(value="save",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String save(@Valid EmResponsePlanForUpload emplan,Errors error) 
	throws Exception
	{
		if(error.hasErrors()||emplan.getFileContent()==null||emplan.getFileContent().isEmpty()){
			
			JSONObject json = ControllerUtils.buildFailureJson(new AiidcException("DTVY001",new String[]{"请检查输入项。"}));
			List<FieldError> list = error.getFieldErrors();
			for (FieldError f : list) {
				json.put(f.getField(),f.getDefaultMessage());
			}
			if(emplan.getFileContent()==null||emplan.getFileContent().isEmpty()){
				json.put("fileContent","备案内容不能为空。");
			}
			
			return json.toString();
		}
		emPlanService.save(emplan);
		
		return ControllerUtils.buildSuccessJson().toString();
	}
	
	
	@ActionInfo(name="删除应急预案",access=06,index=4)
	@RequestMapping(value="delete",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String delete(@RequestParam(name="planId") int[] planIds) 
	throws Exception
	{
		emPlanService.delete(planIds);
		return ControllerUtils.buildSuccessJson().toString();
	}
}
