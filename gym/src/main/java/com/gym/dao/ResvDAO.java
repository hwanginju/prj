package com.gym.dao;

import java.util.List;

import com.gym.dto.HomeDTO;
import com.gym.dto.IncomeDTO;
import com.gym.dto.ResvDTO;

public interface ResvDAO {

   public List list(int id) throws Exception;

   public int resvInsert(ResvDTO dto);

   public int resvCancel(int id);

public int resv_dateChk(ResvDTO dto);


public List hostIncome(IncomeDTO dto);

public List hostIncome_years(int userId);

public List hostresvList(int hid);

public List fee(String incomeY);

public List feeList(String incomeY);

public List feeYear();

public List resv_timeChk(ResvDTO dto);
   

}