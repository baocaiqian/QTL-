package com.xingtu.entity;

import java.util.Date;

public class SxAndCount {
     
	private int sxId;
	private String fromUserEm;
	private String content;
	private String toUserEm;
	private int ifRead;
	private Date sxtime;
	private int unreadCount;//未读条数
	private String username;//对方的用户名
	private String icon;//对方的头像
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public int getUnreadCount() {
		return unreadCount;
	}
	public void setUnreadCount(int unreadCount) {
		this.unreadCount = unreadCount;
	}
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
