package com.xingtu.journey.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xingtu.entity.Journey;
import com.xingtu.entity.Scene;
import com.xingtu.entity.Sceneshoucang;
import com.xingtu.entity.Users;
import com.xingtu.journey.dao.JourneyDao;

@Service
@Transactional(readOnly=false)
public class JourneyService {
	@Resource
	private JourneyDao jd;
	public List<Scene> getCityList(){
		return jd.getCityList();
	}
	public List<Scene> getJourneyList(int pageNum,int pageSize,String[] cityname){
		return jd.getJourneyList(pageNum, pageSize, cityname);
	}
	public List<Sceneshoucang> getScScene(String email,int pageNum,int pageSize){
		return jd.getScScene(email,pageNum,pageSize);
	}
	public Journey createJourney(String scenes[],Users user,String jtime,String jtitle) {
		return jd.saveJourney(scenes, user, jtime, jtitle);
	}
	/*public List<Scene> findJour(String journames){
		return jd.findJour(journames);
	}*/
	public Journey findJourById(int id) {
		return jd.findJourById(id);
	}
	public void deletJour(int id) {
		jd.deletJour(id);
	}
	public List<Scene> findCitybyname(String name){
		return jd.findCitybyname(name);
	}
}
