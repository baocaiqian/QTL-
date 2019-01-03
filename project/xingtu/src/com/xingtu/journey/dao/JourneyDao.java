package com.xingtu.journey.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.xingtu.entity.JourDiv;
import com.xingtu.entity.Journey;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.StrategyDiv;
import com.xingtu.entity.Users;

@Repository
public class JourneyDao {
	/**
	 * 查询热门城市
	 * 
	 */
	@Resource
	private SessionFactory sf;
	public List<Scene> getCityList(){
		Session session = sf.getCurrentSession();
		Query q = session.createQuery("from Rmcity");
		q.setFirstResult(0);
		q.setMaxResults(9);
		return q.list();
	}
	/**
	 * 查询该城市的热门景点
	 * 
	 */
	public List<Scene> getJourneyList(int pageNum,int pageSize,String[] cityname){
		Session session = sf.getCurrentSession();
		String names="";
		int i=0;
		for(String name : cityname) {
			i++;
			if(i<cityname.length) {
				names+="s.city='"+name+"' or ";
			}if(i==cityname.length) {
				names+="s.city='"+name+"'";
			}
		}
		String sql = "from Scene s where ";
		System.out.println(sql+names);
		Query q = session.createQuery(sql+names);
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	/**
	 * 获取收藏的景点
	 */
	public List<Sceneshoucang> getScScene(String email,int pageNum,int pageSize){
		Session session=sf.getCurrentSession();
		Query q=session.createQuery("from Sceneshoucang where user.email='"+email+"'");
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	/**
	 * 向数据库中插入数据
	 * @param 
	 */
	public Journey saveJourney(String sceneid[],Users user,String jtime,String jtitle) {
		Session session = sf.getCurrentSession();
		List <JourDiv> jds=new ArrayList<JourDiv>();
		Journey j=new Journey();
		List<Scene> scenes = new ArrayList<Scene>();
		for(String id : sceneid) {
			Scene s =(Scene)session.createQuery("from Scene where sceneId="+id).uniqueResult();
			scenes.add(s);
		}
			for(Scene diid : scenes) {
				JourDiv jd=new JourDiv();
				jd.setScene(diid);
				jds.add(jd);
			}
			j.setUser(user);
			j.setCreatetime(new Date());
			j.setJtitle(jtitle);
			j.setJtime(jtime);
			session.save(j);
			for(int i=0;i<jds.size();i++) {
				jds.get(i).setJourney(j);
				session.save(jds.get(i));
			}
			j.setJd(jds);
			return j;
	}
	/**
	 * 根据id查找行程
	 */
	public Journey findJourById(int id){
		Session session=sf.getCurrentSession();
		Journey j=(Journey) session.createQuery("from Journey j where j.jid="+id).uniqueResult();
		return j;		
	}
	/**
	 * 删除行程
	 */
	public int deletJour(int id) {
		Session session = sf.getCurrentSession();
		Query q=session.createQuery("delete from Journey j where j.jid='"+id+"'");
		int x=q.executeUpdate();
		return x;//返回受影响的条数
	}
	//通过名字获取城市
	public List<Scene> findCitybyname(String name){
		Session session = sf.getCurrentSession();
		Query q = session.createQuery("from Rmcity where ctname='"+name+"'");
		return q.list();
	}
}
