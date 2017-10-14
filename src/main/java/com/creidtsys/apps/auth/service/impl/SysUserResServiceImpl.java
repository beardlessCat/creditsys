package com.creidtsys.apps.auth.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.creidtsys.apps.auth.dao.SysUserResDao;
import com.creidtsys.apps.auth.entity.SysUserRes;
import com.creidtsys.apps.auth.service.SysUserResService;
import com.creidtsys.utils.ShiroUtils;

/**
 * 
* @ClassName: SysUserResServiceImpl
* @Description: TODO 用户权限关系service实现类
* @author liuyj
* @date 2017年8月26日 上午10:56:57
*
 */
@Service("sysUserResService")
public class SysUserResServiceImpl implements SysUserResService{
	@Autowired
	private SysUserResDao userResDao ;

	@Override
	public List<SysUserRes> getResByUser(String userId) {
		// TODO Auto-generated method stub
		List<SysUserRes> list = userResDao.getResByUser(userId) ;
		return list;
	}

	@Override
	public List<SysUserRes> getUserRes(String userId) {
		// TODO Auto-generated method stub
		List<SysUserRes> list = userResDao.getUserRes(userId) ;
		return list;
	}

	@Override
	public List<SysUserRes> getRoleRes(String userId) {
		// TODO Auto-generated method stub
		List<SysUserRes> list = userResDao.getRoleRes(userId) ;
		return list;
	}

	@Override
	public List<SysUserRes> resUserTree(String userId) {
		// TODO Auto-generated method stub
		List<SysUserRes> list = userResDao.getChecked(userId) ;
		return list;
	}

	@Override
	public void saveUserRes(Map<String, String> map) {
		// TODO Auto-generated method stub
		String userId = map.get("userId") ;
		String resIds = map.get("resIds") ;
		//删除之前的关系维护
		userResDao.delResByUser(userId) ;
		//对新的关系进行维护		
		if(resIds!=null&&!"".equals(resIds)){
			for(String resId : resIds.split(",")){
				SysUserRes userRes = new SysUserRes() ;
				userRes.setUrResId(resId);
				userRes.setUrUserId(userId);
				userResDao.addRes(userRes) ;
			}	
		}
		// 动态更新权限 重新赋值权限
		ShiroUtils.clearAuth();
	}

	@Override
	public List<SysUserRes> getPermissionByNo(String userNo) {
		// TODO Auto-generated method stub
		List<SysUserRes> list =userResDao.getResByNo(userNo) ;
		return list;
	}
	/**启用注解
	 * 
	 */
	@Override
	@Cacheable(value = "myCache") 
	public List<Map<String, String>> getAuthMenu(String userNo) {
		SysUserRes userRes = new SysUserRes() ;
		// TODO Auto-generated method stub
		List<Map<String,String>> list =userResDao.getAuthMenu(userNo) ;
		return list;
	}

	@Override
	public List findRoots(List list){
		List result = new ArrayList();
		List menuList = new ArrayList();
		StringBuffer sb = new StringBuffer("{");
		for(Object obj:list){
			Map map = (Map) obj;
			if("0".equals(map.get("RES_PARENT_ID"))){
				result.add(map);
				sb.append("\""+map.get("RES_ID")+"\":[");
				for(Object obj1:list){
					Map map1 = (Map) obj1;
					if((map.get("RES_ID")).equals(map1.get("RES_PARENT_ID"))){
						sb.append("{\"menuid\":\""+map1.get("RES_ID")+"\",\"menuname\":\""+map1.get("RES_NAME")+"\",\"menus\":[");
						for(Object obj2:list){
							Map map2 = (Map) obj2;
							if((map1.get("RES_ID")).equals(map2.get("RES_PARENT_ID"))){
								sb.append("{\"menuid\":\""+map2.get("RES_ID")+"\",\"menuname\":\""+map2.get("RES_NAME")+"\",\"url\":\""+map2.get("RES_URL")+"\"},");
							}
						}
						if(sb.toString().endsWith(",")){
							sb.deleteCharAt(sb.toString().length()-1);
						}
						sb.append("]},");
					}
				}
				if(sb.toString().endsWith(",")){
					sb.deleteCharAt(sb.toString().length()-1);
				}
				sb.append("],");
			}
		}
		if(sb.toString().endsWith(",")){
			sb.deleteCharAt(sb.toString().length()-1);
		}
		sb.append("}");
		Map _map = new HashMap();
		_map.put("firstlevelmenu", result);
		_map.put("menu", sb.toString());
		menuList.add(_map);
		return menuList;
	}
}
