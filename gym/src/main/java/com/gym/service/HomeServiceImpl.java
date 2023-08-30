package com.gym.service;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.gym.dao.HomeDAO;
import com.gym.dto.HomeDTO;

@Service
public class HomeServiceImpl implements HomeService{
	@Inject
	private HomeDAO dao;
	
	@Override
	public List list() throws Exception {
		return dao.list();
	}
	
	@Override
	public HomeDTO view(int id) {
		dao.view(id);
		return dao.view(id);
	}

	@Override
	public List search(String keyword) throws Exception {
		return dao.search(keyword);
	}

	@Override
	public List searchGym(String gym) throws Exception {
		return dao.searchGym(gym);
	}

	@Override
	public HomeDTO host_gym(HomeDTO dto) {
		return dao.host_gym(dto);
	}

	@Override
	public int host_gym_insert(HomeDTO dto) throws Exception {
		return dao.host_gym_insert(dto);
	}

	@Override
	public int host_gym_update(HomeDTO dto) throws Exception {
		return dao.host_gym_update(dto);
	}

	@Override
	public int host_gym_delete(HomeDTO dto) throws Exception {
		return dao.host_gym_delete(dto);
	}

	@Override
	public int host_gymImg_update(HomeDTO dto) throws Exception {
		return dao.host_gymImg_update(dto);
	}

	@Override
	public List gymList() {
		return dao.gymList();
	}

	@Override
	public List mygymList(int id) {
		return dao.mygymList(id);
	}





}
