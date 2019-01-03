package com.xingtu.guanzhu.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xingtu.entity.Followed;
import com.xingtu.entity.UserAndCount;
import com.xingtu.entity.Users;
import com.xingtu.guanzhu.service.GuanzhuService;
import com.xingtu.user.service.UserService;


@Controller
public class GuanzhuController {
    
	@Resource
	private GuanzhuService guanzhuService;
	@Resource
	private UserService userService;
	
	
	//点击关注
	@RequestMapping(value="/guanzhuController")
	public String guanzhuperson(@RequestParam("bepersonemail") String bepersonemail,HttpServletRequest request) {
		Followed followed2=new Followed();	
		//将被关注者的email放入
		followed2.setFollwed_user(bepersonemail);		
		//将关注者（登录用户）放入
		Users user= (Users) request.getSession().getAttribute("user");
		String myemail=user.getEmail();
		followed2.setUseremail(myemail);
		//跳过来时在UserController已经判断过是否关注，既然显示未关注，则肯定是没有关注
		//此时未关注
		this.guanzhuService.InsertGuanzhu1(followed2);//关注
		request.setAttribute("ifGuanzhu", true);//显示已关注
		
		//获得对方关注的人的人数
		Long FGCount=this.userService.findFGCount1(bepersonemail);
		request.setAttribute("FGCount", FGCount);	
		//获取粉丝的人数
		Long fansCount = this.userService.findfansCount1(bepersonemail);
		request.setAttribute("fansCount",fansCount);
		//得到将关注的这个人的内容
		Users u = this.userService.UserCenter(bepersonemail);
		request.setAttribute("CenterOwn", u);
		return "otherseeUser";
	}
	
	
	
	//点击已关注，变为未关注状态
	@RequestMapping(value="/tonoGuanzhu")
	public String tonoGuanzhu(@RequestParam("bepersonemail") String bepersonemail,HttpServletRequest request) {
		//已经判断出了已关注
		Followed followed2=new Followed();
		System.out.println(bepersonemail);
		//将被关注者的email放入
		followed2.setFollwed_user(bepersonemail);		
		//将关注者（登录用户）放入
		Users user=(Users)request.getSession().getAttribute("user");
		String myemail=user.getEmail();
		followed2.setUseremail(myemail);
		//此时已关注，要取消关注，将数据删除
		this.guanzhuService.delectFollow1(followed2);
		//将链接设为未关注
		request.setAttribute("ifGuanzhu", false);//显示未关注
		
		//获得对方关注的人的人数
				Long FGCount=this.userService.findFGCount1(bepersonemail);
				request.setAttribute("FGCount", FGCount);	
				//获取粉丝的人数
				Long fansCount = this.userService.findfansCount1(bepersonemail);
				request.setAttribute("fansCount",fansCount);
		
		
		
		
		//得到将关注的这个人的内容，并输出到页面
		Users u = this.userService.UserCenter(bepersonemail);
		request.setAttribute("CenterOwn", u);
		return "otherseeUser";
	}
	
	
	
	
	
	//获得关注人都有谁的函数
	@RequestMapping(value="/guanzhuUser")
	public String guanzhuUser(HttpServletRequest request) {
	
		Users user= (Users) request.getSession().getAttribute("user");
		String myemail=user.getEmail();		
		List<UserAndCount> felloPerson=this.guanzhuService.findFollows1(myemail);		
		request.setAttribute("felloPerson", felloPerson);		
		return "fellow";
	}
	
	//获得粉丝都有谁的函数
	@RequestMapping(value="/fansUser")
	public String fansUser(HttpServletRequest request) {
		//获取目前登录用户的邮箱
		Users user=(Users) request.getSession().getAttribute("user");
		String myemail=user.getEmail();
		List<UserAndCount> fansPerson=this.guanzhuService.findFans1(myemail);
		request.setAttribute("fansPerson", fansPerson);
		return "fans";
	}
	
	
}
