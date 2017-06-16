package com.aiidc.sps.ep.parameter;

import javax.persistence.Table;

import com.aiidc.sps.ep.entity.EmDrillDetail;

@Table(name="V_EM_DRILL")
public class EmDrillParam extends EmDrillDetail {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4922292684970978425L;
	private Integer start;
	private Integer end;
	private Integer page;
	private Integer rows;
	public Integer getStart() {
		return start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Integer getPage() {
		return page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}

}
