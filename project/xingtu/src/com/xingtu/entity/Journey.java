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
@Entity
@Table(name="journey")
public class Journey {
	private int jid;//���
	private String jtitle;//�г�·��
	private Date createtime;//����ʱ��
	private String jtime;//����ʱ��
	//һ���г�ֻ������һ���û�
	private Users user;//�û�
	private List<JourDiv> jd;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	
	public String getJtitle() {
		return jtitle;
	}
	public void setJtitle(String jtitle) {
		this.jtitle = jtitle;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public String getJtime() {
		return jtime;
	}
	public void setJtime(String jtime) {
		this.jtime = jtime;
	}
	@ManyToOne
	@JoinColumn(name="useremail")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	@OneToMany(mappedBy="journey",targetEntity=JourDiv.class,
			cascade= {CascadeType.ALL})
	public List<JourDiv> getJd() {
		return jd;
	}
	public void setJd(List<JourDiv> jd) {
		this.jd = jd;
	}
	
	

}
