package com.gym.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gym.dto.ReviewDTO;

public interface ReviewService {

	public int reviewInsert(ReviewDTO dto);

	public List myReviewList(int userId);

	public List gymReviewList(int gym_id);

	public ReviewDTO reviewView(ReviewDTO dto);

	public int reviewUpdate(ReviewDTO dto);

	public int reviewDel(ReviewDTO dto);

}
