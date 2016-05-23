package org.nxum.medicine.entity;

import java.sql.*;

public class AdminComment {
	private Integer id;
	private String content;
	private Date createTime;
	private String personName;
	private String replyContent;
	private Date replyTime;

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

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", createTime="
				+ createTime + ", personName=" + personName + ", replyContent="
				+ replyContent + ", replyTime=" + replyTime + "]";
	}
}
