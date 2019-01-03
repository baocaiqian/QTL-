package com.xingtu.index.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xingtu.entity.Nav;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Strategy;
import com.xingtu.nav.service.NavService;
import com.xingtu.scene.service.SceneService;
import com.xingtu.strategy.service.StrategyService;

@Controller
@RequestMapping("/index")
public class IndexController {
	@Resource
	private SceneService ss;
	@Resource
	private StrategyService strategyservice;
	@RequestMapping(value="/scelist",method=RequestMethod.GET)
	public String index(HttpServletRequest request) {
		/*获取热门八景点*/
		List<Scene> list1=ss.getSceList();
		List<Strategy> list2 = strategyservice.findIndexStrategy();
		request.setAttribute("scelist", list1);
		request.setAttribute("indexStrategy", list2);
		return "index";
	}
}
