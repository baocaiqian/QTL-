package com.xingtu.user.dao;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Repository;

import com.sun.net.httpserver.HttpContext;
import com.xingtu.entity.Glshoucang;
import com.xingtu.entity.Journey;
import com.xingtu.entity.Md5Encode;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Strategy;
import com.xingtu.entity.Users;


@Repository
public class UserDao{
	
	@Resource
	private SessionFactory sessionFactory;
	
	//查询
	public Boolean getRegistPerson(Users users) throws Exception{
		String myemail=users.getEmail();
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Users where email=?0");
		q.setParameter(0, myemail);
		if(q.list().size()!=0) {
		    return false;//濡傛灉鏁版嵁搴撲腑瀛樺湪杩欎釜閭锛岃鏄庨渶瑕侀噸鏂拌緭鍏ユ垨娉ㄥ唽
		}
		else {
			session.save(users);
			return true;
		}		
	}
	
	//楠岃瘉鏄惁瀛樺湪瑕佺櫥褰曠殑閭,瀵嗙爜鏄惁姝ｇ‘
	public boolean getLoginPerson(Users users) throws Exception{
		String password1=Md5Encode.getMD5(users.getPassword().toString().getBytes());//鑾峰緱鍏跺瘑鐮佺殑MD5鐮�
		String myemail=users.getEmail();
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("select password from Users where email=?0");
		q.setParameter(0, myemail);
		if(q.list().size()!=0 && q.list().get(0).equals(password1)) {//璇存槑瀛樺湪杩欎釜閭锛屽苟涓斿瘑鐮佺浉绛�	
		    return true;
		}
		else {
			return false;
		}		
	}

	//根据邮箱查找用户信息
	public Users findUserByEmail(String email) {
		Session session = this.sessionFactory.getCurrentSession();
		Users u = (Users)session.createQuery("from Users where email='"+email+"'").uniqueResult();
		return u;
	}
	//查找我关注的人的数量guanzhuCount
	public Long findFGCount(String email) { //email是当前用户的邮箱
		Session session =this.sessionFactory.getCurrentSession();
		Long guanzhuCount=(Long)session.createQuery("select count(*) from Followed where useremail='"+email+"'").uniqueResult();
		return guanzhuCount;
	}
	//查找我的粉丝的数量fansCount
	public Long findfansCount(String email) {
		Session session=this.sessionFactory.getCurrentSession();
		Long fansCount=(Long)session.createQuery("select count(*) from Followed where follwed_user='"+email+"'").uniqueResult();
		return fansCount;
	}
	//查询攻略
	public List<Strategy> findStrategyByEmail(String email){
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from Strategy where user.email='"+email+"'");
		return q.list();
	}
	//查询行程
	public List<Journey> findJourneyByEmail(String email){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Journey where user.email='"+email+"'");
		return q.list();
	}
	//查询收藏的景点（心愿清单）
	public List<Sceneshoucang> findScScene(String email){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Sceneshoucang where user.email='"+email+"'");
		return q.list();
	}
	//查询收藏的攻略
	public List<Glshoucang> findglShoucang(String email){
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Glshoucang where user.email='"+email+"'");
		return q.list();
	}
}
