package org.nxum.medicine.testdao;

import java.sql.SQLException;
import java.util.List;
import org.junit.Test;
import org.nxum.medicine.dao.AdminBigProductDao;
import org.nxum.medicine.dao.AdminCommentDao;
import org.nxum.medicine.dao.AdminLoginDao;
import org.nxum.medicine.dao.AdminNoticeDao;
import org.nxum.medicine.dao.AdminOrderDao;
import org.nxum.medicine.dao.AdminProductDao;
import org.nxum.medicine.dao.AdminSmallProductDao;
import org.nxum.medicine.dao.CommentDao;
import org.nxum.medicine.dao.MedicineBigTypeDao;
import org.nxum.medicine.dao.MedicineSmallTypeDao;
import org.nxum.medicine.dao.NavigationDao;
import org.nxum.medicine.dao.NewDao;
import org.nxum.medicine.dao.NoticesDao;
import org.nxum.medicine.dao.OrderDao;
import org.nxum.medicine.dao.ProductDao;
import org.nxum.medicine.dao.UserDao;
import org.nxum.medicine.entity.AdminComment;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.entity.Navigation;
import org.nxum.medicine.entity.New;
import org.nxum.medicine.entity.Notice;
import org.nxum.medicine.entity.Order;
import org.nxum.medicine.entity.OrderProduct;
import org.nxum.medicine.entity.Product;
import org.nxum.medicine.entity.User;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.view.entity.AdminProductResult;
import org.nxum.medicine.view.entity.AdminResultOrder;
import org.nxum.medicine.view.entity.AdminSeacherOrder;
import org.nxum.medicine.view.entity.AdminSeacherSmallProduct;
import org.nxum.medicine.view.entity.AdminSearchProductParamete;
import org.nxum.medicine.view.entity.AdminSmallProductResult;
import org.nxum.medicine.view.entity.OrderParameterUserIdOrOrderNo;
import org.nxum.medicine.view.entity.ResultSmallProduct;
import org.nxum.medicine.view.entity.UpdateOrderEntity;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.apache.commons.dbcp.BasicDataSource;

public class TestMybatis {
	ApplicationContext app = null;
	{
		app = new ClassPathXmlApplicationContext(
				"org/nxum/medicine/config/applicationContext.xml");

	}

	@Test
	public void getConnection() throws SQLException {
		BasicDataSource source = app.getBean(BasicDataSource.class);
		System.out.println(source.getConnection());
	}

	@Test
	public void getBigType() {
		MedicineBigTypeDao dao = app.getBean("medicineBigTypeDao",
				MedicineBigTypeDao.class);
		List<MedicineBigType> bigType = dao.findAll();
		System.out.println(bigType);
	}

	@Test
	public void getnews() {
		NewDao dao = app.getBean("newDao", NewDao.class);
		List<New> news = dao.findAll();
		System.out.println(news);
	}

	@Test
	public void getnotices() {
		NoticesDao dao = app.getBean("noticesDao", NoticesDao.class);
		List<Notice> notice = dao.findAll();
		System.out.println(notice);
	}

	@Test
	public void getnavigation() {
		NavigationDao dao = app.getBean("navigationDao", NavigationDao.class);
		List<Navigation> news = dao.findAll();
		System.out.println(news);
	}

	@Test
	public void gethotproduct() {
		ProductDao dao = app.getBean("productDao", ProductDao.class);
		List<Product> hots = dao.findHotAll();
		List<Product> sprical = dao.findSpricalAll();
		System.out.println(hots);
		System.out.println(sprical);
	}

	@Test
	public void getsmall() {
		MedicineSmallTypeDao dao = app.getBean("medicineSmallTypeDao",
				MedicineSmallTypeDao.class);
		List<MedicineSmalltype> smalls = dao.findAll();
		System.out.println(smalls);
	}

	@Test
	public void getBigTypeProduct() {
		ProductDao dao = app.getBean("productDao", ProductDao.class);
		Integer rowCount = dao.getRowCount(1);
		System.out.println(rowCount);
		Product product = new Product();
		product.setPageNow(3);
		product.setPageCount(6);
		product.setPageSize(4);
		product.setBigtypeId(1);
		List<Product> products = dao.findProductTigTypeList(product);
		System.out.println(products);
	}

	@Test
	public void getSmallTypeProduct() {
		ProductDao dao = app.getBean("productDao", ProductDao.class);
		Integer rowCount = dao.getSmallTypeRowCount(6);
		System.out.println(rowCount);
		Product product = new Product();
		product.setPageNow(1);
		product.setPageCount(6);
		product.setPageSize(3);
		product.setSmallTypeId(6);
		List<Product> products = dao.findMedicineSmallTypeList(product);
		System.out.println(products);
	}

	@Test
	public void getSmallNameProduct() {
		MedicineSmallTypeDao dao = app.getBean("medicineSmallTypeDao",
				MedicineSmallTypeDao.class);
		ResultSmallProduct resultSmall = new ResultSmallProduct();
		resultSmall.setPageNow(1);
		resultSmall.setPageCount(6);
		resultSmall.setPageSize(3);
		resultSmall.setSmallName("哮喘");
		Integer id = dao.getSmallTypeId("哮喘");
		System.out.println(id);
		List<ResultSmallProduct> res = dao
				.finMedicineSmallNameList(resultSmall);
		System.out.println(res);
	}

	@Test
	public void getMedicine() {
		ProductDao dao = app.getBean("productDao", ProductDao.class);
		Product product = dao.findMedicineById(9);
		System.out.println(product);
	}

	@Test
	public void geNews() {
		NewDao dao = app.getBean("newDao", NewDao.class);
		New news = dao.findByTitle("公交纵火案");
		System.out.println(news);

	}

	@Test
	public void geNotices() {
		NoticesDao dao = app.getBean("noticesDao", NoticesDao.class);
		Notice notices = dao.findByTitle("理学书降价啦");
		System.out.println(notices);

	}

	@Test
	public void saveUser() {
		UserDao dao = app.getBean("userDao", UserDao.class);
		User user = new User();
		user.setAddress("宁夏医科大学");
		user.setBirthday(java.sql.Date.valueOf("2013-12-11"));
		user.setEmail("1234@qq.com");
		user.setGender("M");
		user.setIdCard("1234567894125");
		user.setPassword("123456");
		user.setUserName("JAVA");
		user.setTrueName("JAVA");
		user.setMobile("12456789");
		dao.saveUser(user);
		System.out.println("保存完毕");
	}

	@Test
	public void checkmobile() {
		UserDao dao = app.getBean("userDao", UserDao.class);
		User user = new User();
		user.setMobile("12456789");
		Integer id = dao.existUserNameAndMobile(user);
		System.out.println(id);
	}

	@Test
	public void getUser() {
		UserDao dao = app.getBean("userDao", UserDao.class);
		User user = dao.findByUserName("JAVA");
		System.out.println(user);
	}

//	@Test
//	public void getComment() {
//		CommentDao dao = app.getBean("commentDao", CommentDao.class);
//		// List<Comment> comments = dao.findAllComment();
//		// System.out.println(comments);
//	}

	@Test
	public void getCommentRowCount() {
		CommentDao dao = app.getBean("commentDao", CommentDao.class);
		Integer count = dao.getCommentRowCount();
		System.out.println(count);
	}

	@Test
	public void saveOrderproduct() {
		OrderDao dao = app.getBean("orderDao", OrderDao.class);
		OrderProduct orderProduct = new OrderProduct();
		orderProduct.setNum(2);
		orderProduct.setOrderId(2);
		orderProduct.setProductId(5);
		dao.saveOrderProduct(orderProduct);
	}

	@Test
	public void saveOrder() {
		OrderDao dao = app.getBean("orderDao", OrderDao.class);
		Order order = new Order();
		order.setCost(23.0);
		order.setCreateTime(java.sql.Date.valueOf("2013-10-1"));
		order.setOrderNo("123456789");
		order.setStatus(1);
		order.setUserId(2);
		dao.saveOrder(order);
	}

	@Test
	public void getOrder() {
		OrderDao dao = app.getBean("orderDao", OrderDao.class);
		OrderParameterUserIdOrOrderNo orderpas = new OrderParameterUserIdOrOrderNo();
		orderpas.setOrderNo("2015011204572114");
		List<UpdateOrderEntity> orders = dao.findcurrentUserOrder(orderpas);
		for (UpdateOrderEntity order : orders) {
			System.out.println(order);
		}
	}

	@Test
	public void updateOrder() {
		OrderDao dao = app.getBean("orderDao", OrderDao.class);
		dao.updateStatus("2015011204592951");
		System.out.println("修改完成");
	}

	@Test
	public void adminLoginDao() {
		org.nxum.medicine.dao.AdminLoginDao dao = app.getBean("adminLoginDao",
				org.nxum.medicine.dao.AdminLoginDao.class);
		User user = dao.findByAdminUser("JAVA");
		System.out.println(user);
	}

	@Test
	public void adminUser() {
		AdminLoginDao dao = app.getBean("adminLoginDao", AdminLoginDao.class);
		AdminPageBean page = new AdminPageBean();
		page.setPage(1);
		page.setRows(2);
		List<User> users = dao.adminAllUser(page);
		System.out.println(users);
	}

	@Test
	public void getAdminCount() {
		AdminLoginDao dao = app.getBean("adminLoginDao", AdminLoginDao.class);
		int count = dao.getAdminUserCount();
		System.out.println(count);
	}

	@Test
	public void searchUserName() {
		AdminLoginDao dao = app.getBean("adminLoginDao", AdminLoginDao.class);
		User user = dao.adminSearchUserName("小明");
		System.out.println(user);
	}

	@Test
	public void adminDelete() {
		AdminLoginDao dao = app.getBean("adminLoginDao", AdminLoginDao.class);
		dao.adminDeleteUser(122);
		System.out.println("用户删除成功");
	}

	@Test
	public void adminProduct() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		AdminPageBean page = new AdminPageBean();
		page.setPage(1);
		page.setRows(3);
		List<AdminProductResult> products = dao.adminFindAllProduct(page);
		for (AdminProductResult product : products) {
			System.out.println(product);
		}
	}

	@Test
	public void adminProductCount() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		System.out.println(dao.getAdminProductCount());
	}

	@Test
	public void adminSearchProduct() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		AdminSearchProductParamete adminparameter = new AdminSearchProductParamete();
		adminparameter.setProductName("%Java%");
		adminparameter.setPage(1);
		adminparameter.setRows(5);

		List<AdminProductResult> lists = dao
				.adminSerachAllProduct(adminparameter);
		System.out.println(lists);
		for (AdminProductResult list : lists) {
			System.out.println(list);
		}
	}

	@Test
	public void adminSearchProductCount() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		AdminSearchProductParamete adminparameter = new AdminSearchProductParamete();
		adminparameter.setProductName("%Java%");
		Integer count = dao.getAdminSearchCount(adminparameter);
		System.out.println(count);
	}

	@Test
	public void adminFindBig() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		List<MedicineBigType> lists = dao.adminFindAllProductBig();
		System.out.println(lists);
		List<MedicineSmalltype> listss = dao.adminFindAllProductSmall(3);
		System.out.println(listss);
	}

	@Test
	public void ajaxadminFindBig() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		Product p = dao.ajaxCheckProductName("Java编程思想");
		System.out.println(p);
	}

	@Test
	public void adminAddProduct() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		Product product = new Product();
		product.setBigtypeId(1);
		product.setSmallTypeId(1);
		product.setHot(0);
		product.setHotTime(java.sql.Date.valueOf("1970-01-01"));
		product.setSpecialPrice(0);
		product.setSpecialPriceTime(java.sql.Date.valueOf("1970-01-01"));
		product.setPicture("images/product/1510.jpg");
		product.setDescription("太好啦");
		product.setName("java玩共享");
		product.setPrice(12.0);
		product.setStock(34);
		dao.adminAddProduct(product);
		System.out.println("保存完毕");
	}

	@Test
	public void adminDeleteProduct() {
		AdminProductDao dao = app.getBean("adminProductDao",
				AdminProductDao.class);
		dao.adminDeleteProduct(229);
		System.out.println("删除成功");
	}

	@Test
	public void adminSelectBigProduct() {
		AdminBigProductDao dao = app.getBean("adminBigProductDao",
				AdminBigProductDao.class);
		AdminPageBean pageBean = new AdminPageBean();
		pageBean.setPage(1);
		pageBean.setRows(3);
		List<MedicineBigType> lists = dao.adminFindBigProduct(pageBean);
		System.out.println(lists);
	}

	@Test
	public void getAdminBigCount() {
		AdminBigProductDao dao = app.getBean("adminBigProductDao",
				AdminBigProductDao.class);
		Integer count = dao.adminGetBigProductCount();
		System.out.println(count);
	}

	@Test
	public void adminCheckBigProdouct() {
		AdminBigProductDao dao = app.getBean("adminBigProductDao",
				AdminBigProductDao.class);
		MedicineBigType bigProduct = dao.adminCheckBigProductName("中医学");
		System.out.println(bigProduct);
	}

	@Test
	public void adminCheckBigProductProduct() {
		AdminBigProductDao dao = app.getBean("adminBigProductDao",
				AdminBigProductDao.class);
		/*
		 * List<Product> products = dao.adminCheckRelatedProduct(1);
		 * List<MedicineSmalltype> smallProduct =
		 * dao.adminCheckRelatedSmallProdouct(1); System.out.println(products);
		 * System.out.println("+++++++++++++++++++++++++++++++");
		 * System.out.println(smallProduct);
		 */
		dao.adminDeleteBigProduct(21);
		System.out.println("删除成功");
	}

	@Test
	public void adminFindSmallProduct() {
		AdminSmallProductDao dao = app.getBean("adminSmallProductDao",
				AdminSmallProductDao.class);
		AdminPageBean pageBean = new AdminPageBean();
		pageBean.setPage(1);
		pageBean.setRows(4);
		List<AdminSmallProductResult> lists = dao
				.adminFindAllSmallProduct(pageBean);
		System.out.println(lists);
	}

	@Test
	public void adminSmallProductCount() {
		AdminSmallProductDao dao = app.getBean("adminSmallProductDao",
				AdminSmallProductDao.class);
		Integer count = dao.adminGetSmallProductCount();
		System.out.println(count);
	}

	@Test
	public void adminSeacherSmallProduct() {
		AdminSmallProductDao dao = app.getBean("adminSmallProductDao",
				AdminSmallProductDao.class);
		AdminSeacherSmallProduct admin = new AdminSeacherSmallProduct();
		admin.setPage(1);
		admin.setSmallProductName("图像类");
		admin.setRows(4);
		List<AdminSmallProductResult> smalls = dao
				.adminSeacherSmallProduct(admin);
		System.out.println(smalls);
		Integer total = dao.adminSeacherSmallProductCount(admin);
		System.out.println(total);
	}

	@Test
	public void adminAddSmallProduct() {
		AdminSmallProductDao dao = app.getBean("adminSmallProductDao",
				AdminSmallProductDao.class);
		MedicineSmalltype smallProduct = new MedicineSmalltype();
		smallProduct.setBigTypeId(81);
		smallProduct.setName("计算机组成原理");
		smallProduct.setRemarks("这是一本好书");
		dao.adminAddSmallProduct(smallProduct);
		System.out.println(smallProduct);
	}

//	@Test
//	public void adminFindOrder() {
//		AdminOrderDao dao = app.getBean("adminOrderDao", AdminOrderDao.class);
//		// List<AdminResultOrder> list = dao.adminFindOrder();
//		// System.out.println(list);
//	}

	@Test
	public void adminGetRowCount() {
		AdminOrderDao dao = app.getBean("adminOrderDao", AdminOrderDao.class);
		Integer rowCount = dao.adminOrderCount();
		System.out.println(rowCount);
	}

	@Test
	public void adminSeacherOrderCount() {
		AdminOrderDao dao = app.getBean("adminOrderDao", AdminOrderDao.class);
		AdminSeacherOrder adminSeacherOrder = new AdminSeacherOrder();
		adminSeacherOrder.setOrderno("%" + "2015" + "%");
		adminSeacherOrder.setTruename("小花");
		adminSeacherOrder.setPage(1);
		adminSeacherOrder.setRows(5);
		List<AdminResultOrder> seacherorders = dao
				.adminSeacherOrder(adminSeacherOrder);

		Integer rowCount = dao.adminSeacherOrderCount(adminSeacherOrder);
		System.out.println("查询回来都的数据" + rowCount);
		System.out.println("查询到的用户的order" + seacherorders);
	}

	@Test
	public void OrderDialogDetail() {
		AdminOrderDao dao = app.getBean("adminOrderDao", AdminOrderDao.class);
		List<UpdateOrderEntity> orders = dao
				.AdminSeacherOrderByOrderno("2015011204572114");
		System.out.println(orders);
	}

	@Test
	public void adminComment() {
		AdminCommentDao dao = app.getBean("adminCommentDao",
				AdminCommentDao.class);
		AdminPageBean adminPageBean = new AdminPageBean();
		adminPageBean.setPage(1);
		adminPageBean.setRows(4);
		List<AdminComment> comments = dao.adminFindComment(adminPageBean);
		Integer count = dao.adminCommentCount();
		System.out.println(count);
		System.out.println(comments);
	}

	@Test
	public void adminseacherComment() {
		AdminCommentDao dao = app.getBean("adminCommentDao",
				AdminCommentDao.class);
		List<AdminComment> comments = dao.adminSeacherComment("小明");
		System.out.println(comments);
	}

	@Test
	public void adminNotice() {
		AdminNoticeDao dao = app
				.getBean("adminNoticeDao", AdminNoticeDao.class);
		List<Notice> notices = dao.adminFindNotice();
		System.out.println(notices);
	}
}
