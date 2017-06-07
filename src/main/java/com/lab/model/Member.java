package com.lab.model;

public class Member {
	private Integer id;
	private String memberName;
	private String email;
	private String memberPic;
	private int memberType;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(String memberPic) {
		this.memberPic = memberPic;
	}
	public int getMemberType() {
		return memberType;
	}
	public void setMemberType(int memberType) {
		this.memberType = memberType;
	}
	public Member(int id, String memberName, String email, String memberPic) {
		super();
		this.id = id;
		this.memberName = memberName;
		this.email = email;
		this.memberPic = memberPic;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
