package com.xingtu.icon.dao;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Users;

@Repository
public class IconDaoImpl {
    
	@Resource
	private SessionFactory sf;
	
	public Users changIcon(MultipartFile file,String path,Users user) {//第一个参数是传入的文件，第二个参数是tomcat的路径，第三个参数是登录人
		Session session=sf.getCurrentSession();
		Users user1=new Users();
		String imgurl=null;
		if(!file.isEmpty()) {
			InputStream is;
			try {
				is = file.getInputStream();
				String dirPath = path+"img\\"+user.getEmail();
				File folder=new File(dirPath);
				if(!folder.exists()) {
					folder.mkdirs();
					System.out.println("创建目录");
				}
				FileOutputStream fos;
				fos = new FileOutputStream(dirPath+file.getOriginalFilename());
				//获得文件本身的名字
				imgurl="img\\"+user.getEmail()+file.getOriginalFilename(); //这是需要插入数据库的文件路径
				int i=0;
				while((i=is.read())!=-1) {//将文件写入文件夹
					fos.write(i);
				}
				is.close();
				fos.flush();
				fos.close();
				
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//将新头像的路径插入数据库
			
			Query q=session.createQuery("update Users us set us.icon=?0 where us.email=?1");
			System.out.println(imgurl);
			q.setParameter(0,imgurl);
			q.setParameter(1, user.getEmail());
			q.executeUpdate();	
			//再取出
			user1=(Users) session.createQuery("from Users where email='"+user.getEmail()+"'").uniqueResult();	
		}
		return user1;
	}
}
