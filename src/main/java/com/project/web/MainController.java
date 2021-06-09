package com.project.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDTO;
import com.project.service.BoardService;
import com.project.service.LoginService;
import com.project.util.CommandMap;

@Controller
public class MainController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private LoginService loginService;

	@GetMapping(value = "/")
	public String index() {
		return "index";
	}

	@GetMapping(value = "/main")
	public ModelAndView main(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ArrayList<HashMap<String, Object>> list2 = boardService.list2(map.getMap());
		ArrayList<HashMap<String, Object>> list3 = boardService.list3(map.getMap());
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		return mv;
	}

	@GetMapping(value = "/master")
	public ModelAndView master(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("master");
		List<Object> list = loginService.detail();
		list.toArray();
		mv.addObject("list", list);
		System.out.println(list);
		return mv;
	}

	@PostMapping(value = "/changegrade")
	public ModelAndView changegrade(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/master");
		System.out.println(map.getMap());
		return mv;
	}

}
