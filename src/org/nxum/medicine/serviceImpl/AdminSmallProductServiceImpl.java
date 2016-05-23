package org.nxum.medicine.serviceImpl;

import java.util.List;

import org.nxum.medicine.dao.AdminSmallProductDao;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.service.AdminSmallProductService;
import org.nxum.medicine.view.entity.AdminSeacherSmallProduct;
import org.nxum.medicine.view.entity.AdminSmallProductResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminSmallProductService")
public class AdminSmallProductServiceImpl implements AdminSmallProductService {
	@Autowired
	private AdminSmallProductDao dao;

	public void setDao(AdminSmallProductDao dao) {
		this.dao = dao;
	}

	@Override
	public List<AdminSmallProductResult> adminFindAllSmallProduct(
			AdminPageBean pageBean) {
		List<AdminSmallProductResult> smallProducts = this.dao
				.adminFindAllSmallProduct(pageBean);
		if (smallProducts.size() != 0) {
			return smallProducts;
		} else {
			return null;
		}
	}

	@Override
	public Integer adminGetSmallProductCount() {
		Integer count = this.dao.adminGetSmallProductCount();
		return count;
	}

	@Override
	public List<AdminSmallProductResult> adminSeacherSmallProduct(
			AdminSeacherSmallProduct smallProduct) {
		List<AdminSmallProductResult> seacherSmallProducts = this.dao
				.adminSeacherSmallProduct(smallProduct);
		if (seacherSmallProducts.size() != 0) {
			return seacherSmallProducts;
		} else {
			return null;
		}

	}

	@Override
	public Integer adminGetSeacherSmallProductCount(
			AdminSeacherSmallProduct smallProduct) {
		Integer total = this.dao.adminSeacherSmallProductCount(smallProduct);
		return total;
	}

	@Override
	public boolean adminCheckSmallNameRepeat(String name) {
		MedicineSmalltype smallProduct = this.dao.adminSmallProductRepeat(name);
		if (smallProduct != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean adminAddSmallProduct(MedicineSmalltype smallProduct) {
		this.dao.adminAddSmallProduct(smallProduct);
		return true;
	}

	@Override
	public boolean adminUpdateSmallProduct(MedicineSmalltype smallProduct) {
		this.dao.adminUpdateSmallProduct(smallProduct);
		return true;
	}

	@SuppressWarnings("unused")
	@Override
	public Integer adminDeleteSmallProduct(String StringId) {
		String[] adminStringId = StringId.split(",");
		for (int i = 0; i < adminStringId.length; i++) {
			// System.out.println("其中的数据"+adminStringId[0]);
			List<Product> products = this.dao.adminCheckRelatedProduct(Integer
					.parseInt(adminStringId[i]));
			// System.out.println("相关联的产品:"+products);
			if (products.size() != 0) {
				return 1;
			} else {
				// System.out.println("+++++++++++++++++++++++++++++");
				this.dao.adminDeleteSmallProduct(Integer
						.parseInt(adminStringId[i]));
				return 2;
			}
		}
		// 当没进入到for循环中时
		return 3;
	}
}
