package com.xingtu.icon.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.xingtu.entity.Users;
import com.xingtu.icon.dao.IconDaoImpl;

@Service
@Transactional(readOnly=false)
public class iconServiceImpl {
	
	@Resource
	private IconDaoImpl icondaoImpl;
	
	@Transactional(readOnly=false)
	public Users changIcon1(MultipartFile file,String path,Users user) {
		return this.icondaoImpl.changIcon(file,path,user);
	}
	

}
