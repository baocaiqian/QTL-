package com.xingtu.photo.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Photo;
import com.xingtu.entity.Users;

@Repository
public class PhotoDao {
	@Resource
	private SessionFactory sf;
	public void upPhoto(MultipartFile [] files,String path,Users user){
		Session session  = sf.getCurrentSession();
		List<Photo> photos = new ArrayList<Photo>(0);//创建photo对象
		System.out.println(files==null);
		System.out.println(files.length);
		for(MultipartFile file : files) {
			Photo p = new Photo();
			if(!file.isEmpty()){
				try {
					InputStream is=file.getInputStream();
					String dateDir = new SimpleDateFormat("yyyy/MM/dd").format(new Date());
					String dirPath = path+"img\\"+user.getEmail()+dateDir;
					System.out.println(dirPath);
					File foder=new File(dirPath);
					if(!foder.exists()) {
						foder.mkdirs();
						System.out.println("创建目录");
					}
					FileOutputStream fos=new FileOutputStream(
							dirPath
							+file.getOriginalFilename());
					p.setSrc("img\\"+user.getEmail()+dateDir
							+file.getOriginalFilename());
					p.setEmail(user);
					p.setUptime(new Date());
					session.save(p);
					photos.add(p);
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
		}
	}
	public List<Photo> findAllPhoto(Users u,int pageNum,int pageSize,String searchaddress,String searchpeople,String searchdate){
		Session session = sf.getCurrentSession();
		Query q;
		if(searchaddress.equals("null")&&searchpeople.equals("null")&&searchdate.equals("null")) {
			q= session.createQuery("from Photo where email.email='"+u.getEmail()+"'");
		}else if(searchaddress.equals("null")&&searchpeople.equals("null")&&!searchdate.equals("null")){
			q = session.createQuery("from Photo where phototime like '%"+searchdate+"%' and email.email='"+u.getEmail()+"'");
		}else if(searchaddress.equals("null")&&!searchpeople.equals("null")&&searchdate.equals("null")) {
			q = session.createQuery("from Photo where people like '%"+searchpeople+"%' and email.email='"+u.getEmail()+"'");
		}else if(!searchaddress.equals("null")&&searchpeople.equals("null")&&searchdate.equals("null")) {
			q = session.createQuery("from Photo where address like '%"+searchaddress+"%' and email.email='"+u.getEmail()+"'");
		}else if(!searchaddress.equals("null")&&!searchpeople.equals("null")&&searchdate.equals("null")) {
			q = session.createQuery("from Photo where address like '%"+searchaddress+"%' and people like '%"+searchpeople+"%' and email.email='"+u.getEmail()+"'");
		}else if(!searchaddress.equals("null")&&searchpeople.equals("null")&&!searchdate.equals("null")) {
			q = session.createQuery("from Photo where address like '%"+searchaddress+"%' and phototime like '%"+searchdate+"%' and email.email='"+u.getEmail()+"'");
		}else if(searchaddress.equals("null")&&!searchpeople.equals("null")&&!searchdate.equals("null")) {
			q = session.createQuery("from Photo where people like '%"+searchpeople+"%' and phototime like '%"+searchdate+"%' and email.email='"+u.getEmail()+"'");
		}else {
			q = session.createQuery("from Photo where address like '%"+searchaddress+"%' and people like '%"+searchpeople+"%' and phototime like '%"+searchdate+"%' and email.email='"+u.getEmail()+"'");
		}
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	public void updatephoto(String people,String address,String id,String phototime) {
		Session session = sf.getCurrentSession();
		Query q;
		if(!people.equals("null")&&!address.equals("null")&&!phototime.equals("null")) {
			q = session.createQuery("update Photo set people='"+people+"',address='"+address+"',phototime='"+phototime+"' where id="+id);
			q.executeUpdate();
		}else if(people.equals("null")&&address.equals("null")&&!phototime.equals("null")) {
			q = session.createQuery("update Photo set phototime='"+phototime+"' where id="+id);
			q.executeUpdate();
		}else if(people.equals("null")&&!address.equals("null")&&phototime.equals("null")) {
			q = session.createQuery("update Photo set address='"+address+"' where id="+id);
			q.executeUpdate();
		}else if(!people.equals("null")&&address.equals("null")&&phototime.equals("null")) {
			q = session.createQuery("update Photo set people='"+people+"' where id="+id);
			q.executeUpdate();
		}else if(!people.equals("null")&&!address.equals("null")&&phototime.equals("null")) {
			q = session.createQuery("update Photo set people='"+people+"',address='"+address+"' where id="+id);
			q.executeUpdate();
		}else if(!people.equals("null")&&address.equals("null")&&!phototime.equals("null")) {
			q = session.createQuery("update Photo set people='"+people+"',phototime='"+phototime+"' where id="+id);
			q.executeUpdate();
		}else if(people.equals("null")&&!address.equals("null")&&!phototime.equals("null")) {
			q = session.createQuery("update Photo set address='"+address+"',phototime='"+phototime+"' where id="+id);
			q.executeUpdate();
		}
		
	}
	public List<Photo> findphotpByAdd(String address,Users u,int pageNum,int pageSize){
		Session session = sf.getCurrentSession();
		Query q = session.createQuery("from Photo where address like '%"+address+"%' and email.email='"+u.getEmail()+"'");
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	public List<Photo> findphotoByPeople(String people,Users u,int pageNum,int pageSize){
		Session session = sf.getCurrentSession();
		Query q = session.createQuery("from Photo where people like '%"+people+"%' and email.email='"+u.getEmail()+"'");
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
	public List<Photo> findphotoByDate(String date,Users u,int pageNum,int pageSize){
		Session session = sf.getCurrentSession();
		Query q = session.createQuery("from Photo where phototime like '%"+date+"%' and email.email='"+u.getEmail()+"'");
		q.setFirstResult((pageNum-1)*pageSize);
		q.setMaxResults(pageSize);
		return q.list();
	}
}
