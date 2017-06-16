package com.aiidc.sps.ep.entity;

import com.aiidc.base.dao.SqlParam;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Entity(name="EmResponsePlan")
@Table(name="EM_RESPONSE_PLAN")
public class EmResponsePlan implements Serializable{

	private static final long serialVersionUID = -8557742867077391590L;

	@Column(name="company_id")
	@SqlParam()
	private String companyId;
	@Id
	@Column(name="plan_id")
	private Integer planId;
	
	@NotNull(message="预案名称不能为空")
//	@NotEmpty(message="预案名称不能为空")
	@Column(name="plan_name")
	private String planName;
	
	@Column(name="plan_type")
	private String planType;
	
	@Column(name="usage_scope")
	private String usageScope;
	
	@Column(name="content")
	private byte[] content;
	@Column(name = "file_name")
	private String fileName;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="reporting_time")
	private Date reportingTime;

	public EmResponsePlan() {

	}

	public String getCompanyId() {
		return companyId;
	}



	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}



	public Integer getPlanId() {
		return planId;
	}



	public void setPlanId(Integer planId) {
		this.planId = planId;
	}



	public String getPlanName() {
		return planName;
	}



	public void setPlanName(String planName) {
		this.planName = planName;
	}



	public String getPlanType() {
		return planType;
	}



	public void setPlanType(String planType) {
		this.planType = planType;
	}



	public String getUsageScope() {
		return usageScope;
	}



	public void setUsageScope(String usageScope) {
		this.usageScope = usageScope;
	}



	



	public Date getReportingTime() {
		return reportingTime;
	}



	public void setReportingTime(Date reportingTime) {
		this.reportingTime = reportingTime;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public String getFileName() {
		return fileName;
	}

	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "EmResponsePlan [companyId=" + companyId + ", planId=" + planId + ", planName=" + planName
				+ ", planType=" + planType + ", usageScope=" + usageScope + ", fileName=" + fileName
				+ ", reportingTime=" + reportingTime + "]";
	}

}
