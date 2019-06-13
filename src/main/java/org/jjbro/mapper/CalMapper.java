package org.jjbro.mapper;

import java.util.List;

import org.jjbro.domain.CalVO;

public interface CalMapper {

	public List<CalVO> getList();
	
	public void insert(CalVO board);
	
	public void insertSelectKey(CalVO board);
	
	public CalVO read(Long bno);
	
	public List<CalVO> readDay(String start_day);
	
	public int delete(Long bno);
	
	public int update(CalVO board);
	
	
	
}
