package com.gym.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gym.dao.ReviewDAO;
import com.gym.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Inject
	private ReviewDAO dao;
	
	
	@Override
	public int reviewInsert(ReviewDTO dto) {
		return dao.reviewInsert(dto);
	}


	@Override
	public List myReviewList(int userId) {
		return dao.myReviewList(userId);
	}


	@Override
	public List gymReviewList(int gym_id) {
		return dao.gymReviewList(gym_id);
	}


	@Override
	public ReviewDTO reviewView(ReviewDTO dto) {
		return dao.reviewView(dto);
	}


	@Override
	public int reviewUpdate(ReviewDTO dto) {
		return dao.reviewUpdate(dto);
	}


	@Override
	public int reviewDel(ReviewDTO dto) {
		return dao.reviewDel(dto);
	}

}
