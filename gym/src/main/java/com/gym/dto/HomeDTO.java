package com.gym.dto;


import org.springframework.web.multipart.MultipartFile;

public class HomeDTO {
	
	int id;
	int host_user_id;
	String hostname;
	String tel;
	String name;
	String img;
	String info;
	int people_num;
	String type;
	int state;
	int open_time;
	int close_time;
	String address_1;
	String address_2;
	String x_geo;
	String y_geo;
	String price;
	String searchType;
	String keyword;
	MultipartFile imagePath;
	
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public MultipartFile getImagePath() {
		return imagePath;
	}
	public void setImagePath(MultipartFile imagePath) {
		this.imagePath = imagePath;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getHost_user_id() {
		return host_user_id;
	}
	public void setHost_user_id(int host_user_id) {
		this.host_user_id = host_user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getX_geo() {
		return x_geo;
	}
	public void setX_geo(String x_geo) {
		this.x_geo = x_geo;
	}
	public String getY_geo() {
		return y_geo;
	}
	public void setY_geo(String y_geo) {
		this.y_geo = y_geo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getPeople_num() {
		return people_num;
	}
	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getOpen_time() {
		return open_time;
	}
	public void setOpen_time(int open_time) {
		this.open_time = open_time;
	}
	public int getClose_time() {
		return close_time;
	}
	public void setClose_time(int close_time) {
		this.close_time = close_time;
	}
	
	
	@Override
	public String toString() {
		return "HomeDTO [id="+id+",name="+name+", searchType="+searchType+", keyword="+keyword+"]";
	}

}
