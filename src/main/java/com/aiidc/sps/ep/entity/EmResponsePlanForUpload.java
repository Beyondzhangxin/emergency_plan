package com.aiidc.sps.ep.entity;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class EmResponsePlanForUpload extends EmResponsePlan {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5765489001520752552L;
	
	@NotNull(message="预案内容不能为空。")
	private MultipartFile fileContent;

	public MultipartFile getFileContent() {
		return fileContent;
	}

	public void setFileContent(MultipartFile fileContent) 
	{
		this.fileContent = fileContent;
	}

	public String toString() {
		return super.toString()+ "[fileContent=" + fileContent + "]";
	}
}
