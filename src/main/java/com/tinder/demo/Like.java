package com.tinder.demo;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Like {
	@Id
	private long idLike;
	private Date created;
	private long likedUserId;
	private long userId;
	
	public long getIdLike() {
		return idLike;
	}
	public void setIdLike(long idLike) {
		this.idLike = idLike;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public long getLikedUserId() {
		return likedUserId;
	}
	public void setLikedUserId(long likedUserId) {
		this.likedUserId = likedUserId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	
	
}
