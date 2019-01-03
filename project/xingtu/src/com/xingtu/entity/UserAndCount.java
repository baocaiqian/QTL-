package com.xingtu.entity;

import java.util.Date;

public class UserAndCount {
	private String email;
	private String username;
	private String password;
	private String icon;
	private String signature;
	private String sex;
	private Date birthday;
	private String hobby;
	private Date registtime;
	private Long strategyCount;//攻略数
	private Long routeCount;//行程数
	private Long guanzhuCount;//关注数
	private Long fansCount;//粉丝数
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
	public Long getStrategyCount() {
		return strategyCount;
	}
	public void setStrategyCount(Long strategyCount) {
		this.strategyCount = strategyCount;
	}
	public Long getRouteCount() {
		return routeCount;
	}
	public void setRouteCount(Long routeCount) {
		this.routeCount = routeCount;
	}
	public Long getGuanzhuCount() {
		return guanzhuCount;
	}
	public void setGuanzhuCount(Long guanzhuCount) {
		this.guanzhuCount = guanzhuCount;
	}
	public Long getFansCount() {
		return fansCount;
	}
	public void setFansCount(Long fansCount) {
		this.fansCount = fansCount;
	}
	
	
	
}
