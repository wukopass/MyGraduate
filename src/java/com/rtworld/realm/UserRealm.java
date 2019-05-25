package com.rtworld.realm;
import com.rtworld.pojo.Authority;
import com.rtworld.pojo.MemberUser;
import com.rtworld.service.ISysService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
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
		SimpleAuthorizationInfo zation = new SimpleAuthorizationInfo();
		String username = (String)principals.getPrimaryPrincipal();
		MemberUser user = sysService.queryUserByUserName(username);
		List<Authority> permissions = sysService.findPermissionsByUserId(user.getUserid());
		for (Authority permission : permissions) {
			zation.addStringPermission(permission.getAuthorityname());
		}
		return zation;
	}
	// 登录校验
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal();
		MemberUser user = sysService.queryUserByUserName(username);
		if(user == null){
			//账号找不到异常
		  throw  new UnknownAccountException();
		}
		//判断账号是不是已经被锁定了
		if (Boolean.TRUE.equals(user.getLocked())) {
			// 抛出 帐号锁定异常
			throw new LockedAccountException();
		}
		return new SimpleAuthenticationInfo(
				user.getUsername(),
				user.getPassword(),
				ByteSource.Util.bytes(user.getUsername()+user.getSalt())   // salt=username+salt
				, getName());
	}


}
