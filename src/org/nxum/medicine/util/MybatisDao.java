package org.nxum.medicine.util;
import org.springframework.stereotype.Repository;
@Repository
public @interface MybatisDao {
  String value() default "";
}
