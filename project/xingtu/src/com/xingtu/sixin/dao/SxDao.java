package com.xingtu.sixin.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.xingtu.entity.Sx;
import com.xingtu.entity.SxAndCount;
import com.xingtu.entity.Users;

@Repository
public class SxDao {
	@Resource
    private SessionFactory sessionFactory;
	
	//查出两者的聊天记录（此时没有用户）
	public  List<Sx> InsertLTContent(Sx sx) {
		//插入数据
		Session session=this.sessionFactory.getCurrentSession();
		session.save(sx);
		String myemail=sx.getFromUserEm();
		String otheremail=sx.getToUserEm();
		System.out.println(otheremail);
		//查出数据
		Query q=session.createQuery("from Sx where fromUserEm in(?0,?1) and toUserEm in(?0,?1) order by sxId desc");
		q.setParameter(0, myemail);
		q.setParameter(1, otheremail);
		
	    return q.list();
	}
	
	//查出两者的聊天记录，此时有用户
	public List<Sx> getAllContent(String myemail,String otheremail){
		Session session = this.sessionFactory.getCurrentSession();
		Query q=session.createQuery("from Sx where fromUserEm in(?0,?1) and toUserEm in(?0,?1) order by sxId desc");
		q.setParameter(0, myemail);
		q.setParameter(1, otheremail);
		//在每次查询之后，将字段ifRead的默认0改为1，即将未读改为已读
		Query q1=session.createQuery("update Sx s set s.ifRead=1");
		q1.executeUpdate();
		return q.list();
	}
	
	
	public List<SxAndCount> getSiXinPageContent(String myemail){ 
		Session session=this.sessionFactory.getCurrentSession();
		
		//查出给我发过消息的所有人
		Query q=session.createQuery("select distinct fromUserEm from Sx s where s.toUserEm=?0");
		q.setParameter(0,myemail);
		List<String> allemail = q.list();//
		List<SxAndCount> myownXinxi=new ArrayList<SxAndCount>();//存储我与这个邮箱之间所有的信息中的最后一条（用倒叙排序取出第一条）
		for(String otheremail:allemail) {//根据邮箱也可以查出未读条数
			//查询我与每个人之间发的消息的最后一条，并插入myownXinxi的数组中
			Query q1=session.createQuery("from Sx s where s.fromUserEm=?0 and s.toUserEm=?1 order by sxId desc");
			q1.setParameter(0,otheremail);
			q1.setParameter(1, myemail);
			List<Sx> sxlist=q1.list();
			//获得与这个邮箱对话中的第一条
			//将这个里面的与SxAndCount实体里面的属性一一对应
			Sx firstSx=sxlist.get(0);
			SxAndCount sc=new SxAndCount();
			sc.setFromUserEm(firstSx.getFromUserEm());
			sc.setContent(firstSx.getContent());
			sc.setIfRead(firstSx.getIfRead());
			sc.setSxId(firstSx.getSxId());
			sc.setSxtime(firstSx.getSxtime());
			sc.setToUserEm(firstSx.getToUserEm());
			
			//得到对方的icon和username
			Query q3=session.createQuery("from Users u where u.email=?0");
			q3.setParameter(0, otheremail);
			List<Users> userlist=q3.list();
			Users firstUser=userlist.get(0);
			sc.setIcon(firstUser.getIcon());
			sc.setUsername(firstUser.getUsername());
						
			
			//查找未读条数
			Query q2=session.createQuery("from Sx s where s.fromUserEm=?0 and s.toUserEm=?1 and s.ifRead=0");
			q2.setParameter(0,otheremail);
			q2.setParameter(1, myemail);
			
			if(q2.list().equals("")||q2.list()==null) {
				sc.setUnreadCount(0);
			}else {
				sc.setUnreadCount(q2.list().size());
			}			
			myownXinxi.add(sc);
		}
		return myownXinxi;
			
	}
	
	
	
}
