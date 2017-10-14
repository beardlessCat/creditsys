package com.creidtsys.apps.auth.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.auth.dao.SysRoleResDao;
import com.creidtsys.apps.auth.entity.SysRoleRes;
import com.creidtsys.apps.auth.service.SysRoleResService;
import com.creidtsys.utils.ShiroUtils;
/**
 * 
* @ClassName: SysRoleResImpl
* @Description: TODO 权限角色资源service实现类
* @author liuyj
* @date 2017年8月26日 上午10:52:07
*
 */
@Service("sysRoleResService")
public class SysRoleResImpl implements SysRoleResService{
	@Autowired
	private SysRoleResDao sysRoleResDao ;

	@Override
	public List<SysRoleRes> resRoleTree(String roleId) {
		// TODO Auto-generated method stub
		List<SysRoleRes> list = sysRoleResDao.getResByRole(roleId) ;
		return list;
	}
	@Override
	public void saveRela(Map<String, String> map) {
		// TODO Auto-generated method stub
		String roleId = map.get("roleId") ;
		String resIds = map.get("resIds") ;
		//删除之前的关系维护
		sysRoleResDao.delResByRole(roleId) ;
		//对新的关系进行维护		
		if(resIds!=null&&!"".equals(resIds)){
			for(String resId : resIds.split(",")){
				SysRoleRes userRes = new SysRoleRes() ;
				userRes.setRrResId(resId);
				userRes.setRrRoleId(roleId);
				sysRoleResDao.addRes(userRes) ;
			}	
		}
		// 动态更新权限 重新赋值权限
		ShiroUtils.clearAuth();
	}
}
