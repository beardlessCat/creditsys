package com.creidtsys.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.mgt.RealmSecurityManager;
import com.creidtsys.security.realm.ShiroDbRealm;
/**
 * 
* @ClassName: ShiroUtils
* @Description: TODO 当前用户信息处理类
* @author liuyj
* @date 2017年9月7日 下午6:58:38
*
 */
public class ShiroUtils {
	/**
	 * 
	* @Title: getCurrentUser 
	* @Description: TODO 获取当前用户登录名
	* @return    
	* @return String    返回类型
	 */
	
	public static  String getLoginName(){
		String userNo = (String) SecurityUtils.getSubject().getPrincipals().iterator().next() ;
		return userNo ;
	}
	/**
	 * 
	* @Title: clearAuth 
	* @Description: TODO 清空所有资源权限  
	* @return void    返回类型
	 */
	public static void clearAuth(){
		RealmSecurityManager rsm = (RealmSecurityManager)SecurityUtils.getSecurityManager();
		ShiroDbRealm realm = (ShiroDbRealm)rsm.getRealms().iterator().next();
		realm.clearAuthz();
	}
}
