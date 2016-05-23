package org.nxum.medicine.entity;

import java.sql.Date;
public class Notice {
	private Integer  id;
	private String  content;
	private Date  createTime;
	private String title;
	
public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "Notice [id=" + id + ", content=" + content + ", createTime="
				+ createTime + ", title=" + title + "]";
	}

}
