package org.jjbro.controller;

import org.jjbro.domain.CalVO;
import org.jjbro.service.CalService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cal/*")
@Log4j
@AllArgsConstructor
public class CalController {
	
	private CalService service;
	@GetMapping("/main_back")
	public void main_back() {
		
	}
	
	
	@GetMapping("/main")
	public void mainpage(Model model) {
		log.info("mainpage");
		model.addAttribute("main",service.getList());
	}
	
	@GetMapping("/cal")
	public void cal(@RequestParam("start_day") String start_day,Model model) {

		log.info("/cal......"+start_day);
		model.addAttribute("cal",service.readDay(start_day));
		model.addAttribute("start_day",start_day);
		
	}
	
	@GetMapping("/calregister")
	public void calregister(@RequestParam("start_day") String start_day,Model model) {
		model.addAttribute("start_day",start_day);
		log.info("calregister"+start_day);
		
		
	}
	
	@PostMapping("/calregister")
	public String calregister(CalVO board , RedirectAttributes rttr) {
		
		
		log.info("register"+board);
		System.out.println("~~~~~~~~~~~~~~"+board.getStart_day());
		
		if(board.getTitle()==null||board.getTitle().equals("")||
		   board.getContent()==null||board.getContent().equals("")||
		   board.getStart_time()==null||board.getStart_time().equals("")||
		   board.getEnd_time()==null||board.getEnd_time().equals("")

		   ) {
			return "redirect:/cal/calregister?start_day="+board.getStart_day();
		}
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/cal/cal?start_day="+board.getStart_day();
	}
	
	@GetMapping("/calmodify")
	public void calmodify(@RequestParam("bno") Long bno, Model model) {
		log.info("/get / or /modify");
		model.addAttribute("board",service.get(bno));
	}
	
	@PostMapping("/calmodify")
	public String calmodify(CalVO board, RedirectAttributes rttr) {
		log.info("modify:"+board);
		log.info("!@!#"+service.modify(board));
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/cal/cal?start_day="+board.getStart_day();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr,CalVO board) {
		log.info("remove..."+bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/cal/cal?start_day="+board.getStart_day();
	}
}
