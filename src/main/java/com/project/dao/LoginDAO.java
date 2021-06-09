package com.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.LoginDTO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	public LoginDTO email(String email) {

		return sqlSession.selectOne("login.email", email);
	}

	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("login.login", dto);
	}

	public List<Object> detail() {
		return sqlSession.selectList("login.detail");
	}

	public LoginDTO endlogin(LoginDTO dto) {

		return sqlSession.selectOne("login.endlogin", dto);
	}

	public void join1(Map<String, Object> map) {
		sqlSession.insert("login.join1", map);
	}

	public int idck(String parameter) {

		return sqlSession.selectOne("login.idck", parameter);
	}

	public int nick(String parameter) {

		return sqlSession.selectOne("login.nick", parameter);
	}

	public LoginDTO cp(LoginDTO dto) {

		return sqlSession.selectOne("login.cp", dto);
	}

	public LoginDTO cp(String cp) {

		return sqlSession.selectOne("login.cp", cp);
	}

	public LoginDTO cp2(LoginDTO dto) {

		return sqlSession.selectOne("login.cp2", dto);
	}

	public LoginDTO pwch2(String email) {

		return sqlSession.selectOne("login.pwch2", email);
	}

	public LoginDTO pwch(LoginDTO dto) {

		return sqlSession.selectOne("login.pwch", dto);
	}

	public LoginDTO pwem(String email) {

		return sqlSession.selectOne("login.pwem", email);
	}

	public void update3(LoginDTO dto) {
		sqlSession.update("login.update3", dto);
	}

	public LoginDTO view(int no) {
		return sqlSession.selectOne("login.view", no);
	}
}
