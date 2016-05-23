package org.nxum.medicine.view.entity;

public class ResultUser {
	private String 	userName ;
	private String	password ;
	private String  code;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "RestultUser [userName=" + userName + ", password=" + password
				+ ", code=" + code + "]";
	}
	
}
