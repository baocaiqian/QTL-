package com.xingtu.nav.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xingtu.entity.Nav;
import com.xingtu.nav.dao.NavDao;

@Service
@Transactional(readOnly=true)
public class NavService {
	@Resource
	private NavDao nd;
	public List<Nav> findNav(){
		try {
			return nd.findAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
