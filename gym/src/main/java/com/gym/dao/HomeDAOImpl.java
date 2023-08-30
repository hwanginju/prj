package com.gym.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.dto.HomeDTO;

@Repository
public class HomeDAOImpl implements HomeDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mapper.home";
	@Override
	public List list() throws Exception {
		return sqlSession.selectList(namespace + ".list");
	}
	
	@Override
	public HomeDTO view(int id) {
		return sqlSession.selectOne(namespace+".view", id);
	}

	@Override
	public List search(String keyword) throws Exception {
		return sqlSession.selectList(namespace+".search", keyword);
	}

	@Override
	public List searchGym(String gym) throws Exception {
		return sqlSession.selectList(namespace+".searchGym", gym);
	}

	@Override
	public HomeDTO host_gym(HomeDTO dto) {
		return sqlSession.selectOne(namespace+".host_gym", dto);
	}


	@Override
	public int host_gym_insert(HomeDTO dto) throws Exception{
		return sqlSession.insert(namespace + ".host_gym_insert", dto);
	}

	@Override
	public int host_gym_update(HomeDTO dto) throws Exception{
		return sqlSession.update(namespace+".host_gym_update", dto);
	}

	@Override
	public int host_gym_delete(HomeDTO dto) throws Exception{
		return sqlSession.update(namespace+".host_gym_delete", dto);
	}

	@Override
	public int host_gymImg_update(HomeDTO dto) throws Exception {
		return sqlSession.update(namespace+".host_gymImg_update", dto);
	}

	@Override
	public List gymList() {
		return sqlSession.selectList(namespace+".gymList");
	}

	@Override
	public List mygymList(int id) {
		return sqlSession.selectList(namespace+".mygymList", id);
	}





}
