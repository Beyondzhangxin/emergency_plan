package com.aiidc.sps.ep.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.aiidc.base.dao.BaseMapper;
import com.aiidc.sps.ep.entity.EmDrillDetail;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmDrillMapper extends BaseMapper<EmDrillDetail>{

    @Select("SELECT SEQ_EM_DRILL.nextval FROM dual")
    int genDrillId();
}















