package com.gym.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.dto.HomeDTO;
import com.gym.dto.ReviewDTO;
import com.gym.service.ReviewService;
import com.gym.service.HomeService;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	 @Inject
	 ReviewService Reviewservice;
	 
	 @Inject
	 HomeService Homeservice;
	 
	
	 
	 @RequestMapping("myReviewList")
	 public String myReviewList(Locale locale, Model model, HttpSession session) throws Exception{
		 List reviewList = Reviewservice.myReviewList((int)session.getAttribute("id"));
		 model.addAttribute("list", reviewList);
		 return "review/myReviewList";
	 }
	 
	@RequestMapping(value="reviewWrite", method=RequestMethod.GET)
	public String reviewWrite(Locale locale, Model model, HttpServletRequest request, 
			HttpSession session, @RequestParam("gym_id") int gym_id, @RequestParam("resv_id") int resv_id) throws Exception {
		HomeDTO homeDto = Homeservice.view(gym_id);
		
		model.addAttribute("resv_id",resv_id);
		model.addAttribute("gymInfo", homeDto);
		return "review/guest_review";
	}
	
	@ResponseBody
	@RequestMapping(value="reviewInsert", method=RequestMethod.POST)
	public void reviewInsert(ReviewDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		dto.setUser_id((int)session.getAttribute("id"));
		
		PrintWriter out = response.getWriter();
		if(Reviewservice.reviewInsert(dto) == 1) {
			out.println("<script>alert('등록되었습니다.'); location.href = '/review/myReviewList'</script> ");
			out.flush();
		}else {
			out.println("<script>alert('등록에 실패했습니다.'); location.href = '/review"
					+ "/myReviewList'</script> ");
			out.flush();
		}
	}
	
//	리뷰 상세보기
	@RequestMapping(value="reviewView", method= RequestMethod.GET)
	public String reviewView(Locale locale, Model model, ReviewDTO dto, HttpServletResponse response) throws Exception {
		ReviewDTO reviewInfo = Reviewservice.reviewView(dto);
		HomeDTO gymInfo = Homeservice.view(dto.getGym_id());
		model.addAttribute("gymInfo",gymInfo);
		model.addAttribute("reviewInfo",reviewInfo);
		
		return "review/reviewView";
	}
	
//	리뷰 수정
	@ResponseBody
	@RequestMapping(value="reviewUpdate", method=RequestMethod.POST)
	public void reviewUpdate(ReviewDTO dto, HttpServletResponse response) throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(Reviewservice.reviewUpdate(dto) == 1) {
			out.println("<script>alert('수정되었습니다.'); location.href = '/review/myReviewList'</script> ");
			out.flush();
		}else {
			out.println("<script>alert('수정에 실패했습니다.'); location.href = '/review/myReviewList'</script> ");
			out.flush();
		}
	}
	
	//리뷰 삭제
	@ResponseBody
	@RequestMapping(value="reviewDel", method=RequestMethod.POST)
	public String reviewDel(ReviewDTO dto, HttpServletResponse response) throws Exception{
		if(Reviewservice.reviewDel(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
		
	}
	
}
