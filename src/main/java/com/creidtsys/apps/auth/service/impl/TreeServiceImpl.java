package com.creidtsys.apps.auth.service.impl;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.creidtsys.apps.auth.dao.TreeDao;
import com.creidtsys.apps.auth.entity.Tree;
import com.creidtsys.apps.auth.service.TreeService;
import com.creidtsys.utils.TreeModel;
import com.creidtsys.utils.TreeUtils;
@Service("treeService")
public class TreeServiceImpl implements TreeService{
	@Autowired
	private TreeDao treeDao ;
	@Override
	 public TreeModel selectTree(String id) {  
        TreeModel tm = new TreeModel();  
        //在此只保留部门或单位的id及name属性,可拓展  
        String[] s = new String[] { "getDeptId", "getDeptName" };  
        List<Tree> li = this.selectChildren(id,"pid");  
        this.tree(tm, li, s,"pid");  
        return tm;  
    }  
	 private void tree(TreeModel tm, List<Tree> li, String[] s ,String pid  ) {  
	        if (!CollectionUtils.isEmpty(li)) {  
	            for (int i = 0, l = li.size(); i < l; i++) {  
	                TreeModel ntm = new TreeModel();  
	                Tree tree = li.get(i);  
	                TreeUtils.copyModel(ntm, tree, s);// 复制值到TreeModel  
	                tm.getChildren().add(ntm);// 添加到孩子节点列表  
	                Class<?> clazz = tree.getClass();// 获取类包名  
	                try {
						Method id = clazz.getMethod(s[0]);
						List<Tree> list = this.selectChildren(String.valueOf(id.invoke(tree)),pid);
						tree(ntm, list, s,pid);// 递归，实现无限层级  
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}// 约定第1个为id  	                
	            }  
	        }  
	    }  
	 private List<Tree> selectChildren(String id,String pid) {  
	        Map<String, Object> para = new HashMap<String, Object>();  
	        para.put(pid, id);  
	        return treeDao.list(para);  
	    }  
}
