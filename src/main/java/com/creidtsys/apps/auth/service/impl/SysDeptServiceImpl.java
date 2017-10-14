package com.creidtsys.apps.auth.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.creidtsys.apps.auth.dao.SysDeptDao;
import com.creidtsys.apps.auth.entity.SysDept;
import com.creidtsys.apps.auth.service.SysDeptService;
import com.creidtsys.utils.TreeModel;
import com.creidtsys.utils.TreeUtils;

/**
 * 
* @ClassName: SysDeptService
* @Description: TODO 权限组织servicre层
* @author liuyj
* @date 2017年8月26日 上午10:39:01
 */
@Service("sysDeptService")
public class SysDeptServiceImpl implements SysDeptService {
	@Autowired
	private SysDeptDao sysDeptDao ;
	@Override
	public List<SysDept> getAllDept(String deptParentId) {
		// TODO Auto-generated method stub
		List<SysDept> list = sysDeptDao.getSysDept(deptParentId) ;
		return list;
	}
	@Override
	public List<SysDept> initDeptTree() {
		// TODO Auto-generated method stub
		List<SysDept> list = sysDeptDao.getSysDept("") ;
		return list;
	}
	@Override
	public void saveDept(SysDept sysDept) {
		// TODO Auto-generated method stub
		sysDeptDao.addDept(sysDept) ;
	}
	@Override
	public void delDept(String ids) {
		// TODO Auto-generated method stub
		for(String deptId :ids.split(",")){
			sysDeptDao.delDept(deptId) ;
		}
	}
	@Override
	public void updateDept(SysDept sysDept) {
		// TODO Auto-generated method stub
		sysDeptDao.editDept(sysDept) ;
	}
	@Override
	public TreeModel selectTree(String id) {
		// TODO Auto-generated method stub
		TreeModel tm = new TreeModel();  
        //在此只保留部门或单位的id及name属性,可拓展  
        String[] s = new String[] { "getDeptId", "getDeptName" };  
        List<SysDept> li = this.selectChildren(id);  
        this.tree(tm, li, s);  
        return tm;  
	}
	private void tree(TreeModel tm, List<SysDept> li, String[] s ) {  
        if (!CollectionUtils.isEmpty(li)) {  
            for (int i = 0, l = li.size(); i < l; i++) {  
                TreeModel ntm = new TreeModel();  
                SysDept tree = li.get(i);  
                TreeUtils.copyModel(ntm, tree, s);// 复制值到TreeModel  
                tm.getChildren().add(ntm);// 添加到孩子节点列表  
				List<SysDept> list = this.selectChildren(tree.getDeptId());
				tree(ntm, list, s);// 递归，实现无限层级  
            }  
        }  
    }  
 private List<SysDept> selectChildren(String id) {  
        Map<String, Object> para = new HashMap<String, Object>();  
        para.put("deptParentId", id);  
        return sysDeptDao.getTreeDate(para);  
    }
@Override
public SysDept getById(String deptId) {
	// TODO Auto-generated method stub
	SysDept dept = sysDeptDao.getById(deptId);
	return dept ;
}  
}
