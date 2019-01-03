package com.xingtu.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xingtu.entity.Followed;
import com.xingtu.entity.Glshoucang;
import com.xingtu.entity.Journey;
import com.xingtu.entity.Md5Encode;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Strategy;
import com.xingtu.entity.Users;
import com.xingtu.guanzhu.service.GuanzhuService;
import com.xingtu.scene.service.SceneService;
import com.xingtu.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private SceneService ss;
	@Resource
	private UserService userService;
	@Resource
	private GuanzhuService guanzhuService;
	
	
	private Boolean issigned=false;
	//注册控制器
	@RequestMapping(value="/registController",method=RequestMethod.POST)
	public String getRegistPerson(Users users,HttpSession session,HttpServletRequest request,@RequestParam("chkpwd") String chkpwd) { //参数要想使用user，必须保证表单属性name与数据库属性相同
		String mymes=this.userService.getRegistPerson1(users);//b用来判断是否能够成功注册，b是字符串
		chkpwd=Md5Encode.getMD5(chkpwd.toString().getBytes());//获得其MD5码
		if(users.getPassword().equals(chkpwd) && !mymes.equals("该邮箱已存在，可直接登录")) {
			issigned=true;
			session.setAttribute("isSigned",issigned);//定义一个是否已登录的接口
			session.setAttribute("user", users);
			List<Scene> list1=ss.getSceList();
			request.setAttribute("scelist", list1);
			return "index";
		}else {
			request.setAttribute("errormessage",mymes);
			issigned=false;
			request.getSession().setAttribute("isSigned",issigned);//定义一个是否登录的接口
			return 	"sign";
		}
		
	}
	//登录控制器
	@RequestMapping(value="/loginController",method=RequestMethod.POST)
	public String getLoginPerson(Users users,HttpSession session,HttpServletRequest request) {
		if(this.userService.getLoginPerson1(users)==true) {
			issigned=true;
			Users user = this.userService.UserCenter(users.getEmail());
			session.setAttribute("isSigned",issigned);//定义一个是否已登录的接口
			session.setAttribute("user", user);
			List<Scene> list1=ss.getSceList();
			request.setAttribute("scelist", list1);
			return "index";
		}
		else {
			issigned=false;
			request.getSession().setAttribute("isSigned",issigned);//定义一个是否登录的接口
			request.setAttribute("errormessage", "该邮箱未注册或密码错误，请重新输入");
			return "sign";
		}
	}
	
	//跳转到个人中心页
	@RequestMapping(value="/usercenter",method=RequestMethod.GET)
	public String userCenter(HttpSession session,HttpServletRequest request) {
		Object obj = session.getAttribute("user");
		if(obj!=null) {
			Users user =(Users)obj;
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
		return "";
		}
	//进入别人的个人中心页
	@RequestMapping(value="/otherUserCenter",method=RequestMethod.GET)
	public String otherUserCenter(HttpServletRequest request,@RequestParam(value="useremail")String useremali) {//获得otherseeUser的用户
		Users u = this.userService.UserCenter(useremali); //得到这个用户的全部信息
		Long FGCount=this.userService.findFGCount1(useremali);//得到这个用户可能要关注的人
		//获得对方关注的人数
		request.setAttribute("FGCount", FGCount);
		//获取对方粉丝的人数
		Long fansCount = this.userService.findfansCount1(useremali);
		request.setAttribute("fansCount",fansCount);
		request.setAttribute("CenterOwn", u);
		
		
		//判断我是否已经关注过他
		Followed followed1=new Followed();
		//将可能被关注的人放入
		followed1.setFollwed_user(useremali);		
		//将关注者（登录用户）放入
		Object obj = request.getSession().getAttribute("user");
		if(obj==null) {
			request.setAttribute("ifGuanzhu",false);
		}else {
			Users user=(Users)obj;
			String myemail=user.getEmail();
			followed1.setUseremail(myemail);
					
		//判断曾经是否已插入，若无，则插入，若有则返回已关注
			Boolean b=this.guanzhuService.IfGuanZhu1(followed1);
			if(b) {//已关注
			    request.setAttribute("ifGuanzhu", true); //如果已关注，存入true,使页面显示已关注
				System.out.println(request.getAttribute("ifGuanzhu"));
			}
			else {//未关注
				request.setAttribute("ifGuanzhu",false);
				System.out.println("未关注");
			}
					
		}

		return "otherseeUser";
	}
}