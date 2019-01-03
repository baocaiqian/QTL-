package com.xingtu.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * ���Ե�ʵ��bean
 * */
@Entity
@Table(name="strategy")
public class Strategy {
	private int sId;
	//һ�����Զ�Ӧһ���û�����Ӧ�����useremail
	private Users user;
	private Date stime;//�û��趨�ĳ���ʱ��
	private String title;//���Ա���
	private String tag;//��ǩ
	private String img;//ͼƬ
	private int looktimes;
	private int shoucangtimes;
	private List<StrategyDiv> sd;
	private List<Glshoucang> glshoucang;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	@ManyToOne
	@JoinColumn(name="useremail")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public Date getStime() {
		return stime;
	}
	public void setStime(Date stime) {
		this.stime = stime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public int getLooktimes() {
		return looktimes;
	}
	public void setLooktimes(int looktimes) {
		this.looktimes = looktimes;
	}
	
	public int getShoucangtimes() {
		return shoucangtimes;
	}
	public void setShoucangtimes(int shoucangtimes) {
		this.shoucangtimes = shoucangtimes;
	}
	@OneToMany(mappedBy="strategy",targetEntity=StrategyDiv.class,
			cascade= {CascadeType.ALL})
	public List<StrategyDiv> getSd() {
		return sd;
	}
	public void setSd(List<StrategyDiv> sd) {
		this.sd = sd;
	}
	@OneToMany(mappedBy="strategy",targetEntity=Glshoucang.class,
			cascade= {CascadeType.ALL})
	public List<Glshoucang> getGlshoucang() {
		return glshoucang;
	}
	public void setGlshoucang(List<Glshoucang> glshoucang) {
		this.glshoucang = glshoucang;
	}
	
	
}
