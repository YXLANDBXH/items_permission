package cn.items.ssm.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAccount;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import cn.items.ssm.po.ActiveUser;
import cn.items.ssm.po.SysPermission;
import cn.items.ssm.po.SysUser;
import cn.items.ssm.service.SysService;

public class CustomerRealm extends AuthorizingRealm{

	@Autowired
	private SysService  sysService;
	
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// Principal -》 身份  账号 
		String username = token.getPrincipal().toString();
		SysUser sysUser = null;
		 List<SysPermission> menuList =null;
		// 从数据库查询
		try {
			// 根据userCode 去查询出当前用户的信息
			 sysUser = this.sysService.findSysUserByUserCode(username);
			 // 根据用户的id 去查询出菜单列表
			menuList= this.sysService.findMenuListByUserId(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 表示没有查询到这个用户
		if (sysUser==null) {
			return null;
		}
		
		// 封装 ActiveUser
		ActiveUser activeUser = new ActiveUser();
		// 封装 用户信息
		activeUser.setUserid(sysUser.getId());
		activeUser.setUsercode(sysUser.getUsercode());

		// 封装菜单信息
		activeUser.setMenus(menuList);

//		String username_db = "zhangsan";
//		String password_db = "1111";

		SimpleAuthenticationInfo authenticationInfo = 	
				//new SimpleAuthenticationInfo(username, sysUser.getPassword(), "自定义realm");
				new SimpleAuthenticationInfo(activeUser, sysUser.getPassword(), 
						ByteSource.Util.bytes(sysUser.getSalt()), "自定义realm");
		return authenticationInfo;
	}
	

	// 注意点： 授权的前提是必须先认证通过！
	// 授权 
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection Principal) {
		// 你要从数据库去查询出当前这个用户存在哪些权限  
		// 先取出  身份 Principal  -> activeUser
		ActiveUser activeUser = (ActiveUser) Principal.getPrimaryPrincipal();
		List<SysPermission> persmissonList =null;
		try {
			persmissonList = this.sysService.findPermissionListByUserId(activeUser.getUserid());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		// List<SysPermission> - > List<String>
		List<String> list = new ArrayList<String>();
		for (SysPermission sysPermission : persmissonList) {
			list.add(sysPermission.getPercode());
		}
		authorizationInfo.addStringPermissions(list);
		return authorizationInfo;
	}
}
