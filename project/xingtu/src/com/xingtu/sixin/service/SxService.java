package com.xingtu.sixin.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xingtu.entity.Sx;
import com.xingtu.entity.SxAndCount;
import com.xingtu.sixin.dao.SxDao;

@Service
@Transactional(readOnly=false) //如果要执行删除和修改必须要加事务
public class SxService {
    @Resource
    private SxDao sxDao;
    
    @Transactional(readOnly=false)
    public List<Sx> InsertLTContent1(Sx sx) {
    	sx.setSxtime(new Date());
    	sx.setIfRead(0);
    	return this.sxDao.InsertLTContent(sx);
    }
    
    //得到一开始的数据库的内容
    @Transactional(readOnly=false)
    public List<Sx> getAllContent1(String myemail,String otheremail){
    	return this.sxDao.getAllContent(myemail, otheremail);
    }
    
    //得到与每个人的最后一条信息
    public List<SxAndCount> getSiXinPageContent1(String myemail){
    	return this.sxDao.getSiXinPageContent(myemail);
    }
    
    
}
