package com.creidtsys.apps.auth.service;

import java.util.List;

import com.creidtsys.apps.auth.entity.SysDept;
import com.creidtsys.utils.TreeModel;

/**
 * 
* @ClassName: SysDeptService
* @Description: TODO 权限组织servicre层
* @author liuyj
* @date 2017年8月26日 上午10:39:01
*
 */
public interface SysDeptService {
	/**
	 * 
	* @Title: getAllDept 
	* @Description: TODO  查询所有部门信息 
	* @param deptParentId  上级部门信息
	* @return    
	* @return List<SysDept>    返回类型
	 */
	List<SysDept> getAllDept(String deptParentId);
	/**
	 * 
	* @Title: initDeptTree 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @return    
	* @return List<SysDept>    返回类型
	 */
	List<SysDept> initDeptTree();
	/**
	 * 
	* @Title: saveDept 
	* @Description: TODO    添加组织机构
	* @param sysDept    
	* @return void    返回类型
	 */
	void saveDept(SysDept sysDept);
	/**
	 * 
	* @Title: delDept 
	* @Description: TODO 删除组织机构
	* @param ids    传递来的组织机构标识
	* @return void    返回类型
	 */
	void delDept(String ids);
	/**
	 * 
	* @Title: updateDept 
	* @Description: TODO 修改数据
	* @param sysDept    
	* @return void    返回类型
	 */
	void updateDept(SysDept sysDept);
	/**
	 * 
	* @Title: selectTree 
	* @Description: TODO 获得数数据格式
	* @param id
	* @return    
	* @return TreeModel    返回类型
	 */
	TreeModel selectTree(String id);
	/**
	 * 
	* @Title: getById 
	* @Description: TODO  根据主键查询部门信息
	* @param deptId
	* @return    
	* @return SysDept    返回类型
	 */
	SysDept getById(String deptId);

}
