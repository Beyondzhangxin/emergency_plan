package com.aiidc.sps.ep.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="EM_DRILL_MODE")
public class EmDrillMode implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3007945196027876669L;

	@Column(name="MODE_ID")
	@Id
	private String modeId;
	
	@Column(name="MODE_NM")
	private String modeName;

	public String getModeId() {
		return modeId;
	}

	public String getModeName() {
		return modeName;
	}

	public void setModeId(String modeId) {
		this.modeId = modeId;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}
	
	

}
