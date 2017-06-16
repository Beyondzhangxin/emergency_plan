package com.aiidc.sps.ep.services;

import com.aiidc.sps.ep.entity.EmDrill;
import com.aiidc.sps.ep.entity.EmDrillDetail;
import com.aiidc.sps.ep.entity.EmResponsePlan;
import com.aiidc.sps.ep.mapper.EmDrillMapper;
import com.aiidc.sps.ep.parameter.EmDrillParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class EmDrillService {

	@Autowired
	private EmDrillMapper emDrillMapper;
	
	/**
	 * 按照查询条件查询应急预案列表
	 * @return 应急预案列表
	 */
	public List<EmDrillDetail> getEmDrillList(EmDrillParam param) 
	{
		if(param==null) param =new EmDrillParam();
		if(param.getRows()==null||param.getRows()==0) {
			param.setRows(10);
		}
		if(param.getPage()==null||param.getPage()==0){
			param.setPage(1);
		}
		param.setStart(param.getRows()*(param.getPage()-1) +1);
		param.setEnd(param.getRows() * param.getPage());
		return emDrillMapper.findPage(param);
	}
	
	public int getEmDrillCount(EmDrillParam param) 
	{
		
		return emDrillMapper.count(param);
	}
	
	public int genDrillId(){
		return emDrillMapper.genDrillId();
	}
	public EmDrillDetail getEmDrill(int drillId) 
	{
		EmDrillParam detail = new EmDrillParam();
		detail.setDrillId(drillId);
		return emDrillMapper.findById(detail);
	}

	public void save(EmDrill emDrill)
			throws Exception
	{
		emDrill.setCreateTime(new Date());
		if (emDrill.getDrillId()!=null)
		{
			emDrill.setDrillId(genDrillId());
			emDrillMapper.insert(emDrill);
		} else
		{
			emDrillMapper.update(emDrill);
		}

	}

	public void delete(int[] drillId)
			throws Exception
	{
		for (int i = 0; i < drillId.length && drillId != null; i++)
		{
			EmResponsePlan emDrill = new EmResponsePlan();
			emDrill.setPlanId(drillId[i]);
			emDrillMapper.delete(emDrill);
		}


	}


}
