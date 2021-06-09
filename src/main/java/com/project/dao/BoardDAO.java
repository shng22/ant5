package com.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.BoardDTO;
import com.project.dto.Search;
import com.project.util.CommandMap;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<HashMap<String, Object>> list(Map<String, Object> map) {
		return sqlSession.selectList("board.list", map);
	}

	public List<HashMap<String, Object>> boardList(Map<String, Object> map) {
		return (sqlSession.selectList("board.boardList", map));
	}

	public int boardListCount() {
		return sqlSession.selectOne("board.boardListCount");
	}

	public HashMap<String, Object> detail(int no) {
		return sqlSession.selectOne("board.detail", no);
	}

	public BoardDTO detail(BoardDTO dto) {
		return sqlSession.selectOne("board.update", dto);
	}

	public void delete1(int no) {
		sqlSession.delete("board.delete1", no);
	}

	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto);
	}

	public List<HashMap<String, Object>> list2(Map<String, Object> map) {
		return sqlSession.selectList("board.list2", map);

	}

	public void update(Map<String, Object> map) {
		sqlSession.update("board.update2", map);
	}

	public void delete(Map<String, Object> map) {
		sqlSession.delete("board.delete", map);
	}

	public void views(int no) {
		sqlSession.update("board.views", no);
	}

	public List<HashMap<String, Object>> list3(Map<String, Object> map) {
		return sqlSession.selectList("board.list3", map);
	}

	public List<HashMap<String, Object>> getBoardList(Map<String, Object> map) {
		return sqlSession.selectList("board.getBoardList", map);
	}

}
