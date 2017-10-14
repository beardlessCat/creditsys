package com.creidtsys.apps.auth.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.creidtsys.apps.auth.dao.SysResDao;
import com.creidtsys.apps.auth.entity.SysRes;
import com.creidtsys.apps.auth.service.SysResService;
import com.creidtsys.utils.TreeModel;
import com.creidtsys.utils.TreeUtils;
/**
 * 
* @ClassName: SysResServiceImpl
* @Description: TODO 权限资源service实现类
* @author liuyj
* @date 2017年8月26日 上午10:46:41
*
 */
@Service("sysResService")
public class SysResServiceImpl implements SysResService {
	@Autowired
	private SysResDao sysResDao ;

	@Override
	@Cacheable(value = "myCache",key="test") 
	public List<SysRes> getAllRes() {
		// TODO Auto-generated method stub
		List<SysRes> list = sysResDao.getRes();
		return list;
	}

	@Override
	public List<SysRes> initResTree() {
		// TODO Auto-generated method stub
		List<SysRes> list = sysResDao.getRes();
		return list;
		
	}

	@Override
	public void saveRole(SysRes sysRes) {
		// TODO Auto-generated method stub
		sysResDao.addRes(sysRes) ;
	}

	@Override
	public TreeModel selectTree(String id) {
		// TODO Auto-generated method stub
		TreeModel tm = new TreeModel();  
        //在此只保留部门或单位的id及name属性,可拓展  
        String[] s = new String[] { "getResId", "getResName" };  
        List<SysRes> li = this.selectChildren(id);  
        this.tree(tm, li, s);  
        return tm;  
	}
	private void tree(TreeModel tm, List<SysRes> li, String[] s ) {  
        if (!CollectionUtils.isEmpty(li)) {  
            for (int i = 0, l = li.size(); i < l; i++) {  
                TreeModel ntm = new TreeModel();  
                SysRes tree = li.get(i);  
                TreeUtils.copyModel(ntm, tree, s);// 复制值到TreeModel  
                tm.getChildren().add(ntm);// 添加到孩子节点列表  
				List<SysRes> list = this.selectChildren(tree.getResId());
				tree(ntm, list, s);// 递归，实现无限层级  
            }  
        }  
    }  
 private List<SysRes> selectChildren(String id) {  
        Map<String, Object> para = new HashMap<String, Object>();  
        para.put("resParentId", id);  
        return sysResDao.getTreeDate(para);  
    }

@Override
@CacheEvict(value="myCache",beforeInvocation=true)
public void updateRes(SysRes sysRes) {
	// TODO Auto-generated method stub
	sysResDao.editRes(sysRes) ;
}

@Override
public void delRes(String ids) {
	// TODO Auto-generated method stub
	String resId = ids ;
	sysResDao.delRes(resId) ;
}  
}
