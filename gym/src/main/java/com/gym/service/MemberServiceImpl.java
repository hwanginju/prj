package com.gym.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.MemberDAO;
import com.gym.dto.MemberDTO;

@Service // service bean으로 등록
public class MemberServiceImpl implements MemberService {

	/* db에 접근할 수 있는 접근자 의존성 주입 */
	@Inject
	MemberDAO memberDao;

	/* 유저 로그인체크 */
	@Override
	public MemberDTO loginCheck(MemberDTO dto, HttpSession session) {
		MemberDTO nickName = memberDao.loginCheck(dto);
		if (nickName != null) { // 세션 변수 저장
			session.setAttribute("id", dto.getId());
			session.setAttribute("nickName", nickName);
		}
		return nickName;
	}

	@Override
	public MemberDTO guestInfo(int id) {
		return memberDao.guestInfo(id);
	}
	
	@Override
	public int guestInfoEdit(MemberDTO dto) {
		return memberDao.guestInfoEdit(dto);
	}

	@Override
	public MemberDTO hostInfo(int id) {
		return memberDao.hostInfo(id);
	}

	@Override
	public int hostInfoEdit(MemberDTO dto) {
		return memberDao.hostInfoEdit(dto);
	}

	@Override
	public MemberDTO emailDup(String email) {
		return memberDao.emailDup(email);
	}

	@Override
	public int memberJoin(MemberDTO dto) {
		return memberDao.memberJoin(dto);
	}

	@Override
	public List AllHostUserInfo() {
		return memberDao.AllHostUserInfo();
	}

	@Override
	public List AllGuestUserInfo() {
		return memberDao.AllGuestUserInfo();
	}

	@Override
	public int memberPwdEdit(MemberDTO dto) {
		return memberDao.memberPwdEdit(dto);
	}

	@Override
	public int member_delete(MemberDTO dto) {
		return memberDao.member_delete(dto);
	}

	@Override
	public List AllHostUserInfo_reject() {
		return memberDao.AllHostUserInfo_reject();
	}

	@Override
	public List AllHostUserInfo_wait() {
		return memberDao.AllHostUserInfo_wait();
	}

	@Override
	public int hostStateEdit(MemberDTO dto) {
		return memberDao.hostStateEdit(dto);
	}

	@Override
	public int guestJoin(MemberDTO dto) {
		return memberDao.guestJoin(dto);
	}
	


}
