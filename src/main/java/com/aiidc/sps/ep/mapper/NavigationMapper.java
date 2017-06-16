package com.aiidc.sps.ep.mapper;

import com.aiidc.sps.ep.entity.Navigation;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@org.apache.ibatis.annotations.Mapper
public interface NavigationMapper{
		
	@Select( "select * from navigation where pid is null and sys_id=4 order by orderby")
	@Results({@Result(property="iconCls",column="icon_cls"),@Result(property="funcid",column="func_id")})
	public List<Navigation> getRootNavigationList();
	
	@Select( "select * from navigation where pid=#{pid} and sys_id=4  order by orderby")
	@Results({@Result(property="iconCls",column="icon_cls"),@Result(property="funcid",column="func_id")})
	public List<Navigation> getNavigationListByParent(int pid);
}
