package com.aiidc.sps.ep.services;

import com.aiidc.sps.ep.entity.*;
import com.aiidc.sps.ep.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublicService
{


    @Autowired
    private EmUserInfoMapper emUserInfoMapper;

    @Autowired
    private EmDrillTypeMapper drillTypeMapper;

    @Autowired
    private EmDrillModeMapper drillModeMapper;

    @Autowired
    private EmResponsePlanTypeMapper planTypeMapper;

    @Autowired
    private EmResponsePlanUsageMapper planUsageMapper;

    public List<EmResponsePlanType> getAllEmResponsePlanType()
    {
        return planTypeMapper.findAll(EmResponsePlanType.class);
    }

    public List<EmResponsePlanUsageType> getAllEmResponsePlanUsageType()
    {
        return planUsageMapper.findAll(EmResponsePlanUsageType.class);
    }

    public List<EmDrillType> findEmDrillTypeList()
    {

        return drillTypeMapper.findAll(EmDrillType.class);
    }

    public List<EmDrillMode> findEmDrillModeList()
    {

        return drillModeMapper.findAll(EmDrillMode.class);
    }

    public EmUserInfo getByUserName(String userName)
    {
        EmUserInfo emUserInfo = new EmUserInfo();
        emUserInfo.setUserName(userName);
        return emUserInfoMapper.findById(emUserInfo);
    }


}




