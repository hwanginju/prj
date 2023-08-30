package com.gym.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.dto.MemberDTO;

@Repository // 현재 클래스를 dao bean으로 등록
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession; // SqlSession 의존관계 주입

	/* 유저 로그인체크 */
	@Override
	public MemberDTO loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("member.login_check", dto);
	}
	
	@Override
	public MemberDTO guestInfo(int id) {
		return sqlSession.selectOne("member.guestInfo",id);
	}

	@Override
	public int guestInfoEdit(MemberDTO dto) {
		return sqlSession.update("member.guestInfoEdit", dto);
	}

	@Override
	public MemberDTO hostInfo(int id) {
		return sqlSession.selectOne("member.hostInfo", id);
	}

	@Override
	public int hostInfoEdit(MemberDTO dto) {
		return sqlSession.update("member.hostInfoEdit", dto);
	}

	@Override
	public MemberDTO emailDup(String email) {
		return sqlSession.selectOne("member.emailDup",email);
	}

	@Override
	public int memberJoin(MemberDTO dto) {
		return sqlSession.insert("member.memberJoin", dto);
	}

	@Override
	public List AllHostUserInfo() {
		return sqlSession.selectList("member.AllHostUserInfo");
	}

	@Override
	public List AllGuestUserInfo() {
		return sqlSession.selectList("member.AllGuestUserInfo");
	}

	@Override
	public int memberPwdEdit(MemberDTO dto) {
		return sqlSession.update("member.memberPwdEdit", dto);
	}

	@Override
	public int member_delete(MemberDTO dto) {
		return sqlSession.update("member.member_delete", dto);
	}

	@Override
	public List AllHostUserInfo_reject() {
		return sqlSession.selectList("member.AllHostUserInfo_reject");
	}
	
	@Override
	public List AllHostUserInfo_wait() {
		return sqlSession.selectList("member.AllHostUserInfo_wait");
	}

	@Override
	public int hostStateEdit(MemberDTO dto) {
		return sqlSession.update("member.hostStateEdit",dto);
	}

	@Override
	public int guestJoin(MemberDTO dto) {
		return sqlSession.insert("member.guestJoin", dto);
	}

}