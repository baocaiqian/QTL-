package com.xingtu.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 攻略的实体bean
 * */
@Entity
@Table(name="strategycomment")
public class StrategyComment {
	private int scId;//序号
	//一个评论对应一个攻略，对应外键：sId
	private Strategy strategy;//对应的攻略
	//一个攻略对应一个用户，对应外键：useremail
	private Users user;//对应的用户
	private Date createtime;//创建攻略的时间
	private String content;//评论的内容
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getScId() {
		return scId;
	}
	public void setScId(int scId) {
		this.scId = scId;
	}
	@ManyToOne
	@JoinColumn(name="sId")
	public Strategy getStrategy() {
		return strategy;
	}
	public void setStrategy(Strategy strategy) {
		this.strategy = strategy;
	}
	//多对多映射
	@ManyToOne
	@JoinColumn(name="useremail")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
