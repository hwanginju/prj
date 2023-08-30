package com.gym.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.dao.ResvDAO;
import com.gym.dto.HomeDTO;
import com.gym.dto.IncomeDTO;
import com.gym.dto.ResvDTO;

@Repository
public class ResvDAOImpl implements ResvDAO {
   
   @Inject
   private SqlSession sqlSession;

   private static String namespace = "mapper.resv";
   
   @Override
   public List list(int id) throws Exception {
      return sqlSession.selectList(namespace + ".resvList", id);
   }

   @Override
   public int resvInsert(ResvDTO dto) {
      return sqlSession.insert(namespace + ".resvInsert", dto);
   }

   @Override
   public int resvCancel(int id) {
      return sqlSession.update(namespace+".resvCancel", id);
   }

	@Override
	public int resv_dateChk(ResvDTO dto) {
		return sqlSession.selectOne(namespace+".resv_dateChk", dto);
	}
	
	public List hostIncome(IncomeDTO dto) {
		return sqlSession.selectList(namespace+".hostIncome", dto);
	}

	@Override
	public List hostIncome_years(int userId) {
		return sqlSession.selectList(namespace+".hostIncome_years", userId);
	}

	@Override
	public List hostresvList(int hid) {
	   return sqlSession.selectList(namespace+ ".hostresvList", hid);
	}

	@Override
	   public List fee(String incomeY) {
	      return sqlSession.selectList(namespace+".fee", incomeY);
	   }

	   @Override
	   public List feeList(String incomeY) {
	      return sqlSession.selectList(namespace+".feeList", incomeY);
	   }

	   @Override
	   public List feeYear() {
	      return sqlSession.selectList(namespace+".fee_years");
	   }

	@Override
	public List resv_timeChk(ResvDTO dto) {
		return sqlSession.selectList(namespace+".resv_timeChk", dto);
	}
	
	

}