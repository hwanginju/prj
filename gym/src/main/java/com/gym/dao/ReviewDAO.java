package com.gym.dao;

import java.util.List;

import com.gym.dto.ReviewDTO;

public interface ReviewDAO {

	int reviewInsert(ReviewDTO dto);

	List myReviewList(int userId);

	List gymReviewList(int gym_id);

	ReviewDTO reviewView(ReviewDTO dto);

	int reviewUpdate(ReviewDTO dto);

	int reviewDel(ReviewDTO dto);

}
