package org.nxum.medicine.serviceImpl;
import java.util.List;

import org.nxum.medicine.dao.AdminBigProductDao;
import org.nxum.medicine.entity.AdminPageBean;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.entity.MedicineSmalltype;
import org.nxum.medicine.service.AdminBigProductService;
import org.nxum.medicine.view.entity.AdminSeacherBigProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("adminBigProductService")
public class AdminBigProductServiceImpl  implements  AdminBigProductService{
	@Autowired
    private  AdminBigProductDao   dao;
	public void setDao(AdminBigProductDao dao) {
		this.dao = dao;
	}

	public List<MedicineBigType> adminFindBigProduct(Integer page,Integer rows) {
		AdminPageBean  pageBean  =  new AdminPageBean();
		pageBean.setPage(page);
		pageBean.setRows(rows);
		List<MedicineBigType>  bigProduct =  this.dao.adminFindBigProduct(pageBean);
		   if(bigProduct.size()!=0){
			     return  bigProduct;
		   }else{
			     return null;
		   }
		  
	}

	@Override
	public Integer adminGetBigProductCount() {
		 Integer   total =  this.dao.adminGetBigProductCount();
		return total;
	}

	@Override
	public List<MedicineBigType> adminSeacherProduct(AdminSeacherBigProduct seacherBigProduct) {
		 List<MedicineBigType>  seacherBigProducts =
				                   this.dao.adminSeacherBigProduct(seacherBigProduct);
		        if(seacherBigProducts.size()!=0){
		        	return   seacherBigProducts;
		        }else{
		        	return  null;
		        }
		
	}

	@Override
	public Integer getSeacherBigProductCount(String bigProductName) {
		        Integer   total =     this.dao.adminSeacherBigProductCount(bigProductName);
		        return   total;
	}
	@Override
	public boolean adminCheckBigProductName(String name) {
		 MedicineBigType  bigProdut =  this.dao.adminCheckBigProductName(name);
		     if(bigProdut!=null){
		    	   return true;
		     }else{
		    	   return false;
		     }
	}

	@Override
	public boolean adminAddBigProduct(MedicineBigType bigProduct) {
		          this.dao.adminAddBigProduct(bigProduct);
		          return   true;
	}

	@Override
	public boolean adminUpdateBigProduct(MedicineBigType bigProduct) {
		         this.dao.adminUpdateBigProduct(bigProduct);
	             return   true;
	}

	@Override
	public boolean adminDeleteBigProduct(Integer bigProductId) {
	    List<MedicineSmalltype>  smallProduct  =  this.dao.adminCheckRelatedSmallProdouct(bigProductId);
//System.out.println("商品小类"+smallProduct);
	     if(smallProduct.size()!=0){
//System.out.println("没有商品小类++++++++++++++++++++++++++===");
                    return  false;	    	 
	     } else{
	    	       //进行商品大类的删除
	    	        this.dao.adminDeleteBigProduct(bigProductId);
	    	        return  true;
	     }
	}
}
