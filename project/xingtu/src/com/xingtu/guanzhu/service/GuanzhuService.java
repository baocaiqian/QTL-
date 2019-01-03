package com.xingtu.guanzhu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xingtu.entity.Followed;
import com.xingtu.entity.UserAndCount;
import com.xingtu.entity.Users;
import com.xingtu.guanzhu.dao.GuanzhuDao;

@Service
@Transactional(readOnly=false)
public class GuanzhuService {
	
	@Resource
    private GuanzhuDao guanzhuDao;
	//判断是否已关注
	public Boolean IfGuanZhu1(Followed follow) {
		return this.guanzhuDao.IfGuanZhu(follow);
	}
	
	
	
	//将粉丝与被关注者插入关注表中
	public void InsertGuanzhu1(Followed follow) {
		this.guanzhuDao.InsertGuanzhu(follow);	
	}
	
	
	//删除关注表中的项
	@Transactional(readOnly=false)
	public void delectFollow1(Followed follow) {
		this.guanzhuDao.delectFollow(follow);
	}
	
	
	//获得我的关注用户
	public List<UserAndCount> findFollows1(String myemail) {
		return this.guanzhuDao.findFollows(myemail);
	}
    
	//获得我的粉丝用户集
	public List<UserAndCount> findFans1(String myemail){
		return this.guanzhuDao.findFans(myemail);
	}	
	
}
