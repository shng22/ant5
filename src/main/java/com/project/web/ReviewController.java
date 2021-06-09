package com.project.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.ReviewDTO;
import com.project.service.CommentService;
import com.project.util.CommandMap;

@Controller
public class ReviewController {

	@Autowired
	private CommentService commentService;

	@PostMapping(value = "/comment")
	public String comment(CommandMap map, HttpServletRequest request) {

		HttpSession session = request.getSession();
		System.out.println("a:::::" + session.getAttribute("nickname"));
		if (session.getAttribute("name") != null && session.getAttribute("no") != null) {
			if (map.containsKey("no") && map.containsKey("comment")) {
				map.put("member_no", session.getAttribute("no"));
				map.put("member_nickname", session.getAttribute("nickname"));
				commentService.commentsInsert(map.getMap());

				return "redirect:/detail?no=" + map.get("no");

			} else {
				return "redirect:/main";
			}
		} else {
			return "./login?error=login";
		}
	}

	@GetMapping(value = "cdel")
	public String cdel(CommandMap map, HttpServletRequest request) {
		if (map.containsKey("bno") && map.containsKey("rno")) {
			HttpSession session = request.getSession();
			if (session.getAttribute("name") != null && session.getAttribute("no") != null) {
				map.put("no", session.getAttribute("no"));
				System.out.println(map.get("no"));
				commentService.cdel(map.getMap());
				return "redirect:/detail?no=" + map.get("bno");
			} else {
				return "/login?error=login";
			}
		} else {
			return "redirect:/main";
		}
	}

	@GetMapping(value = "/cupdate")
	public ModelAndView update(ReviewDTO dto, CommandMap map, HttpServletRequest request) {
		System.out.println(request.getParameter("bno"));
		System.out.println(request.getParameter("rno"));
		ModelAndView mv = new ModelAndView("cupdate");

		map.put("bno", request.getParameter("bno"));
		map.put("rno", request.getParameter("rno"));
		dto = commentService.get(map.getMap());

		mv.addObject("dto", dto);

		return mv;
	}

	@PostMapping(value = "cupdate")
	public String update(CommandMap map, HttpServletRequest request) {
		System.out.println("넘어왔어요");
		map.put("r_content", request.getParameter("r_content"));
		map.put("bno", request.getParameter("bno"));
		map.put("rno", request.getParameter("rno"));

		commentService.update(map.getMap());

		return "redirect:/detail?no=" + map.get("bno");

	}

}
