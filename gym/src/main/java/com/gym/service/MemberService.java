package com.gym.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.gym.dto.MemberDTO;
import com.gym.dao.MemberDAO;

public interface MemberService {
	/* 유저 로그인체크 */
	public MemberDTO loginCheck(MemberDTO dto, HttpSession session);

	public MemberDTO guestInfo(int id);

	public int guestInfoEdit(MemberDTO dto);

	public MemberDTO hostInfo(int id);

	public int hostInfoEdit(MemberDTO dto);

	public MemberDTO emailDup(String email);

	public int memberJoin(MemberDTO dto);

	public List AllHostUserInfo();

	public List AllGuestUserInfo();

	public int memberPwdEdit(MemberDTO dto);

	public int member_delete(MemberDTO dto);

	public List AllHostUserInfo_reject();
	
	public List AllHostUserInfo_wait();

	public int hostStateEdit(MemberDTO dto);

	public int guestJoin(MemberDTO dto);


}

