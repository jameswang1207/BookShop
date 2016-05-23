package org.nxum.medicine.dao;
import java.util.List;
import org.nxum.medicine.entity.MedicineBigType;
import org.nxum.medicine.util.MybatisDao; 
@MybatisDao
public interface MedicineBigTypeDao{
    public   List<MedicineBigType>  findAll();
}
