package org.nxum.medicine.service;

import java.util.List;

import org.nxum.medicine.entity.AdminComment;

public interface AdminCommentManagerService {
	public List<AdminComment> adminFindComment(Integer page, Integer rows);

	// 进行用户的留言条数的查询
	public Integer adminGetCommentCount();

	// 进行用的留言所搜
	public List<AdminComment> adminSeacherComment(String personName);

	// 进行用户的留言回复
	public boolean adminReplyUser(AdminComment adminComment);

	// 进行用户的留言删除
	public boolean adminDeleteComment(String idString);
}
