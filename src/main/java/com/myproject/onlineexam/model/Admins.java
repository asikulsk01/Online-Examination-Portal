package com.myproject.onlineexam.model;

public class Admins {
	private String adminId;
	private String password;
	private String adminName;
	private String adminEmail;
	private String adminContactNo;
	private String adminAddress;
	private String adminDob;
	private String adminGender;

	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getAdminName() {return adminName; }
	public void setAdminName(String adminName) {this.adminName = adminName;}

	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminContactNo() {
		return adminContactNo;
	}
	public void setAdminContactNo(String adminContactNo) {
		this.adminContactNo = adminContactNo;
	}

	public String getAdminAddress() {
		return adminAddress;
	}
	public void setAdminAddress(String adminAddress) {
		this.adminAddress = adminAddress;
	}

	public String getAdminDob() {
		return adminDob;
	}
	public void setAdminDob(String adminDob) {
		this.adminDob = adminDob;
	}

	public String getAdminGender() {
		return adminGender;
	}
	public void setAdminGender(String adminGender) {
		this.adminGender = adminGender;
	}
}