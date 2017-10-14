package com.creidtsys.apps.auth.service;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.entity.SysUserRes;

/**
 * 
* @ClassName: SysUserResService
* @Description: TODO 用户权限关系service层
* @author liuyj
* @date 2017年8月26日 上午10:55:57
*
 */
public interface SysUserResService {
	/**
	 * 
	* @Title: getResByUser 
	* @Description: TODO 查询用户所有权限
	* @param userId
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysUserRes> getResByUser(String userId);
	/**
	 * 
	* @Title: getUserRes 
	* @Description: TODO 获得用户单独的授权
	* @param userId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> getUserRes(String userId);
	/**
	 * 
	* @Title: getRoleRes 
	* @Description: TODO 获的用户所属角色的权限
	* @param userId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	
	List<SysUserRes> getRoleRes(String userId);
	/**
	 * 
	* @Title: resUserTree 
	* @Description: TODO huoide 获得含有checkbox的权限树 
	* @param userId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> resUserTree(String userId);
	/**
	 * 
	* @Title: saveUserRes 
	* @Description: TODO 对对用户与权限之间的关系进行维护
	* @param map
	* @return    
	* @return void    返回类型
	 */
	void saveUserRes(Map<String, String> map);
	/**
	 * 
	* @Title: getPermissionByNo 
	* @Description: TODO 根据用户编号获得其权限
	* @param userNo
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysUserRes> getPermissionByNo(String userNo);
	/**
	 * 
	* @Title: getAuthMenu 
	* @Description: TODO 获取菜单权限
	* @param userId
	* @return    
	* @return List<Map<String,String>>    返回类型
	 */
	List<Map<String, String>> getAuthMenu(String userNo);
	/**
	 * 
	* @Title: findRoots 
	* @Description: TODO 拼接成手风琴字符串
	* @param list
	* @return    
	* @return List    返回类型
	 */
	List findRoots(List<Map<String, String>> list);

}