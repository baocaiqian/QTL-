package com.xingtu.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="jourdiv")
public class JourDiv {
	private int myid;
	private Scene scene;
	private Journey journey;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getMyid() {
		return myid;
	}
	public void setMyid(int myid) {
		this.myid = myid;
	}
	@ManyToOne
	@JoinColumn(name="sceneId")
	public Scene getScene() {
		return scene;
	}
	public void setScene(Scene scene) {
		this.scene = scene;
	}
	@ManyToOne
	@JoinColumn(name="jid")
	public Journey getJourney() {
		return journey;
	}
	public void setJourney(Journey journey) {
		this.journey = journey;
	}
}
