package com.xingtu.photo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Photo;
import com.xingtu.entity.Users;
import com.xingtu.photo.dao.PhotoDao;

@Service
@Transactional(readOnly=false)
public class PhotoService {
	@Resource
	private PhotoDao pd;
	public void upPhoto(MultipartFile []files,String path,Users user){
		pd.upPhoto(files, path, user);
	}
	public List<Photo> findphoto(Users u,int pageNum,int pageSize,String searchaddress,String searchpeople,String searchdate){
		return pd.findAllPhoto(u,pageNum,pageSize,searchaddress,searchpeople,searchdate);
	}
	public void updatePhoto(String people,String address,String id,String phototime) {
		pd.updatephoto(people, address, id, phototime);
	}
	public List<Photo> findphotobyadd(String address,Users u,int pageNum,int pageSize){
		return pd.findphotpByAdd(address, u, pageNum, pageSize);
	}
	public List<Photo> findphotobypeople(String people,Users u,int pageNum,int pageSize){
		return pd.findphotoByPeople(people, u, pageNum, pageSize);
	}
	public List<Photo> findphotobydate(String date,Users u,int pageNum,int pageSize){
		return pd.findphotoByDate(date, u, pageNum, pageSize);
	}
}
