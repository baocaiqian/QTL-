package com.xingtu.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="rmcity")
public class Rmcity {
	private int ctid;
	private String ctname;
	private String ctimg;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getCtid() {
		return ctid;
	}
	public void setCtid(int ctid) {
		this.ctid = ctid;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	public String getCtimg() {
		return ctimg;
	}
	public void setCtimg(String ctimg) {
		this.ctimg = ctimg;
	}
	

}
