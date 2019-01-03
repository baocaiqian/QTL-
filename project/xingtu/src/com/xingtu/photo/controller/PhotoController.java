package com.xingtu.photo.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Page;
import com.xingtu.entity.Photo;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Users;
import com.xingtu.photo.service.PhotoService;
import com.xingtu.user.service.UserService;

@Controller
@RequestMapping("/photo")
public class PhotoController {
	@Resource
	private PhotoService ps;
	@Resource
	private UserService userService;
	@RequestMapping(value="/up",method=RequestMethod.POST)
	public String upPhoto(@RequestParam(value="files")MultipartFile []files,HttpServletRequest request,HttpSession session,@RequestParam(value="pageNum",defaultValue="1")int pageNum,@RequestParam(value="searchpeople",defaultValue="null")String searchpeople,@RequestParam(value="searchaddress",defaultValue="null")String searchaddress,@RequestParam(value="searchdate",defaultValue="null")String searchdate) {
		String path= session.getServletContext().getRealPath("/");
		Users u = (Users)session.getAttribute("user");
		ps.upPhoto(files, path, u); 
		Page<Photo> p = new Page<Photo>();
		p.setCurrentPageNum(pageNum);
		p.setPageSize(14);
		p.setNextPageNum(pageNum+1);
		p.setPrePageNum(pageNum-1);
		List<Photo> photos = ps.findphoto(u,p.getCurrentPageNum(),p.getPageSize(),searchaddress,searchpeople,searchdate);
		p.setList(photos);
		request.setAttribute("photos", p);
		return "photo";
	}
	@RequestMapping(value="/findallphoto",method=RequestMethod.GET)
	public String openPhoto(HttpServletRequest request,HttpSession session,@RequestParam(value="people",defaultValue="null")String people,@RequestParam(value="phototime",defaultValue="null")String phototime,@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="searchpeople",defaultValue="null")String searchpeople,@RequestParam(value="searchaddress",defaultValue="null")String searchaddress,@RequestParam(value="searchdate",defaultValue="null")String searchdate) {
		Page<Photo> p = new Page<Photo>();
		p.setCurrentPageNum(pageNum);
		p.setPageSize(14);
		p.setNextPageNum(pageNum+1);
		p.setPrePageNum(pageNum-1);
		Users u = (Users)session.getAttribute("user");
		List<Photo> photos = ps.findphoto(u,p.getCurrentPageNum(),p.getPageSize(),searchaddress,searchpeople,searchdate);
		p.setList(photos);
		request.setAttribute("photos", p);
		//return "photo";
		
		//获得粉丝数和关注者数
		Users user=(Users) request.getSession().getAttribute("user");
		String myemail=user.getEmail();
		//获得对方关注的人的人数
		Long FGCount=this.userService.findFGCount1(myemail);
		request.setAttribute("FGCount", FGCount);	
		//获取粉丝的人数
		Long fansCount = this.userService.findfansCount1(myemail);
		request.setAttribute("fansCount",fansCount);
		

		return "photo";
	}

	@RequestMapping(value="/photoinfo",method=RequestMethod.POST)
	public String updatePhoto(HttpSession session,HttpServletRequest request,@RequestParam(value="address",defaultValue="null")String address,@RequestParam(value="people",defaultValue="null")String people,@RequestParam(value="phototime",defaultValue="null")String phototime,@RequestParam(value="photoid")String id,@RequestParam(value="pageNum",defaultValue="1")int pageNum,@RequestParam(value="searchpeople",defaultValue="null")String searchpeople,@RequestParam(value="searchaddress",defaultValue="null")String searchaddress,@RequestParam(value="searchdate",defaultValue="null")String searchdate) {
		Page<Photo> p = new Page<Photo>();
		p.setCurrentPageNum(pageNum);
		p.setPageSize(14);
		p.setNextPageNum(pageNum+1);
		p.setPrePageNum(pageNum-1);
		Users u = (Users)session.getAttribute("user");
		List<Photo> photos = ps.findphoto(u,p.getCurrentPageNum(),p.getPageSize(),searchaddress,searchpeople,searchdate);
		p.setList(photos);
		request.setAttribute("photos", p);
		ps.updatePhoto(people, address, id, phototime);
		return "photo";
	}
	

	
	
}