package com.project.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.dto.LoginDTO;
import com.project.service.LoginService;
import com.project.util.CommandMap;

@Controller
@SessionAttributes("login")
public class LoginController {
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request) {

		return "login";
	}

	@PostMapping(value = "/login2")
	public ModelAndView login2(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("login2");

		String email = request.getParameter("email");

		LoginDTO dto = loginService.email(email);
		if (dto == null) {
			mv.setViewName("redirect:/error?key=" + email);

		} else {
			mv.addObject("dto", dto);

		}
		// System.out.println(dto.getMember_email());
		// System.out.println(dto.getMember_name());
		return mv;
	}

	@PostMapping(value = "/login3")
	public String login3(HttpServletRequest request) {

		// ModelAndView mv = new ModelAndView("login3");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		System.out.println(request.getParameter("pw"));
		System.out.println(request.getParameter("email"));

		LoginDTO dto = new LoginDTO();
		dto.setMember_pw(pw);
		dto.setMember_email(email);
		dto = loginService.endlogin(dto);
		if (dto == null) {
			return "redirect:/error";// 비밀번호가 다르면 에러페이지로 갑니다

		} else {
			// 세션만들기
			HttpSession session = request.getSession();
			session.setAttribute("name", dto.getMember_name());
			session.setAttribute("id", dto.getMember_id());
			session.setAttribute("pw", dto.getMember_pw());
			session.setAttribute("no", dto.getMember_no());
			session.setAttribute("grade", dto.getMember_grade());
			session.setAttribute("email", dto.getMember_email());
			session.setAttribute("cp", dto.getMember_cp());
			session.setAttribute("nickname", dto.getMember_nickname());
			System.out.println(session.getAttribute("no"));
			System.out.println(session.getAttribute("name"));
			System.out.println(session.getAttribute("grade"));
			System.out.println(session.getAttribute("nickname"));
			if ((Integer) session.getAttribute("grade") == 1) {
				return "redirect:/error";
			}
			return "redirect:/main";// 비밀번호가 일치했을때 메인으로 갑니다
		}
	}

	@RequestMapping(value = "/emailch")
	public String emailch(HttpServletRequest request) {

		return "emailch";
	}

	@PostMapping(value = "/emailch2")
	public ModelAndView emailch2(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("emailch2");

		String cp = request.getParameter("cp");

		LoginDTO dto = loginService.cp(cp);
		if (dto == null) {
			mv.setViewName("redirect:/error?key=" + cp);

		} else {
			mv.addObject("dto", dto);

		}

		System.out.println(dto.getMember_name());
		return mv;
	}

	@PostMapping(value = "/emailch3")
	public ModelAndView emailch3(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/error");

		String nickname = request.getParameter("nickname");

		System.out.println(request.getParameter("nickname"));

		LoginDTO dto = new LoginDTO();

		dto.setMember_nickname(nickname);

		LoginDTO email = loginService.cp2(dto);
		System.out.println(email);
		if (email != null) {
			mv.setViewName("showemail");
			mv.addObject("email", email);
		}
		return mv;// 닉네임이 일치했을때 으로 갑니다
	}

	@RequestMapping(value = "/pwch")
	public String pwch(HttpServletRequest request) {

		return "pwch";
	}

	@PostMapping(value = "/pwch2")
	public ModelAndView pwch2(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("pwch2");

		String email = request.getParameter("email");

		LoginDTO dto = loginService.pwem(email);
		if (dto == null) {
			mv.setViewName("redirect:/error?key=" + email);

		} else {
			mv.addObject("dto", dto);

		}

		System.out.println(dto.getMember_email());
		return mv;
	}

	@GetMapping(value = "/error")
	public String error() {
		return "error";
	}

	@GetMapping(value = "/showemail")
	public String showemail() {
		return "showemail";
	}

	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("logout!!!!!!!!!!!!!!!");
		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null) {
			session.removeAttribute("email");
		}
		if (session.getAttribute("nickname") != null) {
			session.removeAttribute("nickname");
		}
		if (session.getAttribute("name") != null) {
			session.removeAttribute("name");
		}
		if (session.getAttribute("grade") != null) {
			session.removeAttribute("grade");
		}
		if (session.getAttribute("no") != null) {
			session.removeAttribute("no");
		}
		System.out.println("bb" + session.getAttribute("no"));
		return "redirect:/main";
	}

	@GetMapping(value = "/join")
	public String join() {
		return "join";
	}

	@PostMapping(value = "/join1")
	public String join1(HttpServletRequest request) {
		return "join1";
	}

	@PostMapping(value = "/join2")
	public ModelAndView join2(CommandMap map) {
		System.out.println(map.getMap());
		ModelAndView mv = new ModelAndView("join2");
		loginService.join1(map.getMap());
		return mv;
	}

	@RequestMapping(value = "/idck", produces = "text/plain;charset=utf-8")
	public @ResponseBody String idcheck(HttpServletRequest request) {
		int count = 1;
		System.out.println(request.getParameter("id"));
		count = loginService.idck(request.getParameter("id"));
		System.out.println(count);
		return count + "";
	}

	@RequestMapping(value = "/nick", produces = "text/plain;charset=utf-8")
	public @ResponseBody String nick(HttpServletRequest request) {
		int count = 1;
		System.out.println(request.getParameter("nickname"));
		count = loginService.nick(request.getParameter("nickname"));
		System.out.println(count);
		return count + "";
	}

	@GetMapping(value = "mapa")
	public String mapa(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginDTO dto = new LoginDTO();
		int no = (Integer) session.getAttribute("no");
		System.out.println(no);
		dto = loginService.view(no);
		session.setAttribute("name", dto.getMember_name());
		session.setAttribute("id", dto.getMember_id());
		session.setAttribute("pw", dto.getMember_pw());
		session.setAttribute("no", dto.getMember_no());
		session.setAttribute("grade", dto.getMember_grade());
		session.setAttribute("email", dto.getMember_email());
		session.setAttribute("cp", dto.getMember_cp());
		session.setAttribute("member_nickname", dto.getMember_nickname());
		return "mapa";
	}

	@GetMapping(value = "chemapa")
	public String chemapa() {
		return "chemapa";
	}

	@PostMapping(value = "/update3")
	public ModelAndView update3(CommandMap map, HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("redirect:/mapa");// ?

		HttpSession session = request.getSession();
		map.put("member_no", session.getAttribute("no"));
		System.out.println(map.getMap());
		LoginDTO dto = new LoginDTO();
		dto.setMember_nickname(request.getParameter("nickname"));
		dto.setMember_pw(request.getParameter("pw"));
		dto.setMember_cp(request.getParameter("ph"));
		dto.setMember_email(request.getParameter("email"));
		dto.setMember_no(Integer.parseInt(session.getAttribute("no") + ""));
		dto.setMember_pw(request.getParameter("pw"));

		// loginService.update3(map.getMap());
		loginService.update3(dto);

		return mv;
	}

}
