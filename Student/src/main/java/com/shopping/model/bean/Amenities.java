package com.shopping.model.bean;

public class Amenities {
	private int amid;
	private String name;
	private String description;
	private String image;
	public int getAmid() {
		return amid;
	}
	public void setAmid(int amid) {
		this.amid = amid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "Amenities [amid=" + amid + ", name=" + name + ", description=" + description + ", image=" + image + "]";
	}
	

}
