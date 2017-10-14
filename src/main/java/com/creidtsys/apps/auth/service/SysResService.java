package com.creidtsys.apps.auth.service;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.entity.SysRole;
import com.creidtsys.utils.TreeModel;

/**
 * 
* @ClassName: SysResService
* @Description: TODO 权限资源service 
* @author liuyj
* @date 2017年8月26日 上午10:45:27
*
 */
public interface SysResService {
	/**
	 * 
	* @Title: getAllRes 
	* @Description: TODO 查询所有的权限资源
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysRes> getAllRes();
	/**
	 * 
	* @Title: initResTree 
	* @Description: TODO  初始化资源权限树
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysRes> initResTree();
	/**
	 * 
	* @Title: saveRole 
	* @Description: TODO 添加权限资源信息
	* @param sysRes    
	* @return void    返回类型
	 */
	void saveRole(SysRes sysRes);
	/**
	 * 
	* @Title: selectTree 
	* @Description: TODO 获取资源树
	* @param id
	* @return    
	* @return TreeModel    返回类型
	 */
	TreeModel selectTree(String id);
	/**
	 * 
	* @Title: updateRes 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param sysRes    
	* @return void    返回类型
	 */
	void updateRes(SysRes sysRes);
	/**
	 * 
	* @Title: delRes 
	* @Description: TODO 删除资源
	* @param ids    
	* @return void    返回类型
	 */
	void delRes(String ids);

}
