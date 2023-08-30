package com.gym.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gym.dao.ResvDAO;
import com.gym.dto.HomeDTO;
import com.gym.dto.IncomeDTO;
import com.gym.dto.ResvDTO;
import com.gym.service.ResvService;

@Service
public class ResvServiceImpl implements ResvService{
   
   @Inject
   private ResvDAO resvdao;

   @Override
   public List list(int id) throws Exception{
      return resvdao.list(id);
   }

   @Override
   public int resvInsert(ResvDTO dto) {
      return resvdao.resvInsert(dto);
   }

   @Override
   public int resvCancel(int id) {
      return resvdao.resvCancel(id);
   }

	@Override
	public int resv_dateChk(ResvDTO dto) {
		return resvdao.resv_dateChk(dto);
	}
	
	
	@Override
	public List hostIncome(IncomeDTO dto) {
		return resvdao.hostIncome(dto);
	}
	
	@Override
	public List hostIncome_years(int userId) {
		return resvdao.hostIncome_years(userId);
	}

	@Override
	 public List hostresvList(int hid) {
	    return resvdao.hostresvList(hid);
	 }
	
	@Override
	   public List fee(String incomeY) {
	      return resvdao.fee(incomeY);
	   }

	   @Override
	   public List feeList(String incomeY) {
	      return resvdao.feeList(incomeY);
	   }

	   @Override
	   public List feeYear() {
	      return resvdao.feeYear();
	   }

	@Override
	public List resv_timeChk(ResvDTO dto) {
		return resvdao.resv_timeChk(dto);
	}

	
}