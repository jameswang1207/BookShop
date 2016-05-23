package org.nxum.medicine.util;

import java.util.Random;
//产生一0-100间的随机数
public class RandomData {
	public static  String  randomData(){
      Random  random  =  new Random();
      Integer  one =  random.nextInt(100);
        return  one.toString();
	 }
}
