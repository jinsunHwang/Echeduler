package org.jjbro.mapper;

import java.util.Date;

import org.jjbro.domain.CalVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CalMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CalMapper mapper;
	Date today= new Date();
	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(board ->log.info(board));
		
	}
	
	@Test
	public void testinsert() {
		CalVO board = new CalVO();
		board.setTitle("test일정");
		board.setContent("testtesttest");
		
		board.setStart_day("2019-06-10");

		board.setStart_time("19:08");
		board.setEnd_time("20:10");


		mapper.insert(board);
	}
	

	@Test
	public void testInsertSelectKey() {
		CalVO board = new CalVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");


		board.setStart_time("19:08");
		board.setEnd_time("20:10");
		board.setStart_day("2019-06-10");

		mapper.insertSelectKey(board);
		
		log.info(board);
	}
	
	@Test
	public void testUpdate() {
		CalVO board = new CalVO();
		board.setTitle("수정");
		board.setBno(3L);
		board.setContent("수정");
		board.setStart_time("01:00");
		board.setEnd_time("13:00");
		int count = mapper.update(board);
		log.info(count);
	}
	
}
