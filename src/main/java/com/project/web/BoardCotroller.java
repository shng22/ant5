package com.project.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.BoardDTO;
import com.project.dto.Search;
import com.project.service.BoardService;
import com.project.service.CommentService;
import com.project.service.LoginService;
import com.project.util.CommandMap;
import com.project.util.FileSave;

@Controller
public class BoardCotroller {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private FileSave fileSave;

	@GetMapping(value = "/detail")
	public ModelAndView detail(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("detail");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		ArrayList<HashMap<String, Object>> list = boardService.list(map.getMap());

		boardService.views(no);

		HashMap<String, Object> dto = boardService.detail(no);
		mv.addObject("dto", dto);

		ArrayList<HashMap<String, Object>> comment = commentService.detail(no);

		System.out.println(comment);

		mv.addObject("list", list);
		mv.addObject("bno", no);
		mv.addObject("comment", comment);
		return mv;
	}

	@GetMapping(value = "write")
	public String write() {
		return "write";
	}

	@RequestMapping(value = "/write")
	public String write(HttpServletRequest request, MultipartFile file) {

		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("actor"));
		System.out.println(request.getParameter("type"));

		BoardDTO dto = new BoardDTO();
		dto.setMember_no(1);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setActor(request.getParameter("actor"));
		dto.setGenre(request.getParameter("genre"));
		dto.setGrade(request.getParameter("grade"));
		dto.setRundate(request.getParameter("rundate"));
		dto.setRuntime(request.getParameter("runtime"));
		dto.setType(request.getParameter("type"));

		String realPath = servletContext.getRealPath("resources/");
		System.out.println(realPath);

		String realFileName = fileSave.save(realPath + "upload", file);
		System.out.println(realFileName);
		dto.setFile(realFileName);

		boardService.write(dto);

		return "redirect:/u";
	}

	@GetMapping(value = "/u")
	public ModelAndView list(CommandMap map, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("uboard");
		ArrayList<HashMap<String, Object>> list = boardService.list(map.getMap());
		mv.addObject("list", list);
		mv.addObject("totalCount", list.get(0).get("count"));

		HttpSession session = request.getSession();

		System.out.println(session.getAttribute("member_nickname"));

		return mv;
	}

	@GetMapping(value = "/p")
	public ModelAndView list1(CommandMap map, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("pboard");
		ArrayList<HashMap<String, Object>> list = boardService.list(map.getMap());
		mv.addObject("list", list);
		mv.addObject("totalCount", list.get(0).get("count"));

		HttpSession session = request.getSession();

		System.out.println(session.getAttribute("member_nickname"));

		return mv;
	}

	@GetMapping(value = "/index")
	public String index() {
		return "index";
	}
	
	@GetMapping(value = "/NewFile")
	public String NewFile() {
		return "NewFile";
	}

	@GetMapping(value = "/update")
	public ModelAndView update(BoardDTO dto, CommandMap map, HttpServletRequest request) {
		System.out.println(request.getParameter("bno"));

		ModelAndView mv = new ModelAndView("update");
		HttpSession session = request.getSession();
		dto.setMember_no((Integer) session.getAttribute("no"));
		dto = boardService.detail(dto);

		mv.addObject("dto", dto);
		return mv;
	}

	@PostMapping(value = "update")
	public String update(CommandMap map, HttpServletRequest request) {
		System.out.println("dd");
		HttpSession session = request.getSession();
		map.put("no", session.getAttribute("no"));

		boardService.update(map.getMap());

		return "redirect:/detail?no=" + map.get("bno");

	}

	@GetMapping(value = "delete")
	public String delete(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		map.put("no", session.getAttribute("no"));

		boardService.delete(map.getMap());

		return "redirect:/u";

	}

	@GetMapping(value = "delete1")
	public ModelAndView delete1(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/master");

		String k = request.getParameter("no");

		int no = Integer.parseInt(k);

		System.out.println(no);

		boardService.detail1(no);

		return mv;
	}

	@PostMapping(value = "/search")
	public ModelAndView search(CommandMap map) {
		System.out.println("하이");
		ModelAndView mv = new ModelAndView("result");

		System.out.println(map.get("searchType"));
		System.out.println(map.get("keyword"));

		BoardDTO dto = new BoardDTO();

		dto.setTitle(map.get("keyword").toString());

		ArrayList<HashMap<String, Object>> list = boardService.getBoardList(map.getMap());
		mv.addObject("list", list);
		mv.addObject("dto", dto);
		return mv;
	}

	@GetMapping(value = "/c")
	public ModelAndView list2(CommandMap map, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("cboard");
		ArrayList<HashMap<String, Object>> list = boardService.list(map.getMap());
		mv.addObject("list", list);
		mv.addObject("totalCount", list.get(0).get("count"));

		HttpSession session = request.getSession();

		System.out.println(session.getAttribute("member_nickname"));

		return mv;
	}

}
