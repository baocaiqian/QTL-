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
 * ���Ե�ʵ��bean
 * */
@Entity
@Table(name="strategycomment")
public class StrategyComment {
	private int scId;//���
	//һ�����۶�Ӧһ�����ԣ���Ӧ�����sId
	private Strategy strategy;//��Ӧ�Ĺ���
	//һ�����Զ�Ӧһ���û�����Ӧ�����useremail
	private Users user;//��Ӧ���û�
	private Date createtime;//�������Ե�ʱ��
	private String content;//���۵�����
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
	//��Զ�ӳ��
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
