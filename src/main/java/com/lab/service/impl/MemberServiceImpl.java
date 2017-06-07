package com.lab.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lab.dao.MemberDao;
import com.lab.model.Member;
import com.lab.model.PageBean;
import com.lab.service.MemberService;
@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDao memberDao;
	
	
	@Override
	public List<Member> find(int memberType) {
		return memberDao.find(memberType);
	}
	@Override
	public int count(Member s_member) {
		return memberDao.count(s_member);
	}
	@Override
	public List<Member> find(PageBean pageBean, Member s_member) {
		return memberDao.find(pageBean, s_member);
	}
	@Override
	public void add(Member member) {
		memberDao.add(member);
	}
	@Override
	public void update(Member member) {
		memberDao.update(member);
	}
	@Override
	public void delete(String ids) {
		memberDao.delete(ids);
		
	}
	@Override
	public Member loadById(int id) {
		return memberDao.loadById(id);
	}

}
