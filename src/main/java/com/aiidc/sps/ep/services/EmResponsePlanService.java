package com.aiidc.sps.ep.services;

import com.aiidc.sps.ep.entity.EmResponsePlan;
import com.aiidc.sps.ep.entity.EmResponsePlanDetail;
import com.aiidc.sps.ep.entity.EmResponsePlanForUpload;
import com.aiidc.sps.ep.entity.EmResponsePlanStat;
import com.aiidc.sps.ep.mapper.EmResponsePlanMapper;
import com.aiidc.sps.ep.mapper.EmResponsePlanStatMapper;
import com.aiidc.sps.ep.parameter.EmPlanParameter;
import com.aiidc.sps.ep.parameter.EntEmPlanParameter;
import com.aiidc.sps.ep.parameter.GovEmPlanParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class EmResponsePlanService
{

    @Autowired
    private EmResponsePlanMapper planMapper;
    @Autowired
    private EmResponsePlanStatMapper statMapper;

    /**
     * 按照查询条件查询政府应急预案列表
     *
     * @param param 页面提交的查询条件
     * @return 应急预案列表
     */
    public List<EmResponsePlanDetail> getGovEmPlanList(GovEmPlanParameter param)
    {
        if (param == null) param = new GovEmPlanParameter();
        if (param.getRows() == null || param.getRows() == 0)
        {
            param.setRows(10);
        }
        if (param.getPage() == null || param.getPage() == 0)
        {
            param.setPage(1);
        }
        param.setStart(param.getRows() * (param.getPage() - 1) + 1);
        return planMapper.findPage(param);
    }

    /**
     * 查询符合条件应急预案数量
     *
     * @param emPlan
     * @return
     */
    public int getEntEmPlanTotal(EntEmPlanParameter emPlan)
    {
        return planMapper.count(emPlan);

    }

    /**
     * 按照查询条件查询应急预案列表
     *
     * @param param 页面提交的查询条件
     * @return 应急预案列表
     */
    public List<EmResponsePlanDetail> getEntEmPlanList(EntEmPlanParameter param)
    {
        if (param == null) param = new EntEmPlanParameter();
        if (param.getRows() == null || param.getRows() == 0)
        {
            param.setRows(10);
        }
        if (param.getPage() == null || param.getPage() == 0)
        {
            param.setPage(1);
        }
        param.setStart(param.getRows() * (param.getPage() - 1) + 1);
        return planMapper.findPage(param);
    }

    /**
     * 查询符合条件应急预案数量
     *
     * @return
     */
    public int getGovEmPlanTotal(EmPlanParameter param)
    {
        return planMapper.count(param);

    }

    /**
     * 获取应急预案的详细信息
     *
     * @param planId
     * @return
     */
    public EmResponsePlanDetail getEmPlan(int planId)
    {
        EmResponsePlanDetail param = new EmResponsePlanDetail();
        param.setPlanId(planId);
        return planMapper.findById(param);

    }

    /**
     * 生成预案编号
     *
     * @return
     */
    public int genPlanId()
    {
        return planMapper.genPlanId();

    }


    public void save(EmResponsePlanForUpload emplan)
            throws Exception
    {

        emplan.setFileName(emplan.getFileContent().getOriginalFilename());
        emplan.setContent(emplan.getFileContent().getBytes());

        emplan.setReportingTime(new Date());
        if (emplan.getPlanId() == null || emplan.getPlanId() == 0)
        {
            emplan.setPlanId(genPlanId());
            planMapper.insert(emplan);
        } else
        {
            planMapper.update(emplan);
        }

    }

    public void delete(int[] planIds)
            throws Exception
    {
        for (int i = 0; i < planIds.length && planIds != null; i++)
        {
            EmResponsePlan emPlan = new EmResponsePlan();
            emPlan.setPlanId(planIds[i]);
            planMapper.delete(emPlan);
        }


    }

    /**
     * 按照企业、预案类型对应急预案进行查询统计
     *
     * @return
     */
    public List<EmResponsePlanStat> getEmPlanStat()

    {
        return statMapper.findAll(EmResponsePlanStat.class);
    }
}
