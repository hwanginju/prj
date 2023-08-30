package com.gym.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gym.dto.HomeDTO;
import com.gym.dto.MemberDTO;
import com.gym.service.HomeService;
import com.gym.service.ReviewService;
import com.gym.service.MemberService;

@Controller
public class HomeController {
	
	@Inject
	HomeService Homeservice;
	
	@Inject
	ReviewService Reviewservice;
	@Inject
	MemberService Memberservice;
	
	//메인 게스트 홈 화면으로 이동(최초접속을 여기로 할 수 있게끔)
	//다른페이지 들어갈수 있게끔 하려면 ModelAndView("여기에 경로 수정");
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String list(Locale locale, Model model)throws Exception{
		List list = Homeservice.list();
		model.addAttribute("list", list);
		
		return "guest/home";
	}
	
	// 시설 조회
	@RequestMapping(value="/gymInfo", method=RequestMethod.GET)
	@ResponseBody
	public void gymInfo(HttpServletResponse response, @RequestParam("id") int id) throws IOException{
		HomeDTO dto = new HomeDTO();
		dto = Homeservice.view(id);
		
		PrintWriter out = response.getWriter();
		if(dto != null) {
			out.println(dto.getImg()+","+dto.getName());
		}
	}
	
	//시설 상세페이지
	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String view(Locale locale, Model model, HttpServletRequest request) throws Exception{
		HomeDTO dto = Homeservice.view(Integer.parseInt((String)request.getParameter("id")));
		List reviewList = Reviewservice.gymReviewList(Integer.parseInt((String)request.getParameter("id")));
		model.addAttribute("view", dto);
		model.addAttribute("reivewList", reviewList);
		return "guest/gymDetail";
	}
	
	@RequestMapping(value="/gymDetail", method=RequestMethod.GET)
	public String gymDetail(Locale locale, Model model, @RequestParam("id")int id) throws Exception{
		HomeDTO dto = Homeservice.view(id);
		List reviewList = Reviewservice.gymReviewList(id);
		model.addAttribute("view", dto);
		model.addAttribute("reivewList", reviewList);
		return "guest/gymDetail";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List list = Homeservice.search(request.getParameter("keyword"));
		model.addAttribute("search", list);
		return "guest/search";
		
	}
	
	@RequestMapping(value="/searchGym", method=RequestMethod.GET)
	public String searchGym(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List list = Homeservice.searchGym(request.getParameter("gym"));
		model.addAttribute("searchGym", list);
		return "guest/search";
	}
	
	
	
	
}