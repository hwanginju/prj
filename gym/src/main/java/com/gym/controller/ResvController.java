package com.gym.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.gym.dto.HomeDTO;
import com.gym.dto.MemberDTO;
import com.gym.dto.ResvDTO;
import com.gym.service.HomeService;
import com.gym.service.MemberService;
import com.gym.service.ResvService;

@Controller
@RequestMapping(value = "/resv")
public class ResvController {
   
   @Inject
   ResvService resvService;
   
   @Inject
   MemberService memberService;
   
   @Inject
   HomeService homeService;
   
   //게스트 예약조회
   @RequestMapping(value="resvList", method = RequestMethod.GET)
   public String list(Locale locale, Model model, HttpSession session)throws Exception{
      List list = resvService.list((int)session.getAttribute("id"));
      model.addAttribute("list", list);
      
      return "resv/guest_resvList";
   }
   
   //예약하기 화면
   @RequestMapping(value="resvDo", method = RequestMethod.GET)
   public String resvDo(Locale locale, Model model, HttpSession session, HttpServletRequest request) throws Exception{
      int gym_id = (Integer.parseInt((String)request.getParameter("gym_id")));
      //데이터 가져오기
      HomeDTO dto = homeService.view(gym_id);
      MemberDTO hostDto = memberService.hostInfo(dto.getHost_user_id());
      MemberDTO guestDto = memberService.hostInfo((int)session.getAttribute("id")); 
      
      model.addAttribute("guestInfo", guestDto);
      model.addAttribute("hostInfo", hostDto);
      model.addAttribute("view", dto);
      
      return "resv/resvDo";
   }
   
   @RequestMapping(value="resvInsert", method = RequestMethod.POST)
   public void resvInsert(Locale locale, Model model, ResvDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
      response.setHeader("Content-Type", "text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      if(resvService.resvInsert(dto) == 1) {
            out.println("<script>alert('예약되었습니다.'); location.href = '/resv/resvList'</script> ");
            out.flush();
      }else {
            out.println("<script>alert('예약에 실패했습니다.'); location.href = '/resv/resvList'</script> ");
            out.flush();
      }
   }
   
   @ResponseBody
   @RequestMapping(value = "resvCancel", method = RequestMethod.POST)
   public String resvCancel(ResvDTO dto, HttpServletResponse response, HttpServletRequest request) {
       response.setContentType("application/json;charset=UTF-8");
       int result = resvService.resvCancel(Integer.parseInt((String)request.getParameter("id")));
       if (result == 1) {
           return "Y";
       } else {
           return "N";
       }
   }
   
   @ResponseBody
   @RequestMapping(value="resv_dateChk", method = RequestMethod.POST)
   public String resv_dateChk(ResvDTO dto, @RequestParam("resv_date") String resv_date, @RequestParam("resv_time") String resv_time, HttpServletResponse response) throws Exception{
	   int res = resvService.resv_dateChk(dto);
	   if(res != 0) {
		   return "N";
	   }else {
		   return "Y";
	   }
   }
   
   @ResponseBody
   @RequestMapping(value="resv_timeChk",produces = "application/json; charset=utf8", method= RequestMethod.POST)
   public List resv_timeChk(ResvDTO dto) {
	   List resv_List = resvService.resv_timeChk(dto);
	   return resv_List;
   }

   
   
   
}