package com.creidtsys.apps.auth.dao;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.entity.SysUserRes;

/**
 * 
* @ClassName: SysUserResDao
* @Description: TODO 用户权限关系dao
* @author liuyj
* @date 2017年8月26日 上午10:55:14
*
 */
public interface SysUserResDao {
	/**
	 * 
	* @Title: getResByUser 
	* @Description: TODO 根据用户查询其所有权限
	* @param userId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> getResByUser(String userId);
	/**
	 * 
	* @Title: getUserRes 
	* @Description: TODO  获得用户单独授权你的权限
	* @param userId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> getUserRes(String userId);
	/**
	 * 
	* @Title: getRoleRes 
	* @Description: TODO 获得用户所属角色的权限
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> getRoleRes(String userId);
	/**
	 * 
	* @Title: getChecked 
	* @Description: TODO 获得含有checkbox的权限树
	* @param userId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> getChecked(String userId);
	/**
	 * 
	* @Title: delResByUser 
	* @Description: TODO 删除用户权限之间的关系
	* @param userId    
	* @return void    返回类型
	 */
	
	void delResByUser(String userId);
	/**
	 * 
	* @Title: addRes 
	* @Description: TODO 添加用户与权限之间的关系
	* @param userRes    
	* @return void    返回类型
	 */
	
	void addRes(SysUserRes userRes);
	/**
	 * 
	* @Title: getResByNo 
	* @Description: TODO 根据用户编号获得其权限
	* @param userNo
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysUserRes> getResByNo(String userNo);
	/**
	 * 
	* @Title: getAuthMenu 
	* @Description: TODO 获得用户已经授权的菜单
	* @param userNo
	* @return    
	* @return List<Map<String,String>>    返回类型
	 */
	List<Map<String, String>> getAuthMenu(String userNo);
	
	/**
	 * 
	* @Title: get 
	* @Description: TODO 无效测试
	* @param userNo
	* @return    
	* @return List<Map<String,String>>    返回类型
	 */
	List<Map<String, String>> get(String userNo);
	/**
	 * 
	* @Title: getLeafId 
	* @Description: TODO 根据用户获取权限叶子节点
	* @param userNo
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysUserRes> getLeafId(String userNo);
	/**
	 * 
	* @Title: getResPid 
	* @Description: TODO 递归根据机获取父节点
	* @param resId
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysRes> getResPid(String resId);

}
