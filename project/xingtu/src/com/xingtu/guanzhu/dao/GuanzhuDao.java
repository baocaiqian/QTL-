package com.xingtu.guanzhu.dao;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import com.xingtu.entity.Followed;
import com.xingtu.entity.UserAndCount;
import com.xingtu.entity.Users;

@Repository
public class GuanzhuDao {
    
	@Resource
	private SessionFactory sessionFactory;
	
	//判断是否已关注
	public Boolean IfGuanZhu(Followed follow) {//如果已关注返回true，未关注返回false
		Session session =this.sessionFactory.getCurrentSession();		
		String myemail=follow.getUseremail();//登录用户的email
		String beemail=follow.getFollwed_user();//将要关注用户的email
		Query q=session.createQuery("from Followed where useremail=?0 and follwed_user=?1");
		q.setParameter(0,myemail);
		q.setParameter(1, beemail);
		if(q.list().size()!=0) {//说明存在这样一条数据，已关注
			return true;
		}else {
			return false;
		}
	}
	
	//将关注者删除
	public int delectFollow(Followed follow1) {
		Session session = this.sessionFactory.getCurrentSession();
		String myemail=follow1.getUseremail();//登录用户的email
		String beemail=follow1.getFollwed_user();//将要关注的email
		Query q=session.createQuery("delete from Followed f where f.useremail='"+myemail+"' and f.follwed_user='"+beemail+"'");
		int x=q.executeUpdate();
		return x;//返回受影响的条数
	}
	
	
	
	//点击关注，将关注名单插入关注表
	public void InsertGuanzhu(Followed follow) { //这里是被关注人的邮箱
		Session session=this.sessionFactory.getCurrentSession();
		session.save(follow);		
	}
	
	//从关注表中取出本人关注者都有谁，有几个
	@SuppressWarnings("null")
	public List<UserAndCount> findFollows(String myemail) {
		
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Followed where useremail=?0");	
		q.setParameter(0,myemail);	
		List<Followed> fs = q.list();//关注人的集合
		
		//创建一个关注人用户信息的集合
		List<UserAndCount> usersList=new ArrayList<UserAndCount>();
		//根据上面获得的被关注人的email查找被关注人的信息
		for(Followed f : fs) {
			
			String email1=f.getFollwed_user();//获得被关注人的邮箱
			//根据邮箱获得每个用户的信息
			Users onlyfellowUser=(Users)session.createQuery("from Users where email='"+email1+"'").uniqueResult();
			//创建一个实体，里面再绑定根据邮箱查到的攻略条数，行程数，关注数，粉丝数
			UserAndCount uac=new UserAndCount();
			uac.setEmail(onlyfellowUser.getEmail());
			uac.setIcon(onlyfellowUser.getIcon());
			uac.setUsername(onlyfellowUser.getUsername());
		    
			Long strategyCount=(Long) session.createQuery("select count(*) from Strategy st where st.user.email='"+email1+"'").uniqueResult();
			uac.setStrategyCount(strategyCount);//攻略数	
			
			Long routeCount=(Long) session.createQuery("select count(*) from Journey jn where jn.user.email='"+email1+"'").uniqueResult();
			uac.setRouteCount(routeCount);//行程数
			
			Long guanzhuCount=(Long) session.createQuery("select count(*) from Followed fl where fl.useremail='"+email1+"'").uniqueResult();
			uac.setGuanzhuCount(guanzhuCount);//关注数
			Long fansCount=(Long) session.createQuery("select count(*) from Followed fl where fl.follwed_user='"+email1+"'").uniqueResult();
			uac.setFansCount(fansCount);//粉丝数	
			
			usersList.add(uac);
		}
		return usersList;
	}
	
	
	//从关注表中取出本人粉丝都有谁，有几个
	@SuppressWarnings("null")
	public List<UserAndCount> findFans(String myemail) {
		
		Session session=this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Followed where follwed_user=?0");
		q.setParameter(0,myemail);
		List<Followed> fs = q.list();//粉丝的集合
		
		//创建一个粉丝的用户信息的集合
		List<UserAndCount> usersList=new ArrayList<UserAndCount>();
		//根据上面获得的被关注人的email查找被关注人的信息
		for(Followed f : fs) {
			String email1=f.getUseremail();//获得粉丝的邮箱
			//根据邮箱获得每个用户的信息
			Users onlyfellowUser=(Users)session.createQuery("from Users where email='"+email1+"'").uniqueResult();
			//创建一个实体，里面再绑定根据邮箱查到的攻略条数，行程数，关注数，粉丝数
			UserAndCount uac=new UserAndCount();
			uac.setEmail(onlyfellowUser.getEmail());
			uac.setIcon(onlyfellowUser.getIcon());
			uac.setUsername(onlyfellowUser.getUsername());
				    
			Long strategyCount=(Long) session.createQuery("select count(*) from Strategy st where st.user.email='"+email1+"'").uniqueResult();
			uac.setStrategyCount(strategyCount);//攻略数	
					
			Long routeCount=(Long) session.createQuery("select count(*) from Journey jn where jn.user.email='"+email1+"'").uniqueResult();
			uac.setRouteCount(routeCount);//行程数
					
			Long guanzhuCount=(Long) session.createQuery("select count(*) from Followed fl where fl.useremail='"+email1+"'").uniqueResult();
			uac.setGuanzhuCount(guanzhuCount);//关注数
			Long fansCount=(Long) session.createQuery("select count(*) from Followed fl where fl.follwed_user='"+email1+"'").uniqueResult();
			uac.setFansCount(fansCount);//粉丝数	
					
			usersList.add(uac);
		}
		return usersList;//获得了粉丝用户的集合
	}
	

	
}
