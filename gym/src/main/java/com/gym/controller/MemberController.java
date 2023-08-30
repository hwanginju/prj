package com.gym.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gym.dto.MemberDTO;
import com.gym.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	
	//Controller에서 서비스에 있는 객체를 사용하기 위해 memberService에 의존성 주입
	//inject 어노테이션은 memberService 빈을 가져와서 해당 객체로 주입해주는 방식 
	@Inject
	private MemberService memberService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	//메인 게스트 홈 화면으로 이동(최초접속을 여기로 할 수 있게끔)
	//다른페이지 들어갈수 있게끔 하려면 ModelAndView("여기에 경로 수정");
	
	//게스트 로그인 화면
	@RequestMapping("guestLogin.do")
	public ModelAndView guestLogin() {
		ModelAndView mav = new ModelAndView("login/guest_login");
		return mav;
	}
	
	//호스트 로그인 화면
	@RequestMapping("hostLogin.do")
	public ModelAndView hostLogin() {
		ModelAndView mav = new ModelAndView("login/host_login");
		return mav;
	}
	
	//모든 호스트유저 조회
	@ResponseBody
	@RequestMapping(value="AllHostUserInfo", method=RequestMethod.POST)
	public List AllHostUserInfo() throws Exception {
		List list = memberService.AllHostUserInfo();
		return list;
	}
	//모든 게스트유저 조회
	@ResponseBody
	@RequestMapping(value="AllGuestUserInfo", method=RequestMethod.POST)
	public List AllGuestUserInfo() throws Exception {
		List list = memberService.AllGuestUserInfo();
		return list;
	}
	
	//유저 조회
	@ResponseBody
	@RequestMapping(value="memberInfo", method=RequestMethod.POST)
	public MemberDTO memberInfo(MemberDTO dto, @RequestParam("userId") int id) throws Exception{
		dto = memberService.hostInfo(id);
		return dto;
	}
	
	//회원가입시 이메일 중복확인
	@ResponseBody
	@RequestMapping(value="emailDup", method = RequestMethod.POST)
	public MemberDTO emailDup(MemberDTO dto, @RequestParam("email") String email) {
		dto.setEmail(email);
		MemberDTO res = memberService.emailDup(email);
		return res;
	}
	
	//회원가입 타입설정 페이지
	@RequestMapping("joinOption")
	public String joinOption() {
		return "member/join_option";
	}
	
	@RequestMapping("guestJoin")
	public String guestJoin() {
		return "member/guest_join";
	}
	
	@RequestMapping("hostJoin")
	public String hostJoin() {
		return "member/host_join";
	}
	
	@ResponseBody
	@RequestMapping(value="guestJoin.do", method=RequestMethod.POST)
	public void guestJoin(MemberDTO dto,HttpServletResponse response) throws Exception {
		dto.setState(1);
		String pw = dto.getPwd();
		String secure = pwdEncoder.encode(pw);
		dto.setPwd(secure);
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(memberService.guestJoin(dto) == 1) {
			out.println("<script> location.href = '/member/guestLogin.do'; alert('회원가입이 완료되었습니다.');</script> ");
			out.flush();
		}else {
			out.println("<script>location.href = '/member/join_option; alert('회원가입에 실패했습니다.');'</script> ");
			out.flush();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="hostJoin.do",produces="application/json;charset=UTF-8", method=RequestMethod.POST)
	public void memberJoin( MemberDTO dto, @RequestParam("upfile") MultipartFile upfile, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		dto.setState(2);
		String pw = dto.getPwd();
		String secure = pwdEncoder.encode(pw);
		dto.setPwd(secure);
		if(upfile != null) {
			String fileRealName = upfile.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
			long size = upfile.getSize(); //파일 사이즈
			
			System.out.println("파일명 : "  + fileRealName);
			System.out.println("용량크기(byte) : " + size);
			//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = request.getSession().getServletContext().getRealPath("resources/image_businessReg");
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
			
			File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension);  // 적용 후
			
			System.out.println(saveFile + "생성된 고유문자열" + uniqueName + "/ 확장자명" + fileExtension);
			
			try {
				upfile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			dto.setBusinessReg(uniqueName + fileExtension);
		}
		PrintWriter out = response.getWriter();
		if(memberService.memberJoin(dto) == 1) {
			out.println("<script> location.href = '/member/guestLogin.do'; alert('회원가입이 완료되었습니다.');</script> ");
			out.flush();
		}else {
			out.println("<script>location.href = '/member/join_option; alert('회원가입에 실패했습니다.');'</script> ");
			out.flush();
		}
	}
	
	@RequestMapping("guestInfo")
	 public String guestInfo(Locale locale, Model model, HttpSession session, HttpServletResponse response) throws Exception { 
		MemberDTO dto = memberService.guestInfo((int)session.getAttribute("id"));
		model.addAttribute("guestInfo",dto);
		return "member/guest_info"; 
	 }
	
	@ResponseBody
	@RequestMapping(value="guestInfoEdit", method = RequestMethod.POST)
	public String guestInfoEdit(MemberDTO dto) throws Exception {
		if(memberService.guestInfoEdit(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@RequestMapping("hostInfo")
	public String hostInfo(Locale locale, Model model, HttpSession session) throws Exception{
		MemberDTO dto = memberService.hostInfo((int)session.getAttribute("id"));
		model.addAttribute("hostInfo", dto);
		return "member/host_info";
	}
	
	@ResponseBody
	@RequestMapping(value="hostInfoEdit", method = RequestMethod.POST)
	public String hostInfoEdit(MemberDTO dto, HttpSession session) throws Exception {
		dto.setId((int)session.getAttribute("id"));
		if(memberService.hostInfoEdit(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="memberPwdEdit", method=RequestMethod.POST)
	public String memberPwdEdit(MemberDTO dto) throws Exception{
		String pw = dto.getPwd();
		String secure = pwdEncoder.encode(pw);
		dto.setPwd(secure);
		if(memberService.memberPwdEdit(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@RequestMapping("login_check.do")
	public void login_check(Model model, MemberDTO dto, HttpSession session, HttpServletResponse response, 
			@RequestParam("userid") String userId, @RequestParam("passwd") String passwd) throws Exception {
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		dto.setEmail(userId);
		MemberDTO data = memberService.loginCheck(dto, session);
		
		
		System.out.println("userdata::"+data);
		PrintWriter out = response.getWriter();
		if(data != null) {
			boolean pwdMatch = pwdEncoder.matches(passwd, data.getPwd());
			if(pwdMatch == true) {
				
				session.setAttribute("email", data.getEmail());
				session.setAttribute("auth", data.getAuth());
				session.setAttribute("id", data.getId());
				
				String auth = data.getAuth();
				//최고관리자
				if(auth.equals("E100")) {
					out.println("<script>location.href = '/admin/guestList';</script> ");
					out.flush();
				}else if(auth.equals("E200")) {
					out.println("<script>location.href = '/member/hostInfo';</script>");
					out.flush();
				}else if(auth.equals("E300")) {
					out.println("<script>location.href = '/';</script>");
					out.flush();
				}
			}else {
				out.println("<script>location.href = '/member/guestLogin.do'; alert('비밀번호를 확인해주세요.');</script>");
				out.flush();
			}
			
		}else {
			out.println("<script>location.href = '/member/guestLogin.do'; alert('아이디/비밀번호를 확인해주세요.');</script>");
			out.flush();
		}
	}
	 
	
	//로그아웃
	@RequestMapping("logout.do")
	public void logout(HttpSession session, HttpServletResponse response)throws IOException {
		//세션 끊기
		session.invalidate();
		response.getWriter().println("<script>location.href = '/';</script>");
	}
	
	
	//회원탈퇴
	   @ResponseBody
	   @RequestMapping(value="member_delete", method = RequestMethod.POST)
	   public String guest_delete(Locale locale, Model model, MemberDTO dto, HttpSession session) throws Exception{
	      
	      if(memberService.member_delete(dto) ==1) {
	    	  session.invalidate();
	    	  return "Y";
	      }else {
	    	  return "N";
	      }
	   }
	   
	 @ResponseBody
	 @RequestMapping(value="hostStateEdit", method=RequestMethod.POST)
	 public String hostStateEdit(MemberDTO dto) throws Exception{
		 
		 if(memberService.hostStateEdit(dto) == 1) {
			 return "Y";
		 }else {
			 return "N";
		 }
	 }

	
	
	
}