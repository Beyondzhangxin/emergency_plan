package com.aiidc.sps.ep.controller;

import com.aiidc.base.ActionInfo;
import com.aiidc.base.AiidcException;
import com.aiidc.base.ControllerInfo;
import com.aiidc.base.ControllerUtils;
import com.aiidc.sps.ep.entity.EmDrill;
import com.aiidc.sps.ep.parameter.EmDrillParam;
import com.aiidc.sps.ep.services.EmDrillService;
import com.aiidc.sps.ep.services.PublicService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("em_drill")
@ControllerInfo(order = 10, value = "应急预案演练计划")
public class EmDrillController
{

    @Autowired
    private EmDrillService emDrillService;
    @Autowired
    private PublicService publicService;

    @RequestMapping("list")
    @ActionInfo(name = "演练计划列表", access = 06, index = 0)
    public String listPage()
            throws Exception
    {
        return "em_drill/list";

    }

    @RequestMapping("table")
    @ActionInfo(name = "应急预案数据内容", access = 06, index = 1)
    public ModelAndView table(EmDrillParam emDrill,
                              @RequestParam(name = "page", required = false, defaultValue = "1") int page,
                              @RequestParam(name = "rows", required = false, defaultValue = "10") int rows,
                              Authentication authentication)
            throws Exception
    {
        String authenticationName = authentication.getName();
        String companyId = publicService.getByUserName(authenticationName).getCompanyId();
        emDrill.setCompanyId(companyId);
        ModelAndView m = new ModelAndView();
        m.getModel().put("drillList", emDrillService.getEmDrillList(emDrill));
        System.out.println(emDrillService.getEmDrillList(emDrill).size());
        m.getModel().put("total", emDrillService.getEmDrillCount(emDrill));
        m.setViewName("em_drill/table");
        return m;
    }

    @RequestMapping("detail")
    @ActionInfo(name = "应急预案列表页", access = 06, index = 2)
    public ModelAndView detail(Integer drillId)
            throws Exception
    {
        ModelAndView m = new ModelAndView();
        if (drillId != null)
        {
            m.getModel().put("emDrill", emDrillService.getEmDrill(drillId));
            m.setViewName("em_drill/details");
        } else
        {
            m.setViewName("em_drill/save_details");
        }
        return m;
    }

    @ActionInfo(name = "新增修改应急预案", access = 06, index = 3)
    @RequestMapping(value = "save", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public String save(@Valid EmDrill emDrill, Errors error, Authentication authentication)
            throws Exception
    {
        if (error.hasErrors())
        {

            JSONObject json = ControllerUtils.buildFailureJson(new AiidcException("DTVY001", new String[]{"请检查输入项。"}));
            List<FieldError> list = error.getFieldErrors();
            for (FieldError f : list)
            {
                json.put(f.getField(), f.getDefaultMessage());
            }
            return json.toString();
        }
        String name = authentication.getName();
        emDrill.setCompanyId(publicService.getByUserName(name).getCompanyId());
        emDrillService.save(emDrill);

        return ControllerUtils.buildSuccessJson().toString();
    }

    @ActionInfo(name = "删除应急预案", access = 06, index = 5)
    @RequestMapping(value = "delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public String delete(@RequestParam(name = "planId") int[] planIds)
            throws Exception
    {
        emDrillService.delete(planIds);
        return ControllerUtils.buildSuccessJson().toString();
    }


}
