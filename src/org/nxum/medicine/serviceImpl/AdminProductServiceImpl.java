package org.nxum.medicine.serviceImpl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nxum.medicine.dao.AdminProductDao;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.service.AdminProductService;
import org.nxum.medicine.util.DateUtil;
import org.nxum.medicine.view.entity.AdminProductResult;
import org.nxum.medicine.view.entity.AdminSearchProductParamete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service("adminProductService")
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	private AdminProductDao dao;

	public void setDao(AdminProductDao dao) {
		this.dao = dao;
	}

	@Override
	public List<AdminProductResult> adminFindProduct(Integer page, Integer rows) {
		AdminPageBean pagebean = new AdminPageBean();
		pagebean.setPage(page);
		pagebean.setRows(rows);
		List<AdminProductResult> products = this.dao
				.adminFindAllProduct(pagebean);
		if (products.size() != 0) {
			return products;
		} else {
			return null;
		}

	}

	@Override
	public Integer adminGetProductCount() {
		Integer total = dao.getAdminProductCount();
		return total;
	}

	@Override
	public List<AdminProductResult> adminSearchProduct(
			AdminSearchProductParamete seacherProduct) {
		List<AdminProductResult> seacherProducts = this.dao
				.adminSerachAllProduct(seacherProduct);
		if (seacherProducts.size() != 0) {
			return seacherProducts;
		} else {
			return null;
		}
	}

	@Override
	public Integer adminGetSeacherProductCount(
			AdminSearchProductParamete seacherProduct) {
		Integer count = this.dao.getAdminSearchCount(seacherProduct);
		return count;
	}

	@Override
	public List<MedicineBigType> adminFindAllBig() {
		List<MedicineBigType> findBigType = dao.adminFindAllProductBig();
		return findBigType;
	}

	@Override
	public List<MedicineSmalltype> adminFindAllSmall(Integer bigTypeId) {
		List<MedicineSmalltype> findSmallType = dao
				.adminFindAllProductSmall(bigTypeId);
		return findSmallType;
	}

	@Override
	public Product ajaxCheckProdcutName(String name) {
		Product product = this.dao.ajaxCheckProductName(name);
		return product;
	}

	@Override
	public boolean adminAddProduct(Product product, MultipartFile file,
			HttpServletRequest request) {
		// System.out.println(file.getName()+file.getOriginalFilename());
		// System.out.println("product:"+product.getName());
		String path = request.getSession().getServletContext()
				.getRealPath("/images/product");
		// 用时间的时分秒来进行图片的取名
		String imageName = DateUtil.getCurrentDateStr();
		String oldName = file.getOriginalFilename();
		// 进行图片的重新命名
		String uploadImage = imageName + "." + oldName.split("\\.")[1];
		// 找到文件的真实路径
		String filePath = path + File.separator + uploadImage;
		// System.out.println(uploadImage);
		// 构造新的product
		product.setHot(0);
		product.setHotTime(java.sql.Date.valueOf("1970-1-1"));
		product.setSpecialPrice(0);
		product.setSpecialPriceTime(java.sql.Date.valueOf("1970-1-1"));
		product.setPicture("images/product/" + uploadImage);
		// System.out.println(product);
		// 将收到的图片保存到指定的路径去
		InputStream in = null;
		FileOutputStream fos = null;
		try {
			in = file.getInputStream();
			fos = new FileOutputStream(new File(filePath));
			byte[] bbs = new byte[1024];
			int len = -1;
			while (-1 != (len = in.read(bbs))) {
				fos.write(bbs, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fos.close();
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// System.out.println(product);
		this.dao.adminAddProduct(product);
		return true;
	}

	@Override
	public boolean adminDeleteProduct(String idArrayString) {
		String[] idArray = idArrayString.split(",");
		for (int i = 0; i < idArray.length; i++) {
			this.dao.adminDeleteProduct(Integer.parseInt(idArray[i]));
		}
		return true;
	}

	@Override
	public boolean adminUpdateProduct(Product product, MultipartFile file,
			HttpServletRequest request) {
		if (file.getSize() != 0) {
			// System.out.println(file.getName()+file.getOriginalFilename());
			// System.out.println("product:"+product.getName());
			String path = request.getSession().getServletContext()
					.getRealPath("/images/product");
			// 用时间的时分秒来进行图片的取名
			String imageName = DateUtil.getCurrentDateStr();
			String oldName = file.getOriginalFilename();
			// 进行图片的重新命名
			String uploadImage = imageName + "." + oldName.split("\\.")[1];
			// 找到文件的真实路径
			String filePath = path + File.separator + uploadImage;
			// System.out.println(uploadImage);
			// 构造新的product
			product.setPicture("images/product/" + uploadImage);
			// System.out.println(product);
			// 将收到的图片保存到指定的路径去
			InputStream in = null;
			FileOutputStream fos = null;
			try {
				in = file.getInputStream();
				fos = new FileOutputStream(new File(filePath));
				byte[] bbs = new byte[1024];
				int len = -1;
				while (-1 != (len = in.read(bbs))) {
					fos.write(bbs, 0, len);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fos.close();
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			// System.out.println("有图片的修改"+product);
			// 要跟换图片的保存
			this.dao.adminUpdateProduct(product);
			return true;
		} else {
			// 没有图片传来的update
			// System.out.println("没有图片的修改"+product);
			this.dao.adminNotUpdateProduct(product);
			return true;
		}
	}

	@Override
	public boolean adminSetHotProduct(String idString) {
		String[] idhot = idString.split(",");
		for (int i = 0; i < idhot.length; i++) {
			Product hotProduct = new Product();
			hotProduct.setId(Integer.parseInt(idhot[i]));
			hotProduct.setHot(1);
			hotProduct.setHotTime(DateUtil.getCurrentDateStrCreate());
			this.dao.adminSethotProduct(hotProduct);
		}
		return true;
	}

	@Override
	public boolean adminSetSproduct(String idString) {
		String[] idSpecial = idString.split(",");
		for (int i = 0; i < idSpecial.length; i++) {
			Product specialProduct = new Product();
			specialProduct.setId(Integer.parseInt(idSpecial[i]));
			specialProduct.setSpecialPrice(1);
			specialProduct.setSpecialPriceTime(DateUtil
					.getCurrentDateStrCreate());
			this.dao.adminSetSProduct(specialProduct);
		}
		return true;
	}

	@Override
	public boolean adminCancelSpecialProduct(String idString) {
		String[] idSpecial = idString.split(",");
		for (int i = 0; i < idSpecial.length; i++) {
			Product cancelspecialProduct = new Product();
			cancelspecialProduct.setId(Integer.parseInt(idSpecial[i]));
			cancelspecialProduct.setSpecialPrice(0);
			cancelspecialProduct.setSpecialPriceTime(java.sql.Date
					.valueOf("1970-01-01"));
			this.dao.adminSetSProduct(cancelspecialProduct);
		}
		return true;
	}

	@Override
	public boolean adminCancelHotProduct(String idString) {
		String[] idhot = idString.split(",");
		for (int i = 0; i < idhot.length; i++) {
			Product cancelhotProduct = new Product();
			cancelhotProduct.setId(Integer.parseInt(idhot[i]));
			cancelhotProduct.setHot(0);
			cancelhotProduct.setHotTime(java.sql.Date.valueOf("1970-01-01"));
			this.dao.adminSethotProduct(cancelhotProduct);
		}
		return true;
	}
}
