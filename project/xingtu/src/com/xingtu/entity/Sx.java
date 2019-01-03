package com.xingtu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sx")
public class Sx {
	private int sxId;
	private String fromUserEm;
	private String content;
	private String toUserEm;
	private int ifRead;
	private Date sxtime;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getSxId() {
		return sxId;
	}
	public void setSxId(int sxId) {
		this.sxId = sxId;
	}
	public String getFromUserEm() {
		return fromUserEm;
	}
	public void setFromUserEm(String fromUserEm) {
		this.fromUserEm = fromUserEm;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getToUserEm() {
		return toUserEm;
	}
	public void setToUserEm(String toUserEm) {
		this.toUserEm = toUserEm;
	}
	public int getIfRead() {
		return ifRead;
	}
	public void setIfRead(int ifRead) {
		this.ifRead = ifRead;
	}
	
	public Date getSxtime() {
		return sxtime;
	}
	public void setSxtime(Date sxtime) {
		this.sxtime = sxtime;
	}
	
	
	

}
