package com.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dto.ReviewDTO;

@Repository
public class CommentDAO {

	@Autowired
	private SqlSession sqlSession;

	public void cdel(Map<String, Object> map) {
		sqlSession.delete("comment.cdel", map);
	}

	public void commentsInsert(Map<String, Object> map) {
		sqlSession.insert("comment.commentsInsert", map);
	}

	public List<HashMap<String, Object>> detail(int no) {
		return sqlSession.selectList("comment.comments", no);
	}

	public void update(Map<String, Object> map) {
		sqlSession.update("comment.update", map);
	}

	public ReviewDTO get(Map<String, Object> map) {
		return sqlSession.selectOne("comment.get", map);
	}
}
