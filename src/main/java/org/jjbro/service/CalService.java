package org.jjbro.service;

import java.util.List;

import org.jjbro.domain.CalVO;

public interface CalService {

	public void register(CalVO board);
	
	public CalVO get(Long bno);
	
	public boolean modify(CalVO board);
	
	public boolean remove(Long bno);
	
	public List<CalVO> getList();
	
	public List<CalVO> readDay(String start_day);
	
	
}
