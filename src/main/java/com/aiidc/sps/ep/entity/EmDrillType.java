package com.aiidc.sps.ep.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="EM_DRILL_TYPE")
public class EmDrillType implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8680540303827533234L;

	@Column(name="TYPE_ID")
	@Id
	private String typeId;
	
	@Column(name="TYPE_NM")
	private String typeName;

	public String getTypeId() {
		return typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	
	

}
