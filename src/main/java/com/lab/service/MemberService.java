package com.lab.service;

import java.util.List;

import com.lab.model.Member;
import com.lab.model.PageBean;

public interface MemberService {
	public List<Member> find(int memberType);
	public List<Member> find(PageBean pageBean,Member s_member);
	public int count(Member s_member);
	
	
	public void add(Member member);
	public void update(Member member);
	public void delete(String ids);
	public Member loadById(int id);
}
