package org.nxum.medicine.dao;

import java.util.List;
import org.nxum.medicine.util.MybatisDao;
import org.nxum.medicine.view.entity.AdminSeacherBigProduct;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;

@MybatisDao
public interface AdminBigProductDao {
	// 查出全部的商品大类
	public List<MedicineBigType> adminFindBigProduct(AdminPageBean pageBean);

	// 查出bigProduct的总记录数
	public Integer adminGetBigProductCount();

	// 按名字进行商品大类的查询
	public List<MedicineBigType> adminSeacherBigProduct(
			AdminSeacherBigProduct seacherBigProduct);

	// 进行seacherbigProduct的搜索
	public Integer adminSeacherBigProductCount(String bigProductName);

	// 进行bigProduct的检测
	public MedicineBigType adminCheckBigProductName(String name);

	// 进行商品大类的添加
	public void adminAddBigProduct(MedicineBigType bigProduct);

	// 进行商品的修改
	public void adminUpdateBigProduct(MedicineBigType bigProduct);

	// 检测有无商品小类关联
	public List<MedicineSmalltype> adminCheckRelatedSmallProdouct(
			Integer bigProductId);

	// 进行商品大类的删除
	public void adminDeleteBigProduct(Integer bigProductId);
}
