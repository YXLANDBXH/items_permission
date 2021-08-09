package cn.items.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.items.ssm.exception.CustomException;
import cn.items.ssm.po.ActiveUser;
import cn.items.ssm.service.SysService;


@Controller
public class LoginController {
	
	@Autowired
	private SysService sysService;
	//用户登陆提交方法
	/**
	 * <p>Title: login</p>
	 * <p>Description: </p>
	 * @param session
	 * @param randomcode 输入的验证码
	 * @param usercode 用户账号
	 * @param password 用户密码 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login.action")
	public String login(HttpServletRequest request)throws Exception{
		// shiroLoginFailure   存储的有 账号不存在异常 信息    密码错误异常信息
		String errorMsg = (String) request.getAttribute("shiroLoginFailure");
		
		// 挨个判断  当前到底是 账号不存在异常   还是 密码错误异常
		if (errorMsg!=null) {
			// 登录了   
			//UnknownAccountException
	        if (UnknownAccountException.class.getName().equals(errorMsg)) {
				//throw new Exception("");
	        	throw new CustomException("账号不存在异常,么么哒");
			}else if (IncorrectCredentialsException.class.getName().equals(errorMsg)) {
				throw new CustomException("密码不正确异常，么么哒~~");
			}else{
	        	throw new CustomException("未知异常...");
	        }
		}
		return "login";

	}
	
	//用户退出
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception{
		//session失效
		session.invalidate();
		//重定向到商品查询页面
		return "redirect:/first.action";
	}
}
