package com.green.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.dto.BoardDto;
import com.green.board.mapper.BoardMapper;
import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {
	
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	// /Board/List
	@RequestMapping("/List")
	public ModelAndView list( MenuDTO menuDto ) {
		// 메뉴 전체 목록 조회 - menus.jsp
		
		List<MenuDTO> menuList = menuMapper.getMenuList();
		log.info("menusList:" + menuList); // 위에 Slf4j 덕분에 쓸 수 있는거임 log다음에 .을 찍으면 어떤 것을 쓸 수 있는지 볼 수 있음
		
		
		// 게시물 목록 조회 - list.jsp
		List<BoardDto> boardList = boardMapper.getBoardList( menuDto );
		log.info("boardList:" + boardList); // 위에 Slf4j 덕분에 쓸 수 있는거임 log다음에 .을 찍으면 어떤 것을 쓸 수 있는지 볼 수 있음
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		return mv;
	}
	@RequestMapping("/Delete")
	public ModelAndView delete( BoardDto boardDto ) {
		
		System.out.println("boardDto : " + boardDto );
		
		boardMapper.deleteBoard( boardDto );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List");
		return mv;
	}
	// /Board/View?idx=1
	@RequestMapping("/View")
	public ModelAndView view( BoardDto boardDto ) {
		
		// 메뉴 목록 조회
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// idx 글의 조회수를 1 증가
		boardMapper.incHit( boardDto );
		
		// idx 로 조회한 게시글
		BoardDto board = boardMapper.getBoard( boardDto );
		System.out.println( "board:" + board );
		// board:BoardDto [idx=1, menu_=null, title=JAVA Hello, writer=JAVA, regdate=2026-05-04 15:24:06, hit=0]
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("menuList", menuList);
		mv.addObject( "board", board );
		return mv;
	}

}












