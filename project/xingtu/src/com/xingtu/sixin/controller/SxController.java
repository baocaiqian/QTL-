package com.xingtu.sixin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xingtu.entity.Sx;
import com.xingtu.entity.SxAndCount;
import com.xingtu.entity.Users;
import com.xingtu.sixin.service.SxService;
import com.xingtu.user.service.UserService;

@Controller
public class SxController {
	@Resource
	private UserService userService;
	
	@Resource
	private SxService sxService;
	
	//插入私信的具体信息（表单提交获取内容）
	 @RequestMapping(value="/sxController",method=RequestMethod.POST)
	public String InsertLTContent2(Sx sx,HttpServletRequest request,@RequestParam("otheremail") String otheremail) {
		 
		 //获取登录者的邮箱	
		Object obj=request.getSession().getAttribute("user");//此时obj一定非空，所以不用判断
		Users myuser = (Users)obj;
		String myemail=myuser.getEmail();
		
		sx.setFromUserEm(myemail);
		sx.setToUserEm(otheremail);	
		//再将otheremail存入request中
		 //根据对方的邮箱获得对方的信息
	     Users otheruser=this.userService.UserCenter(otheremail);
	     request.setAttribute("otherpeople",otheruser);		
		//将所接收到的消息存入数据库，并输出
		List<Sx> list=this.sxService.InsertLTContent1(sx);
		request.setAttribute("list", list);
		return "sixindetail";	
	}
	 
	 
	 
	 
	 //获取私信人与被私信人(从其他页面跳到本页面)
	 @RequestMapping(value="/sxPerson",method=RequestMethod.GET)
	 public String getSixinPerson(@RequestParam("otheremail") String otheremail,HttpServletRequest request){//参数是对方的邮箱
         //获取登录者的邮箱
		 Object obj=request.getSession().getAttribute("user");//此时obj一定非空，所以不用判断
		 Users myuser = (Users)obj;
		 String myemail=myuser.getEmail();
		 
		 //获得登录者的关注人数和粉丝人数
		//获得粉丝数和关注者数
		 Long FGCount=this.userService.findFGCount1(myemail);
		 request.setAttribute("FGCount", FGCount);	
		//获取粉丝的人数
		Long fansCount = this.userService.findfansCount1(myemail);
		request.setAttribute("fansCount",fansCount);
		 
         //根据对方的邮箱获得对方的信息
	     Users otheruser=this.userService.UserCenter(otheremail);
	     request.setAttribute("otherpeople",otheruser);     
	     //根据两者的邮箱查出两者之间的聊天记录
	     List<Sx> list=this.sxService.getAllContent1(myemail, otheremail);
	     request.setAttribute("list",list);
	     
		 return "sixindetail";  //redirect:sixindetail.jsp
	 }
	 
	 
	 
	 //从导航栏点击信息跳入sixin页面
	 @RequestMapping(value="/sixinPage",method=RequestMethod.GET)
	 public String getsixinPage(HttpServletRequest request) {
		 //获取登录账户的邮箱
		 Object obj=request.getSession().getAttribute("user");
		 Users myuser=(Users) obj;
		 String myemail=myuser.getEmail();
		 //得到每个人及其最后一条信息
		 List<SxAndCount> finallXinxi=this.sxService.getSiXinPageContent1(myemail);
		 int allConversionNum=finallXinxi.size();
		 request.setAttribute("allConversionNum", allConversionNum);
		 request.setAttribute("finallXinxi",finallXinxi);
		//获得粉丝数和关注者数
		 Long FGCount=this.userService.findFGCount1(myemail);
		 request.setAttribute("FGCount", FGCount);	
		//获取粉丝的人数
		Long fansCount = this.userService.findfansCount1(myemail);
		request.setAttribute("fansCount",fansCount);
		 
		 
		return "sixin";
	 }
	 
	
	 
	 

}
