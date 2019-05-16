package com.rtworld.realm;
import com.rtworld.pojo.MemberUser;
import com.rtworld.service.sys.ISysService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;

public class UserRealm extends AuthorizingRealm {
/*	@Autowired
	private IUserService userService;*/
    @Autowired
	private ISysService sysService;

	/**
	 * 默认情况下，缓存会随用户session退出而清除，
	 * 可以重写该清除方法，完成清除策略
	 */
/*	protected void doClearCache(PrincipalCollection principals) {
		System.out.println("我不清..");
	}*/

	// 授权，角色和权限
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Integer id = (Integer) principals.getPrimaryPrincipal();
		Set<String> roles = sysService.findRolesByUserId(id);
		Set<String> permissions = sysService.findPermissionsByUserId(id);
		SimpleAuthorizationInfo zation = new SimpleAuthorizationInfo();
		zation.setRoles(roles);
		zation.setStringPermissions(permissions);
		return zation;
	}

	// 登录校验
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String tel = (String) token.getPrincipal();
		MemberUser user = sysService.queryUserByTel(tel);
		if(user.getIsLogin() == '1') throw new LockedAccountException();
		return new SimpleAuthenticationInfo(user.getUserid(),
				user.getPassword(),
				ByteSource.Util.bytes(user.getSalt()), getName());
		/*return null;*/
	}


}
