package com.aiidc.sps.ep.parameter;

import javax.persistence.Entity;

import com.aiidc.sps.ep.entity.EmResponsePlanDetail;

@Entity(name="EmPlanParameter")
public class EmPlanParameter extends EmResponsePlanDetail{

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3423350628744358792L;
	private Integer page;
	private Integer rows;
	private Integer start;
	public Integer getPage() {
		return page;
	}
	public Integer getRows() {
		return rows;
	}
	public Integer getStart() {
		return start;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public void setStart(Integer start) {
		this.start = start;
	}

}
