package com.xingtu.strategy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Glshoucang;
import com.xingtu.entity.Strategy;
import com.xingtu.entity.Users;
import com.xingtu.strategy.dao.StrategyDao;

@Service
@Transactional(readOnly=false)
public class StrategyService {
	@Resource
	private StrategyDao sd;
	public Strategy createStrategy(String []tags,String []titles,String []texts,String []addresses,String title,Users user,MultipartFile file,String path) {
		return sd.saveStrategy(tags,titles, texts, addresses, title, user,file,path);
	}
	public Strategy findSingleStrategy(int id) {
		return sd.findStrategyById(id);
	}
	public List<Strategy> findAllStrategy(int pageNum,int pageSize){
		return sd.findAllStrategy(pageNum,pageSize);
	}
	public List<Strategy> findNewStrategy(){
		return sd.findTheNewStrategy();
	}
	public List<Strategy> findHotStrategy(){
		return sd.findTheHotStrategy();
	}
	public List<Strategy> findByTag(int pageNum,int pageSize,String tag){
		return sd.findStrategyByTag(pageNum,pageSize,tag);
	}
	public List<Strategy> findIndexStrategy(){
		return sd.findTheIndexStrategy();
	}
	public List<Strategy> findByAddress(String address){
		return sd.findByAddress(address);
	}
	//判断是否已收藏
	public Boolean IfShouCanggl(int strategyid,Users user) {
		return sd.IfShouCanggl(strategyid, user);
	}
	//点击收藏，将收藏名单插入收藏表
	public Glshoucang InsertShoucanggl(int strategyid,Users user) {
		return sd.InsertShoucanggl(strategyid, user);
	}
	//将收藏者删除
	public void delectShoucanggl(int strategyid,Users user) {
		sd.delectShoucanggl(strategyid, user);
	}
	//获取我的收藏
	public List<Strategy> findShoucanggl(String myemail){
		return sd.findShoucanggl(myemail);
	}
}
