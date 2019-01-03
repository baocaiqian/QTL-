package com.xingtu.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * �û���ʵ��bean
 * */
@Entity
@Table(name="users")
public class Users {
	private String email;//����
	private String username;//�û���
	private String password;//����
	private String icon;//ͷ��
	private String signature;//����ǩ��
	private String sex;//�Ա�
	private Date birthday;//����
	private String hobby;//����
	private Date registtime;//ע��ʱ��
	//һ���û������ж�Թ��Եĸ�����
	private List<StrategyComment> stc;//�Թ��Ե�����
	//һ���û����Է����������
	private List<Strategy> st;//����
	//һ���û����Դ�������г�
	private List<Journey> journeys;//�������г�
	private List<Sceneshoucang> sceneshoucang;
	private List<Photo> photos;
	private List<Glshoucang> glshoucang;
	@Id
	@GeneratedValue(generator="assigned")
	@GenericGenerator(name="assigned",strategy="assigned")
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public Date getRegisttime() {
		return registtime;
	}
	public void setRegisttime(Date registtime) {
		this.registtime = registtime;
	}
	@OneToMany(mappedBy="user",targetEntity=Sceneshoucang.class,
			cascade= {CascadeType.ALL})
	public List<Sceneshoucang> getSceneshoucang() {
		return sceneshoucang;
	}
	public void setSceneshoucang(List<Sceneshoucang> sceneshoucang) {
		this.sceneshoucang = sceneshoucang;
	}
	@OneToMany(mappedBy="user",targetEntity=StrategyComment.class,
			cascade= {CascadeType.ALL})
	public List<StrategyComment> getStc() {
		return stc;
	}
	public void setStc(List<StrategyComment> stc) {
		this.stc = stc;
	}
	@OneToMany(mappedBy="user",targetEntity=Strategy.class,
			cascade= {CascadeType.ALL})
	public List<Strategy> getSt() {
		return st;
	}
	public void setSt(List<Strategy> st) {
		this.st = st;
	}
	@OneToMany(mappedBy="user",targetEntity=Journey.class,
			cascade= {CascadeType.ALL})
	public List<Journey> getJourneys() {
		return journeys;
	}
	public void setJourneys(List<Journey> journeys) {
		this.journeys = journeys;
	}
	@OneToMany(mappedBy="email",targetEntity=Photo.class,
			cascade= {CascadeType.ALL})
	public List<Photo> getPhotos() {
		return photos;
	}
	public void setPhotos(List<Photo> photos) {
		this.photos = photos;
	}
	@OneToMany(mappedBy="user",targetEntity=Glshoucang.class,
			cascade= {CascadeType.ALL})
	public List<Glshoucang> getGlshoucang() {
		return glshoucang;
	}
	public void setGlshoucang(List<Glshoucang> glshoucang) {
		this.glshoucang = glshoucang;
	}
	
	
}
