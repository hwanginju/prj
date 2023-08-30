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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gym.dto.HomeDTO;
import com.gym.dto.IncomeDTO;
import com.gym.dto.MemberDTO;
import com.gym.service.HomeService;
import com.gym.service.MemberService;
import com.gym.service.ResvService;
import com.gym.service.ReviewService;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
@RequestMapping(value = "/host")
public class HostController {
	
	@Inject
	HomeService Homeservice;
	@Inject
	ReviewService Reviewservice;
	@Inject
	MemberService Memberservice;
	@Inject
	ResvService Resvservice;
	
	@RequestMapping(value="host_gym", method=RequestMethod.GET)
	public String host_gym(Locale locale, Model model,HttpSession session,@RequestParam("gym_id") int id, HomeDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDTO hostDto = Memberservice.hostInfo((int)session.getAttribute("id"));
		dto.setId(id);
		HomeDTO gymDetail = Homeservice.host_gym(dto);
		model.addAttribute("host_gym", gymDetail);
		model.addAttribute("hostState", hostDto.getState());
		return "host/host_gym";
	}
	
	@RequestMapping(value="gymInsert")
	public String gymInsert(Locale locale, HttpSession session, Model model) {
		MemberDTO hostDto = Memberservice.hostInfo((int)session.getAttribute("id"));
		model.addAttribute("hostState", hostDto.getState());
		return "host/host_gym_insert";
	}
	
	@ResponseBody
	@RequestMapping(value="host_gym_insert", method=RequestMethod.POST)
	public void host_gym_insert(Locale locale, @RequestParam("upfile") MultipartFile upfile, Model model, HomeDTO dto, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		dto.setHost_user_id((int)session.getAttribute("id"));
		String fileRealName = upfile.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = upfile.getSize(); //파일 사이즈
		
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = request.getSession().getServletContext().getRealPath("resources/image_gym");
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		
		File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension);  // 적용 후
		
		System.out.println(saveFile + "생성된 고유문자열" + uniqueName + "/ 확장자명" + fileExtension);
		
		try {
			upfile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		dto.setImg(uniqueName + fileExtension);
		
		if(Homeservice.host_gym_insert(dto) == 1) {
			response.setHeader("Content-Type", "text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록이 완료되었습니다.'); location.href = '/host/mygymList'</script> ");
			out.flush();
		}else {
			response.setHeader("Content-Type", "text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록에 실패했습니다.'); location.href = '/host/gymInsert'</script> ");
			out.flush();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="host_gym_update", method=RequestMethod.POST)
	public void host_gym_update(Locale locale, Model model, HttpServletRequest request, HomeDTO dto, HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		if(Homeservice.host_gym_update(dto) == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정이 완료되었습니다.'); location.href = document.referrer;</script> ");
			out.flush();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정에 실패했습니다.'); location.href = document.referrer;</script> ");
			out.flush();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="host_gymImg_update", method=RequestMethod.POST)
	public void host_gymImg_update(Locale locale, Model model,@RequestParam("oldImg") String oldImg, @RequestParam("upfile") MultipartFile upfile, HttpServletRequest request, HomeDTO dto, HttpServletResponse response) throws Exception{
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		System.out.println(upfile);
		if(upfile != null) {
			if(oldImg != null) {
				String path = request.getSession().getServletContext().getRealPath("resources/image_gym");
				String fullPath = path+"/"+oldImg;
				File delFile = new File(fullPath);
				if(delFile.isFile()) {
					delFile.delete();
				}
			}
			String fileRealName = upfile.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
			long size = upfile.getSize(); //파일 사이즈
			
			System.out.println("파일명 : "  + fileRealName);
			System.out.println("용량크기(byte) : " + size);
			//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = request.getSession().getServletContext().getRealPath("resources/image_gym");
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension);  // 적용 후
			
			System.out.println(saveFile + "생성된 고유문자열" + uniqueName + "/ 확장자명" + fileExtension);
			
			try {
				upfile.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			dto.setImg(uniqueName + fileExtension);
		}else {
			dto.setImg(oldImg);
		}
		if(Homeservice.host_gymImg_update(dto) == 1) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정이 완료되었습니다.'); location.href = document.referrer;</script> ");
			out.flush();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('수정에 실패했습니다.'); location.href = document.referrer;</script> ");
			out.flush();
		}
	}
	
	@ResponseBody
	@RequestMapping(value="host_gym_delete", method = RequestMethod.POST)
	public String host_gym_delete(Locale locale, Model model, HomeDTO dto, @RequestParam("oldImg")String oldImg,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		  if(oldImg != null) { 
			  String path = request.getSession().getServletContext().getRealPath("resources/image_gym");
			  String fullPath = path+"/"+oldImg; File delFile = new File(fullPath);
			  if(delFile.isFile()) { delFile.delete(); 
			  } 
			} //왜 주석 되어있었지?
		
		 
		if(Homeservice.host_gym_delete(dto) == 1) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@RequestMapping(value="hostresvList", method = RequestMethod.GET)
	public String hostresvList(Locale locale, Model model,HttpSession session)throws Exception{
	   //호스트의 예약 목록을 가져와서 리스트에 저장
	   List list = Resvservice.hostresvList((int)session.getAttribute("id"));
	   List gymList = Homeservice.mygymList((int)session.getAttribute("id"));
	   //모델에 예약 목록을 추가하여 뷰로 전달
	   model.addAttribute("list", list);
	   model.addAttribute("gymList",gymList);
	   return "resv/host_resvList";
	}
	
	@RequestMapping(value="hostIncome", method=RequestMethod.GET)
	public String hostIncome(Locale locale, Model model,@RequestParam("incomeY") String incomeY, HttpSession session, HttpServletRequest request, IncomeDTO dto) throws Exception {
		int userId = (int)session.getAttribute("id");
		System.out.println(userId);
		dto.setHost_id(userId);
		dto.setIncomeY(incomeY);
		List IncomeYears = Resvservice.hostIncome_years(userId);
		List Income = Resvservice.hostIncome(dto);
		
		model.addAttribute("income",Income);
		model.addAttribute("incomeYears",IncomeYears);
		return "host/host_income";
	}
	
	@RequestMapping(value="mygymList", method=RequestMethod.GET)
	public String gymList(Locale locale, Model model, HttpSession session) throws Exception{
	   List list = Homeservice.mygymList((int)session.getAttribute("id"));
	   model.addAttribute("list", list);
	   return "host/mygymList";
	}
	
}
