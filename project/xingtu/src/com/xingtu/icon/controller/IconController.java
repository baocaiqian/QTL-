package com.xingtu.icon.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Glshoucang;
import com.xingtu.entity.Journey;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Strategy;
import com.xingtu.entity.Users;
import com.xingtu.guanzhu.service.GuanzhuService;
import com.xingtu.icon.service.iconServiceImpl;
import com.xingtu.user.service.UserService;

@Controller
public class IconController {
	
	@Resource
	private iconServiceImpl iconserviceImpl;
	@Resource
	private UserService userService;
	@Resource
	private GuanzhuService guanzhuService;
	@RequestMapping(value="/iconController")
	public String updateIcon(@RequestParam(value="file")MultipartFile file,HttpServletRequest request,HttpSession session) {
		String path=session.getServletContext().getRealPath("/");//得到Tomcat容器的根路径
		Users u = (Users)session.getAttribute("user");
		Users user=iconserviceImpl.changIcon1(file, path, u);  //将以上三个内容传入	
		session.setAttribute("user", user);	
		String myemail=user.getEmail();
		//获取我关注的人数并存入Session
		Long FGCount=this.userService.findFGCount1(myemail);
		session.setAttribute("FGCount", FGCount);
		//获取我粉丝的人数
		Long fansCount = this.userService.findfansCount1(myemail);
		session.setAttribute("fansCount",fansCount);		
		//获取攻略
		List<Strategy> strategys = this.userService.findStrategyByEmail(myemail);
		request.setAttribute("strategys", strategys);
		//获取行程
		List<Journey> journeys=this.userService.findJourneyByEmail(myemail);
		request.setAttribute("journeys", journeys);
		//获取心愿清单（收藏景点）
		List<Sceneshoucang> scenes=this.userService.findScScene(myemail);
		request.setAttribute("scenes", scenes);
		List<Glshoucang> glshoucangs=this.userService.findglShoucang(myemail);
		request.setAttribute("glshous", glshoucangs);
		return "user";
	}
	

}
