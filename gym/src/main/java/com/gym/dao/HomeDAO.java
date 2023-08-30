package com.gym.dao;

import java.util.List;
import com.gym.dto.HomeDTO;
import com.gym.dto.MemberDTO;

public interface HomeDAO {

	public List list() throws Exception;

	HomeDTO view(int id);

	public List search(String keyword)throws Exception;

	public List searchGym(String gym)throws Exception;

	public HomeDTO host_gym(HomeDTO dto);

	public int host_gym_insert(HomeDTO dto) throws Exception;

	public int host_gym_update(HomeDTO dto) throws Exception;

	public int host_gym_delete(HomeDTO dto) throws Exception;

	public int host_gymImg_update(HomeDTO dto) throws Exception;

	public List gymList();

	public List mygymList(int id);



}
