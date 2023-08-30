package com.gym.dao;

import java.util.List;

import com.gym.dto.MemberDTO;

public interface MemberDAO {

	/* 유저 로그인체크 */
	public MemberDTO loginCheck(MemberDTO dto);

	MemberDTO guestInfo(int id);

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

	List AllHostUserInfo_wait();

	public int hostStateEdit(MemberDTO dto);

	public int guestJoin(MemberDTO dto);

}