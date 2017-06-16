package com.aiidc.sps.ep.entity;

import com.aiidc.base.dao.SqlParam;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Table(name="EM_DRILL")
public class EmDrill implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7731620956161253300L;
	@Column(name="DRILL_ID")
	@Id
	private Integer drillId;
	@Column(name="PLAN_ID")
	private Integer planId     ;
	@Column(name="DRILL_NAME")
	@NotNull(message = "计划名称不能为空")
	private String drillName    ;
	@Column(name="DRILL_TYPE")
	private String drillType    ;
	@Column(name="DRILL_MODE")
	private String drillMode    ;
	@Column(name="START_TIME")
	@SqlParam(symbol=SqlParam.GE)
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@NotNull(message ="开始时间不能为空")
	private Date   startTime    ;
	@Column(name="END_TIME")
	@SqlParam(symbol=SqlParam.LE)
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	@NotNull(message = "结束时间不能为空")
	private Date   endTime      ;
	@Column(name="DRILL_ADDR")
	@NotNull(message = "演练地点不能为空")
	private String drillAddr;
	@Column(name="DRILL_CONTENT")
	@NotNull(message = "演练内容不能为空")
	private String drillContent ;
	@Column(name="COMPANY_ID")
	@SqlParam()
	private String companyId    ;
	@Column(name="CREATE_TIME")
	private Date   createTime   ;
	public Integer getDrillId() {
		return drillId;
	}
	public Integer getPlanId() {
		return planId;
	}
	public String getDrillName() {
		return drillName;
	}
	public String getDrillType() {
		return drillType;
	}
	public String getDrillMode() {
		return drillMode;
	}
	public Date getStartTime() {
		return startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public String getDrillContent() {
		return drillContent;
	}
	public String getCompanyId() {
		return companyId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setDrillId(Integer drillId) {
		this.drillId = drillId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public void setDrillName(String drillName) {
		this.drillName = drillName;
	}
	public void setDrillType(String drillType) {
		this.drillType = drillType;
	}
	public void setDrillMode(String drillMode) {
		this.drillMode = drillMode;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getDrillAddr() {
		return drillAddr;
	}
	public void setDrillAddr(String drillAddr) {
		this.drillAddr = drillAddr;
	}
	public void setDrillContent(String drillContent) {
		this.drillContent = drillContent;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
