package com.creidtsys.apps.auth.service;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.SysRoleRes;

/**
 * 
* @ClassName: SysRoleResService
* @Description: TODO 权限角色资源service
* @author liuyj
* @date 2017年8月26日 上午10:50:30
*
 */
public interface SysRoleResService {
	/**
	 * 
	* @Title: resRoleTree 
	* @Description: TODO 根据角色id获得权限
	* @param roleId
	* @return    
	* @return List<SysUserRes>    返回类型
	 */
	List<SysRoleRes> resRoleTree(String roleId);
	/**
	 * 
	* @Title: saveRela 
	* @Description: TODO 修改保存角色资源关系
	* @param map    
	* @return void    返回类型
	 */
	void saveRela(Map<String, String> map);

}
