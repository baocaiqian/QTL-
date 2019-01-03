package com.xingtu.scene.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.xingtu.entity.Page;
import com.xingtu.entity.Scene;
import com.xingtu.entity.SceneImgs;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Users;
import com.xingtu.scene.service.SceneService;

@Controller
@RequestMapping("/sence")
public class SceneController {
	@Resource
	private SceneService ss;
	//进入景点详情页，并且判断是否已经收藏
	@RequestMapping(value="/singlesence",method=RequestMethod.GET)
	public String findSingleScene(HttpServletRequest request,@RequestParam("id") int id,HttpSession session) {
		Scene s = ss.findScene(id);
		List<SceneImgs> imgs = ss.findSceneimg(ss.findScene(id).getSname());
		System.out.println(imgs.size());
		// 将关注者（登录用户）放入
		Users u= (Users)session.getAttribute("user");
		if (u == null) {
			request.setAttribute("ifShoucang", false);
		} else {

			// 判断曾经是否已插入，若无，则插入，若有则返回已关注
			Boolean b = this.ss.IfShouCang(id,u);
			if (b) {// 已关注
				request.setAttribute("ifShoucang", true); // 如果已关注，存入true,使页面显示已关注
				System.out.println(request.getAttribute("ifShoucang"));
			} else {// 未关注
				request.setAttribute("ifShoucang", false);
				System.out.println("未关注");
			}

		}
		request.setAttribute("singlescene", s);
		request.setAttribute("imglist", imgs);
		return "Detilstest";
	}
	@RequestMapping(value="/allsence",method=RequestMethod.GET)
	public String findScenes(HttpServletRequest request,@RequestParam(value="pageNum",defaultValue="1")int pageNum) {
		Page<Scene> p = new Page<Scene>();
		p.setCurrentPageNum(pageNum);
		p.setPageSize(8);
		p.setNextPageNum(pageNum+1);
		p.setPrePageNum(pageNum-1);
		System.out.println(pageNum);
		List<Scene> scenes = ss.findAllScene(p.getCurrentPageNum(),p.getPageSize());
		p.setList(scenes);
		List<Scene> hotscene = ss.getHotScene();
		request.setAttribute("hotscene", hotscene);
		request.setAttribute("page", p);
		return "meijing";
	}
	//点击后收藏，变为收藏状态
	@RequestMapping(value="/addshoucang",method=RequestMethod.GET)
	public String addshoucang(HttpServletRequest request,@RequestParam(value="sceneid")int sceneid,HttpSession session) {
		Users u= (Users)session.getAttribute("user");
		Sceneshoucang ssc2=ss.InsertShoucang(sceneid, u);
		request.setAttribute("ifShoucang", true);//显示已关注
		
		Scene s = ss.findScene((int)sceneid);
		List<SceneImgs> imgs = ss.findSceneimg(ss.findScene(sceneid).getSname());
		System.out.println(imgs.size());
		request.setAttribute("singlescene", s);
		request.setAttribute("imglist", imgs);
		return "Detilstest";
	}
	//取消收藏，为未收藏状态
	@RequestMapping(value="/noshoucang",method=RequestMethod.GET)
	public String deleshoucang(HttpServletRequest request,@RequestParam(value="sceneid")int sceneid ,HttpSession session) {
		Sceneshoucang ssc2=new Sceneshoucang();
		Users u= (Users)session.getAttribute("user");
		ssc2.setUser(u);
		this.ss.delectShoucang(sceneid,u);
		request.setAttribute("ifShoucang", false);
		Scene s = ss.findScene((int)sceneid);
		List<SceneImgs> imgs = ss.findSceneimg(ss.findScene(sceneid).getSname());
		System.out.println(imgs.size());
		request.setAttribute("singlescene", s);
		request.setAttribute("imglist", imgs);
		return "Detilstest";
	}
	@RequestMapping(value="/findbyname",method=RequestMethod.POST)
	public String findbyname(@RequestParam(value="name")String name,@RequestParam(value="pageNum",defaultValue="1")int pageNum,HttpServletRequest request) {
		Page<Scene> p = new Page<Scene>();
		p.setCurrentPageNum(pageNum);
		p.setPageSize(8);
		p.setNextPageNum(pageNum+1);
		p.setPrePageNum(pageNum-1);
		System.out.println(pageNum);
		List<Scene> scenes = ss.findByName(name);
		p.setList(scenes);
		List<Scene> hotscene = ss.getHotScene();
		request.setAttribute("hotscene", hotscene);
		request.setAttribute("page", p);
		return "meijing";
	}
}
