package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.CommentDAO;
import com.project.dto.ReviewDTO;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;

	public void cdel(Map<String, Object> map) {
		commentDAO.cdel(map);
	}

	public void commentsInsert(Map<String, Object> map) {
		commentDAO.commentsInsert(map);

	}

	public ArrayList<HashMap<String, Object>> detail(int no) {
		return (ArrayList<HashMap<String, Object>>) commentDAO.detail(no);
	}

	public void update(Map<String, Object> map) {
		commentDAO.update(map);
	}

	public ReviewDTO get(Map<String, Object> map) {
		return commentDAO.get(map);
	}

}
