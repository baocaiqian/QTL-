/*package com.xingtu.index.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.xingtu.entity.Scene;



*//**
 *  获取前8的热门景点
* @return
*//*
@Repository
public class IndexDao {
	@Resource
	private SessionFactory sessionFactory;
	public List<Scene> getscelist(){
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Scene s limit 0,8");
		return q.list();
	}

}*/
