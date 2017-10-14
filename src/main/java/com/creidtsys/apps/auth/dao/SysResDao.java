package com.creidtsys.apps.auth.dao;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.entity.SysRole;

/**
 * 
* @ClassName: SysResDao
* @Description: TODO 权限资源dao层
* @author liuyj
* @date 2017年8月26日 上午10:44:07
*
 */
public interface SysResDao {
	/**
	 * 
	* @Title: getRes 
	* @Description: TODO 查询所有权限资源
	* @return    
	* @return List<SysRes>    返回类型
	 */
	List<SysRes> getRes();
	/**
	 * 
	* @Title: addRes 
	* @Description: TODO 添加权限资源信息
	* @param sysRes    
	* @return void    返回类型
	 */
	void addRes(SysRes sysRes);
	/**
	 * 
	* @Title: getTreeDate 
	* @Description: TODO 根据id或者pid获得资源
	* @param para
	* @return    
	* @return List<SysRes>    返回类型
	 */
	
	List<SysRes> getTreeDate(Map<String, Object> para);
	/**
	 * 
	* @Title: editRes 
	* @Description: TODO 更新权限信息 
	* @param sysRes    
	* @return void    返回类型
	 */
	void editRes(SysRes sysRes);
	/**
	 * 
	* @Title: delRes 
	* @Description: TODO 删除其及其下资源
	* @param resId    
	* @return void    返回类型
	 */
	void delRes(String resId);

}
