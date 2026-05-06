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
		// 메뉴 전체 목록 조회
		
		List<MenuDTO> menuList = menuMapper.getMenuList();
		log.info("menusList:" + menuList); // 위에 Slf4j 덕분에 쓸 수 있는거임 log다음에 .을 찍으면 어떤 것을 쓸 수 있는지 볼 수 있음
		
		
		// 게시물 목록 조회
		List<BoardDto> boardList = boardMapper.getBoardList( menuDto );
		log.info("boardList:" + boardList); // 위에 Slf4j 덕분에 쓸 수 있는거임 log다음에 .을 찍으면 어떤 것을 쓸 수 있는지 볼 수 있음
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("boardList", boardList);
		mv.addObject("menuList", menuList);
		return mv;
	}

}












