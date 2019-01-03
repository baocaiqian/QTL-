package com.xingtu.strategy.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Glshoucang;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Strategy;
import com.xingtu.entity.StrategyDiv;
import com.xingtu.entity.Users;

@Repository
public class StrategyDao {
	@Resource
	private SessionFactory sf;
	public Strategy saveStrategy(String []tags,String []titles,String []texts,String []addersses,String title,Users user,MultipartFile file,String path) {
		List<StrategyDiv> sds=new ArrayList<StrategyDiv>();
		Strategy s = new Strategy();
		Session session=this.sf.getCurrentSession();
		//ͷͼ���ϴ�
		if(!file.isEmpty()){//�ж��ļ��Ƿ�Ϊ��
			try {
				InputStream is=file.getInputStream();//�õ����������
				String dirPath = path+"img\\"+user.getEmail()+"\\strategy";
				System.out.println(dirPath);
				File foder=new File(dirPath);
				if(!foder.exists()) {
					foder.mkdirs();
					System.out.println("创建目录");
				}
				FileOutputStream fos=new FileOutputStream(
						dirPath
						+file.getOriginalFilename());//������ļ��ŵ��ҵ���Ŀ��ʵ·���µ�һ��upload��
				s.setImg("img\\"+user.getEmail()+"\\strategy"
						+file.getOriginalFilename());
				int i=0;
				while((i=is.read())!=-1) {
					fos.write(i);
				}
				is.close();
				fos.flush();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String Stag ="";
		for(String tag :tags) {
			Stag=Stag+tag+",";
		}
		s.setTag(Stag);
		if(titles.length==texts.length&&texts.length==addersses.length) {
			for(String ltitle : titles) {
				StrategyDiv sd=new StrategyDiv();
				sd.setTitle(ltitle);
				sds.add(sd);
			}
			for(int i=0;i<sds.size();i++) {
				sds.get(i).setContext(texts[i]);
				sds.get(i).setAddress(addersses[i]);
			}
			s.setUser(user);
			s.setLooktimes(0);
			s.setStime(new Date());
			s.setTitle(title);
			session.save(s);
			System.out.println("�������ݿ�");
			for(int i=0;i<sds.size();i++) {
				sds.get(i).setStrategy(s);
				session.save(sds.get(i));
			}
			s.setSd(sds);
			return s;
		}else {
			return null;
		}
		
	}
	//查找所有的攻略
	public List<Strategy> findAllStrategy(int pageNum,int pageSize){
		Session session = this.sf.getCurrentSession();
		Query q = session.createQuery("from Strategy");
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	//通过id查找攻略
	public Strategy findStrategyById(int id) {
		Session session = this.sf.getCurrentSession();
		Strategy s =(Strategy)session.createQuery("from Strategy where sId="+id).uniqueResult();
		s.setLooktimes(s.getLooktimes()+1);
		Query q = session.createQuery("update Strategy set looktimes ="+s.getLooktimes()+"where sId="+id);
		q.executeUpdate();
		return s;
	}
	//查询出最新攻略的三个
	public List<Strategy> findTheNewStrategy(){
		Session session = this.sf.getCurrentSession();
		Query q = session.createQuery("from Strategy order by stime desc");
		q.setFirstResult(0);
		q.setMaxResults(3);
		return q.list();
	}
	//查出最火的三个攻略
	public List<Strategy> findTheHotStrategy(){
		Session session = this.sf.getCurrentSession();
		Query q = session.createQuery("from Strategy order by looktimes desc");
		q.setFirstResult(0);
		q.setMaxResults(3);
		return q.list();
	}
	//根据标签查询
	public List<Strategy> findStrategyByTag(int pageNum,int pageSize,String tag){
		Session session = this.sf.getCurrentSession();
		Query q = session.createQuery("from Strategy where tag like '%"+tag+"%'");
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	//查出首页6个攻略
	public List<Strategy> findTheIndexStrategy(){
		Session session = this.sf.getCurrentSession();
		Query q = session.createQuery("from Strategy order by looktimes desc");
		q.setFirstResult(0);
		q.setMaxResults(6);
		return q.list();
	}
	public List<Strategy> findByAddress(String address){
		 Session session = this.sf.getCurrentSession();
		 List<Strategy> strategylist = new ArrayList<Strategy>(0);
		 List<StrategyDiv> list = new ArrayList<StrategyDiv>(0);
		 Query q = session.createQuery("from StrategyDiv");
		 list = q.list();
		 for(StrategyDiv sd : list) {
			 if(sd.getAddress().equals(address)) {
				 strategylist.add(this.findStrategyById(sd.getStrategy().getsId()));
			 }
		 }
		return strategylist;
	}
	
	//判断是否已收藏
	public Boolean IfShouCanggl(int strategyid,Users user) {//如果已关注返回true，未关注返回false
		Session session =sf.getCurrentSession();		
		String myemail=user.getEmail();//登录用户的email
		Query q=session.createQuery("from Glshoucang sh where sh.user.email=?0 and sh.strategy.sId=?1");
		q.setParameter(0,myemail);
		q.setParameter(1, strategyid);
		if(q.list().size()!=0) {//说明存在这样一条数据，已收藏
			return true;
		}else {
			return false;
		}
	}
	//点击收藏，将收藏名单插入收藏表
	public Glshoucang InsertShoucanggl(int strategyid,Users user) {
		Session session=sf.getCurrentSession();
		List<Strategy> strategys = new ArrayList<Strategy>();
		Strategy s =(Strategy)session.createQuery("from Strategy where sId="+strategyid).uniqueResult();
		strategys.add(s);
		Glshoucang gls=new Glshoucang();
		gls.setUser(user);
		s.setShoucangtimes(s.getShoucangtimes()+1);
		Query q = session.createQuery("update Strategy set shoucangtimes ="+s.getShoucangtimes()+"where sId="+s.getsId());
		q.executeUpdate();
		gls.setStrategy(s);
		session.save(gls);
		return gls;
	}
		//将收藏者删除
	public int delectShoucanggl(int strategyid,Users user) {
		Session session = sf.getCurrentSession();
		String myemail=user.getEmail();//登录用户的email
		Query q=session.createQuery("delete from Glshoucang gs where gs.user.email='"+myemail+"' and gs.strategy.sId='"+strategyid+"'");
		int x=q.executeUpdate();
		return x;//返回受影响的条数
	}
		//从收藏表中取出本人收藏的攻略有那几个
	@SuppressWarnings("null")
	public List<Strategy> findShoucanggl(String myemail) {
				
		Session session=sf.getCurrentSession();
		Query q=session.createQuery("from Glshoucang where user.email=?0");
				
		q.setParameter(0,myemail);
				
		List<Glshoucang> gls = q.list();//收藏景点的集合
				
		//创建一个收藏景点的集合
		List<Strategy> StrateList=new ArrayList<Strategy>();
		//根据上面获得的被收藏景点的id查找被收藏景点的信息
		for(Glshoucang gl : gls) {
					
			int id=gl.getStrategy().getsId();//获取景点的id
			Strategy shoucanggl=(Strategy)session.createQuery("from Strategy where sId='"+id+"'").uniqueResult();
					
			System.out.println(shoucanggl+"看看第三处是否能运行");
			StrateList.add(shoucanggl);
		}
		return StrateList;
	}
}