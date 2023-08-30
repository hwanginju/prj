package com.gym.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mapper.review";
	
	@Override
	public int reviewInsert(ReviewDTO dto) {
		return sqlSession.insert(namespace+".reviewInsert", dto);
	}

	@Override
	public List myReviewList(int userId) {
		return sqlSession.selectList(namespace+".myReviewList", userId);
	}

	@Override
	public List gymReviewList(int gym_id) {
		return sqlSession.selectList(namespace+".gymReviewList", gym_id);
	}

	@Override
	public ReviewDTO reviewView(ReviewDTO dto) {
		return sqlSession.selectOne(namespace+".reviewView", dto);
	}

	@Override
	public int reviewUpdate(ReviewDTO dto) {
		return sqlSession.update(namespace+".reviewUpdate", dto);
	}

	@Override
	public int reviewDel(ReviewDTO dto) {
		return sqlSession.delete(namespace+".reviewDel", dto);
	}

}
