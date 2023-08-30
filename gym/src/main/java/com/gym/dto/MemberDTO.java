package com.gym.dto;

import java.util.Date;

public class MemberDTO {
	
	private int id;
	private int isUse;
	
	
	public int getIsUse() {
		return isUse;
	}

	public void setIsUse(int isUse) {
		this.isUse = isUse;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getBusinessReg() {
		return businessReg;
	}

	public void setBusinessReg(String businessReg) {
		this.businessReg = businessReg;
	}
	
	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	public String getAddress_1() {
		return address_1;
	}

	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}

	public String getAddress_2() {
		return address_2;
	}

	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}


	
	private String email;
	private String pwd;
	private String nickName;
	private String tel;
	private String created_at;
	private String auth;
	private String updated_at;
	private String address_1;
	private String address_2;
	private String businessReg;
	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}



	private String ceo;
	private int state;
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getAuth() {
		return auth;
	}


	public void setAuth(String auth) {
		this.auth = auth;
	}


	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", nickName=" + nickName + ", email=" + email
				+ ", created_at=" + created_at + ", auth=" + auth +  "]";
	}
}