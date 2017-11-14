package com.creidtsys.security.realm;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.creidtsys.apps.auth.entity.SysUser;
import com.creidtsys.apps.auth.entity.SysUserRes;
import com.creidtsys.apps.auth.service.SysUserResService;
import com.creidtsys.apps.auth.service.SysUserService;
/**
 * 
* @ClassName: ShiroDbRealm
* @Description: TODO 自定义shiro  AuthorizingRealm
* @author liuyj
* @date 2017年9月8日 上午10:43:33
*
 */
public class ShiroDbRealm extends AuthorizingRealm {
  
 
	@Autowired
	private SysUserService sysUserService ;
	@Autowired
	private SysUserResService sysUserResService ;
	public ShiroDbRealm() {
		super();
	}

	/**
	 * 验证登陆
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		SysUser sysUser = sysUserService.getUserByLoginName(token.getUsername()) ;
		//根据登录名获取用户信息
		if (sysUser != null) {
			return new SimpleAuthenticationInfo(sysUser.getUserNo(), sysUser.getUserPwd(), getName());
		} else {
			throw new AuthenticationException();
		}
	}

	/**
	 * 登陆成功之后，进行角色和权限验证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		String userNo = (String) getAvailablePrincipal(principals);
		// 列举此用户所有的权限
		//List<Permission> permissions = userService.findUserPermissionByName(username);
		List<SysUserRes> listRes = sysUserResService.getPermissionByNo(userNo) ;
		Set<String> strs=new HashSet<String>();
		Iterator<SysUserRes> it = listRes.iterator();
		while (it.hasNext()) {
			SysUserRes re=it.next();
			strs.add(re.getResUrl());
		}
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.addStringPermissions(strs);
		return authorizationInfo;
	}

	/**
	 * 清除所有用户授权信息缓存.
	 */
	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 清除所有用户授权信息缓存.
	 */
	public void clearAllCachedAuthorizationInfo() {
		Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
		if (cache != null) {
			for (Object key : cache.keys()) {
				cache.remove(key);
			}
		}
	}
	/**
	 * 
	* @Title: clearAuthz 
	* @Description: TODO 清楚缓存的授权信息  
	* @return void    返回类型
	 */
	public void clearAuthz(){
		this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
	}
}
