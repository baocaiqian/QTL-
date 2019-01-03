package com.xingtu.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="photo")
public class Photo {
	private int id;
	private String people;
	private Date phototime;
	private Date uptime;
	private String address;
	private String src;
	private Users email;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public Date getPhototime() {
		return phototime;
	}
	public void setPhototime(Date phototime) {
		this.phototime = phototime;
	}
	public Date getUptime() {
		return uptime;
	}
	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	@ManyToOne
	@JoinColumn(name="useremail")
	public Users getEmail() {
		return email;
	}
	public void setEmail(Users email) {
		this.email = email;
	}
}
