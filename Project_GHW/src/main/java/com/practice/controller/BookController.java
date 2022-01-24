package com.practice.controller;

import org.practice.domain.BookVO;
import org.practice.service.BookService;
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
@Log4j
@RequestMapping("/book/*")
@AllArgsConstructor
public class BookController {
	private BookService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register(){
		
	}
	
	@PostMapping("/register")	//게시글 저장
	public String register(BookVO board, RedirectAttributes rttr) {
		log.info("register:"+ board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBookid());
		return "redirect:/book/list";
	}
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bookid") int bookid, Model model) {
		log.info("/get or modify");
		model.addAttribute("book",service.get(bookid));
	}
	@PostMapping("/modify")
	public String get(BookVO board, RedirectAttributes rttr) {
		log.info("modify:"+ board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/book/list";
	}
	@PostMapping("/remove")
	public String remove(@RequestParam("bookid") int bookid, RedirectAttributes rttr) {
		log.info("remove........"+bookid);
		if(service.remove(bookid)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/book/list";
	}
}
