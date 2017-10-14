package com.creidtsys.apps.auth.dao;

import java.util.List;
import java.util.Map;

import com.creidtsys.apps.auth.entity.SysDept;
import com.creidtsys.apps.auth.entity.Tree;

/**
 * 
* @ClassName: SysDeptDao
* @Description: TODO 权限组织dao层
* @author liuyj
* @date 2017年8月26日 上午10:38:19
*
 */
public interface SysDeptDao {
	/**
	 * 
	* @Title: getSysDept 
	* @Description: TODO 查询部门信息
	* @param deptParentId  上级部门信息
	* @return    
	* @return List<SysDept>    返回类型
	 */
	List<SysDept> getSysDept(String deptParentId);
	/**
	 * 
	* @Title: addDept 
	* @Description: TODO 添加组织机构 
	* @param sysDept    
	* @return void    返回类型
	 */
	void addDept(SysDept sysDept);
	/**
	 * 
	* @Title: delDept 
	* @Description: TODO 根据主键删除组织机构信息
	* @param deptId    
	* @return void    返回类型
	 */
	void delDept(String deptId);
	/**
	 * 
	* @Title: editDept 
	* @Description: TODO 修改组织机构信息
	* @param sysDept    
	* @return void    返回类型
	 */
	void editDept(SysDept sysDept);
	/**
	 * 
	* @Title: getTreeDate 
	* @Description: TODO 根据id或者pid获取数据
	* @param para
	* @return    
	* @return List<Tree>    返回类型
	 */
	List<SysDept> getTreeDate(Map<String, Object> para);
	/**
	 * 
	* @Title: getById 
	* @Description: TODO 根据主键获得部门信息
	* @param deptId
	* @return    
	* @return SysDept    返回类型
	 */
	SysDept getById(String deptId);
}
