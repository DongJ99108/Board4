package com.green.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.user.dto.UserDto;
import com.green.user.mapper.UserMapper;

import jakarta.servlet.http.HttpSession;




@Controller
@RequestMapping("/Users")
public class UserController {
	
	@Autowired
	private UserMapper userMapper;
	
	// /Users/WriteForm()
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/write");
		mv.addObject("msg", "동자이");
		
		return mv;
	}
	
	@RequestMapping("/Write")
	public ModelAndView write( UserDto userDto ) {
		System.out.println("UserController write() userDto:" + userDto);
		
		// 넘어온 data 로 DB에 저장
		userMapper.insertUser( userDto );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		
		return mv;
	}
	
	// /Users/List
	@RequestMapping("/List")
	public ModelAndView list() {
		
		// DB 에서 사용자 목록을 조회
		List<UserDto> userList = userMapper.getUserList();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/list");
		mv.addObject("userList", userList);
		
		return mv;
	}
	// /Users/Delete
	@RequestMapping("/Delete")
	public ModelAndView delete( UserDto userDto ) {
		
		// 넘겨받은 자료를 출력
		System.out.println( "userDto2:" + userDto );
		
		// DB 의 자료를 삭제
		userMapper.deleteUser( userDto );
		
		// 목록으로 이동
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
		
	}
	
	// http://localhost:8080/Users/UpdateForm?userid=sea
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm( UserDto userDto) {
		
		// 넘어온 userDto 정보
		System.out.println("넘어온 userDto : " + userDto );
		
		// 수정을 위해 DB에서 조회한 정보
		UserDto user = userMapper.getUser( userDto );
		System.out.println("조회된 userDto : " + user);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/update"); // update.jsp 로 가자
		mv.addObject("user", user);
		
		return mv;
	}
	
	// Controller 에서 Map 으로 인자를 받을때는 반드시 @RequestParam을 사용해야 함
	@RequestMapping("/Update")
	public ModelAndView update( @RequestParam Map<String, Object> map ) {
		System.out.println("map : " + map);
		userMapper.updateUser2( map ); 
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
	}
	
	/*
	@RequestMapping("/Update")
	// 20260506 update.jsp에서 oldpwd를 받아서 처리해야하는데 userDto에는 그게 없다. 그래서 oldpwd를 받기 위해서는 String oldpwd를 새로 적는 것
	public ModelAndView update( UserDto userDto, String oldpwd ) {
		
		userMapper.updateUser(userDto, oldpwd);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Users/List");
		return mv;
		
	}
	*/
	
	// 아이디 중복확인 - 결과문자열을 리턴 : 
	// <b class="green">사용가능한 아이디입니다</b>
	// <b class="red">사용할 수 없는 아이디입니다</b>
	// /Users/IdDupCheck2?userid=sky
	@GetMapping("/IdDupCheck2")
	@ResponseBody // return 되는 글자는 jsp 가 아니다
	public UserDto idDupCheck2( UserDto userDto ) {
		
		// String  userid    = userDto.getUserid();                   // 넘어온 userid
		UserDto user      = userMapper.getIdDupCheck( userDto );   // 조회한 userid
		if( user == null )
			user = new UserDto();
		return user;
		
	}
	// /Users/DupCheckWindow
	@GetMapping("/DupCheckWindow")
	public ModelAndView dupCheckWindow( boolean first, HttpSession session ) {
		
		ModelAndView mv = new ModelAndView();
		 // ?first=true 활용방법
		/*
		if( first )
			mv.addObject( "first", first );
		*/
	    session.setAttribute("first", "true");
		mv.setViewName("users/idcheck");
		return mv;
	}
	
	// 중복확인
	// /Users/DupCheck?userid=aaa
	@RequestMapping("/DupCheck")
	public ModelAndView dupCheck(UserDto userDto, HttpSession session) {
		
		session.setAttribute("first", "true");
		UserDto user = userMapper.getUser(userDto);
		String  msg  = "<b class='red'>사용할 수 없는 아이디입니다.</b>";
		if( user == null ) {
			msg = "<b class='green'>사용 가능한 아이디입니다.</b>";
		};
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users/idcheck");
		mv.addObject("msg", msg);
		return mv;
	}
	
	

}














