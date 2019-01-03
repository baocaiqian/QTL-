package com.xingtu.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="youjiimg")
public class StrategyImg {
	private int id;//–Ú∫≈
	private String src;//µÿ÷∑
	private StrategyDiv sd;//À˘ Ùπ•¬‘div
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	@ManyToOne
	@JoinColumn(name="youjidivid")
	public StrategyDiv getSd() {
		return sd;
	}
	public void setSd(StrategyDiv sd) {
		this.sd = sd;
	}
	
}
