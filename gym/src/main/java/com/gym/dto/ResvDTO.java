package com.gym.dto;

import java.util.Date;

public class ResvDTO {
   
   private int id;
   private int user_id;
   private int gym_id;
   private String resv_date;
   private String resv_time;
   private String resv_time_2;
   private String pay_date;
   private String state;
   private String price;
   private String payment_code;
   private String gym_name;
   private String nickname;
   private String tel;
   private int reviewYN;
   private int resvDone;
   
	public int getResvDone() {
	return resvDone;
	}
	
	public void setResvDone(int resvDone) {
		this.resvDone = resvDone;
	}
	public String getResv_time_2() {
		return resv_time_2;
	}
	public void setResv_time_2(String resv_time_2) {
		this.resv_time_2 = resv_time_2;
	}
	public String getGym_name() {
      return gym_name;
   }
   public void setGym_name(String gym_name) {
      this.gym_name = gym_name;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   
   
   public int getReviewYN() {
      return reviewYN;
   }
   public void setReviewYN(int reviewYN) {
      this.reviewYN = reviewYN;
   }
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public int getUser_id() {
      return user_id;
   }
   public void setUser_id(int user_id) {
      this.user_id = user_id;
   }
   public int getGym_id() {
      return gym_id;
   }
   public void setGym_id(int gym_id) {
      this.gym_id = gym_id;
   }
   public String getResv_date() {
      return resv_date;
   }
   public void setResv_date(String resv_date) {
      this.resv_date = resv_date;
   }
   public String getResv_time() {
      return resv_time;
   }
   public void setResv_time(String resv_time) {
      this.resv_time = resv_time;
   }
   public String getPay_date() {
      return pay_date;
   }
   public void setPay_date(String pay_date) {
      this.pay_date = pay_date;
   }
   public String getState() {
      return state;
   }
   public void setState(String state) {
      this.state = state;
   }
   public String getPrice() {
      return price;
   }
   public void setPrice(String price) {
      this.price = price;
   }
   public String getPayment_code() {
      return payment_code;
   }
   public void setPayment_code(String payment_code) {
      this.payment_code = payment_code;
   }
   
}