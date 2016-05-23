package org.nxum.medicine.admin.controller;

import java.util.List;
import java.util.Map;
import org.nxum.medicine.entity.AdminComment;
import org.nxum.medicine.entity.util.SeacherComment;
import org.nxum.medicine.service.AdminCommentManagerService;
import org.nxum.medicine.util.DateUtil;
import org.nxum.medicine.util.JsonResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/Admin")
@Controller
public class AdminCommentController {
	@Autowired
	private AdminCommentManagerService service;

	public void setService(AdminCommentManagerService service) {
		this.service = service;
	}

	@RequestMapping(value = "/adminFindComment", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> adminCommentManager(SeacherComment seacherComment) {
		if (seacherComment.getPersonName() == null || seacherComment.getPersonName() == "") {
			List<AdminComment> comments = this.service.adminFindComment(seacherComment.getPage(), seacherComment.getRows());
			// System.out.println("用户返回的留言"+comments);
			Integer rows = this.service.adminGetCommentCount();
			// System.out.println("用户的总体留言"+rows);
			Map<String, Object> jsonMap = JsonResponseData.JsonMapResponse(comments, rows);
			if (comments != null) {
				return jsonMap;
			} else {
				return null;
			}
		} else {
			List<AdminComment> seacherComments = this.service.adminSeacherComment(seacherComment.getPersonName());
			Map<String, Object> jsonMap = JsonResponseData.JsonMapResponse(seacherComments, 1);
			if (seacherComments.size() != 0) {
				return jsonMap;
			} else {
				return null;
			}
		}
	}

	@RequestMapping(value = "/adminReplyUser", method = RequestMethod.POST)
	@ResponseBody
	public boolean adminReplyUser(AdminComment adminComment) {
		adminComment.setReplyTime(DateUtil.getCurrentDateStrCreate());
		boolean isUpdate = this.service.adminReplyUser(adminComment);
		if (isUpdate) {
			return true;
		} else {
			return false;
		}
	}

	// 进行用户的留言删除
	@RequestMapping(value = "/adminDeleteComment/{idString}", method = RequestMethod.DELETE)
	@ResponseBody
	public boolean adminDeleteComment(@PathVariable("idString") String idString) {
		boolean isDelete = this.service.adminDeleteComment(idString);
		if (isDelete) {
			return true;
		} else {
			return false;
		}
	}
}
