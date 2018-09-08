package com.qfedu.utils;

import java.util.UUID;

public class MyFileUtil {

    //重名文件名
   public static String getFileName(String fileName){
       if(fileName.length()>50){
          fileName = fileName.substring(fileName.length()-50);
       }
       return UUID.randomUUID().toString().replaceAll("-","")+"_"+fileName;
   }
}
