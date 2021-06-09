package com.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.LoginDAO;
import com.project.dto.LoginDTO;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public LoginDTO email(String email) {

		return loginDAO.email(email);
	}

	public List<Object> detail() {
		return loginDAO.detail();
	}

	public LoginDTO login(LoginDTO dto) {
		return loginDAO.login(dto);
	}

	public LoginDTO endlogin(LoginDTO dto) {

		return loginDAO.endlogin(dto);
	}

	public void join1(Map<String, Object> map) {
		loginDAO.join1(map);

	}

	public int idck(String parameter) {

		return loginDAO.idck(parameter);
	}

	public int nick(String parameter) {

		return loginDAO.nick(parameter);
	}

	public LoginDTO cp(LoginDTO dto) {

		return loginDAO.cp(dto);
	}

	public LoginDTO cp(String cp) {

		return loginDAO.cp(cp);
	}

	public LoginDTO cp2(LoginDTO dto) {

		return loginDAO.cp2(dto);
	}

	public LoginDTO pwch2(String email) {

		return loginDAO.pwch2(email);
	}

	public LoginDTO pwch(LoginDTO dto) {

		return loginDAO.pwch(dto);
	}

	public LoginDTO pwem(String email) {

		return loginDAO.pwem(email);
	}

	public void update3(LoginDTO dto) {
		loginDAO.update3(dto);
	}

	public LoginDTO view(int no) {
		return loginDAO.view(no);
	}

}