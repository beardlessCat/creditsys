package com.creidtsys.utils;

import java.io.File;
import java.util.Locale;

import org.springframework.web.servlet.view.InternalResourceView;

/**
 * 配置多个视图解析器，重写checkResource方法
 * @author Administrator
 *
 */
public class HtmlResourceView extends InternalResourceView{
	 @Override  
     public boolean checkResource(Locale locale) {  
      File file = new File(this.getServletContext().getRealPath("/") + getUrl());  
      return file.exists();// 判断该页面是否存在  
     }  
}
