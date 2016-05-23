package org.nxum.medicine.admin.controller;

import java.util.List;
import java.util.Map;
import org.nxum.medicine.entity.util.SearchBigProductName;
import org.nxum.medicine.service.AdminBigProductService;
import org.nxum.medicine.util.JsonResponseData;
import org.nxum.medicine.view.entity.AdminSeacherBigProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.nxum.medicine.entity.MedicineBigType;

@RequestMapping("/Admin")
@Controller
public class AdminBigProductController {
	@Autowired
	private AdminBigProductService service;

	public void setService(AdminBigProductService service) {
		this.service = service;
	}

	@RequestMapping(value = "/adminFindBigProduct", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bigProduct(SearchBigProductName bigProduct) {

		// System.out.println("传来的"+bigProduct);
		if (bigProduct.getBigProductName() == null
				|| bigProduct.getBigProductName() == "") {
			List<MedicineBigType> bigProducts = this.service.adminFindBigProduct(bigProduct.getPage(), bigProduct.getRows());
			Integer total = this.service.adminGetBigProductCount();
			Map<String, Object> jsonMap = JsonResponseData.JsonMapResponse(bigProducts, total);
			// System.out.println("商品大类"+jsonMap);
			if (bigProducts.size() != 0) {
				return jsonMap;
			} else {
				return null;
			}
		} else {
			AdminSeacherBigProduct seacherProuduct = new AdminSeacherBigProduct();
			seacherProuduct.setBigProductName("%" + bigProduct.getBigProductName() + "%");
			seacherProuduct.setPage(bigProduct.getPage());
			seacherProuduct.setRows(bigProduct.getRows());

			List<MedicineBigType> seacheBigProduct = this.service.adminSeacherProduct(seacherProuduct);

			Integer total = this.service.getSeacherBigProductCount("%" + bigProduct.getBigProductName() + "%");
			Map<String, Object> jsonMap = JsonResponseData.JsonMapResponse(seacheBigProduct, total);
			if (seacheBigProduct.size() != 0) {
				return jsonMap;
			} else {
				return null;
			}
		}
	}

	// 检测商品大类是否重复
	@RequestMapping(value = "/checkBigProductName/{name}", method = RequestMethod.GET)
	@ResponseBody
	public boolean checkBigProductName(
			@PathVariable("name") String bigProductName) {
		boolean isRepeat = this.service.adminCheckBigProductName(bigProductName);
		if (isRepeat) {
			return true;
		} else {
			return false;
		}
	}

	// 进行商品大类的添加
	@RequestMapping(value = "/adminAddBigProduct", method = RequestMethod.POST)
	@ResponseBody
	public boolean adminAddBigProduct(MedicineBigType bigProduct) {
		boolean isAddBigProduct = this.service.adminAddBigProduct(bigProduct);
		if (isAddBigProduct) {
			return true;
		} else {
			return false;
		}
	}

	// 进行商品的修改
	@RequestMapping(value = "/adminUpdateBigProduct", method = RequestMethod.POST)
	@ResponseBody
	public boolean adminUpadteBigProduct(MedicineBigType bigProduct) {
		// System.out.println("传来的商品信息是"+bigProduct);
		boolean isUpdate = this.service.adminUpdateBigProduct(bigProduct);
		if (isUpdate) {
			return true;
		}
		return false;
	}

	// 进行商品大类的删除
	@RequestMapping(value = "/adminDeleteBigProduct/{bigProductId}", method = RequestMethod.DELETE)
	@ResponseBody
	public boolean adminDeleteBigProduct(
			@PathVariable("bigProductId") Integer bigProductId) {
		boolean isDeleteBigProduct = this.service
				.adminDeleteBigProduct(bigProductId);
		if (isDeleteBigProduct) {
			return true;
		} else {
			return false;
		}
	}
}
