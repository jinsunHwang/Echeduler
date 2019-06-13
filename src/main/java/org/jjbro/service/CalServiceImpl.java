package org.jjbro.service;

import java.util.List;

import org.jjbro.domain.CalVO;
import org.jjbro.mapper.CalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class CalServiceImpl implements CalService {

	@Setter(onMethod_ = @Autowired)
	private CalMapper mapper;
	
	
	@Override
	public void register(CalVO board) {
		// TODO Auto-generated method stub
		log.info("register..."+board);
		
		mapper.insertSelectKey(board);
	
	}
	
	@Override
	public CalVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("get..."+bno);
		
		return mapper.read(bno);
	}

	@Override
	public boolean modify(CalVO board) {
		// TODO Auto-generated method stub
		log.info("modify..."+board);
		
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("remove..."+bno);
				
		return mapper.delete(bno)==1;
	}

	@Override
	public List<CalVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList......");
		
		return mapper.getList();
	}

	@Override
	public List<CalVO> readDay(String start_day) {
		// TODO Auto-generated method stub
		log.info("get..."+start_day);
		
		return mapper.readDay(start_day);
	}



}
