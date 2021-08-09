package cn.items.ssm.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.items.ssm.po.ActiveUser;



@Controller
public class FirstAction {
	//系统首页
	@RequestMapping("/first.action")
	public String first(Model model)throws Exception{
		// 没有办法直接获取到 身份信息
		
		// 可以取出 subject 主体信息
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
		
		// 将activeUser 存在model 域中
		model.addAttribute("activeUser",activeUser);
		return "first";
	}
	
	//欢迎页面
	@RequestMapping("/welcome")
	public String welcome(Model model)throws Exception{
		
		return "welcome";
		
	}
}	
