package com.xingtu.user.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xingtu.entity.Glshoucang;
import com.xingtu.entity.Journey;
import com.xingtu.entity.Md5Encode;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Strategy;
import com.xingtu.entity.Users;
import com.xingtu.user.dao.UserDao;

@Service
@Transactional(readOnly=false)  //一定要设置事务提交方式
public class UserService {

	@Resource
	private UserDao userDao;
	//关于注册
	//在这里面加注册时间，加密码验证,判断各部分信息是否符合格式要求
	@Transactional(readOnly=false)
	public String getRegistPerson1(Users users) {
		try {	
			//获取默认头像
			users.setIcon("img/icon11.png");
			//获取注册时间
			users.setRegisttime(new Date());
			//将密码加密
			String passMD5=Md5Encode.getMD5(users.getPassword().toString().getBytes());
			users.setPassword(passMD5);
			//判断邮箱是否存在于数据库中
			Boolean b1= this.userDao.getRegistPerson(users);
			if(b1==true) {
				 return "true";
			}
			else {
				String emerror="该邮箱已存在，可直接登录";
				return emerror;
			}	   
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "false";
		}
	
	}
	
	
	//关于登录
	@Transactional(readOnly=true)
	public Boolean getLoginPerson1(Users users) {
		try {
			return this.userDao.getLoginPerson(users);		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	//根据邮箱查找用户信息。进入个人中心页
	public Users UserCenter(String email) {
		return this.userDao.findUserByEmail(email);
	}
	//查找我关注的人数量
	public Long findFGCount1(String email) {
		return this.userDao.findFGCount(email);
	}
	//查找我的粉丝的数量
	public Long findfansCount1(String email) {
		return this.userDao.findfansCount(email);
	}
	@Transactional(readOnly=false)
	//查询攻略 
	public List<Strategy> findStrategyByEmail(String email){
		return this.userDao.findStrategyByEmail(email);
	}
	//查询行程
	public List<Journey> findJourneyByEmail(String email){
		return this.userDao.findJourneyByEmail(email);
	}
	//查询心愿清单
	public List<Sceneshoucang> findScScene(String email){
		return this.userDao.findScScene(email);
	}
	//查询收藏的攻略
	public List<Glshoucang> findglShoucang(String email){
		return this.userDao.findglShoucang(email);
	}
}
