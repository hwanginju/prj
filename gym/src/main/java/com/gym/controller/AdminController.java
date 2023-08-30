package com.gym.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gym.dto.HomeDTO;
import com.gym.dto.IncomeDTO;
import com.gym.dto.MemberDTO;
import com.gym.dto.ReviewDTO;
import com.gym.service.HomeService;
import com.gym.service.MemberService;
import com.gym.service.ResvService;
import com.gym.service.ReviewService;
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Inject
	MemberService memberService;
	@Inject
	HomeService homeService;
	@Inject
	ResvService resvService;
	@Inject
	ReviewService reviewService;
	
	@ResponseBody
	@RequestMapping(value="reviewList", produces = "application/json; charset=utf8", method= RequestMethod.POST)
	public List reviewList(@RequestParam("id")int gym_id) {
		List reviewList = reviewService.gymReviewList(gym_id);
		return reviewList;
	}
	
	
	@RequestMapping("hostList")
	public String hostList(Locale locale, Model model) throws Exception {
		List hostList = memberService.AllHostUserInfo();
		List hostList_reject = memberService.AllHostUserInfo_reject();
		List hostList_wait = memberService.AllHostUserInfo_wait();
		model.addAttribute("hostList_wait",hostList_wait);
		model.addAttribute("hostList_reject",hostList_reject);
		model.addAttribute("hostList",hostList);
		return "admin/hostList";
	}
	
	@RequestMapping("guestList")
	public String guestList(Locale locale, Model model) throws Exception {
		List guestList = memberService.AllGuestUserInfo();
		model.addAttribute("guestList",guestList);
		return "admin/guestList";
	}
	
	@RequestMapping(value="guestInfo", method = RequestMethod.GET)
	public String guestInfo(Locale locale, Model model, MemberDTO dto, @RequestParam("id")int id) throws Exception{
		dto = memberService.hostInfo(id);
		model.addAttribute("guestInfo",dto);
		return "admin/guest_info";
	}
	
	@RequestMapping(value="hostInfo", method = RequestMethod.GET)
	public String hostInfo(Locale locale, Model model, MemberDTO dto, @RequestParam("id")int id) throws Exception{
		dto = memberService.hostInfo(id);
		model.addAttribute("hostInfo",dto);
		return "admin/host_info";
	}
	
	@RequestMapping("gymList")
	public String gymList(Locale locale, Model model) throws Exception{
	    List list = homeService.gymList();
	    model.addAttribute("list", list);
	    return "admin/gymList";
	}
	
	@RequestMapping("gymDetail")
	public String gymDetail(Locale locale,HomeDTO dto, Model model, HttpServletRequest request) throws Exception{
	    dto.setId(Integer.parseInt((String)request.getParameter("gym_id")));
	    dto = homeService.view(dto.getId());
	    model.addAttribute("host_gym", dto);
	    return "admin/gymDetail";
	}
	
	@RequestMapping(value="fee", method=RequestMethod.GET)
	public String adminfee(Locale locale, Model model, IncomeDTO dto, @RequestParam("incomeY") String incomeY, HttpServletRequest request) throws Exception{
	   List list = resvService.fee(incomeY);
	   List feeList = resvService.feeList(incomeY);
	   List feeYear = resvService.feeYear();
	      
	   model.addAttribute("feeList", feeList);
	   model.addAttribute("feeYear", feeYear);
	   model.addAttribute("list", list);
	   return "admin/fee";
	}
	
	@ResponseBody
	@RequestMapping(value="hostInfoEdit", method=RequestMethod.POST)
	public String hostInfoEdit(MemberDTO dto) throws Exception{
		if(memberService.hostInfoEdit(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
}
