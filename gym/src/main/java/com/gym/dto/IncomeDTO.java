package com.gym.dto;

public class IncomeDTO {
	
	//수익관련 컬럼
	private int host_id;
	private int cnt;
	private String incomeY;
	private String incomeM;
	private int income;
	private String nickname;
	
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getHost_id() {
		return host_id;
	}
	public void setHost_id(int host_id) {
		this.host_id = host_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getIncomeY() {
		return incomeY;
	}
	public void setIncomeY(String incomeY) {
		this.incomeY = incomeY;
	}
	public String getIncomeM() {
		return incomeM;
	}
	public void setIncomeM(String incomeM) {
		this.incomeM = incomeM;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	
	/*
	 * @Override public String toString() { return "[host_id=" + host_id +
	 * ", incomeM=" + incomeM + ", cnt=" + cnt + ", income=" + income + ", incomeY="
	 * + incomeY + "]"; }
	 */
	
	
}
