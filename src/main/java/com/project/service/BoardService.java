package com.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.BoardDAO;
import com.project.dto.BoardDTO;
import com.project.dto.Search;
import com.project.util.CommandMap;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;

	public ArrayList<HashMap<String, Object>> list(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.list(map);
	}

	public ArrayList<HashMap<String, Object>> boardList(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.boardList(map);
	}

	public int boardListCount() {
		return boardDAO.boardListCount();
	}

	public HashMap<String, Object> detail(int no) {
		return boardDAO.detail(no);
	}

	public BoardDTO detail(BoardDTO dto) {
		return boardDAO.detail(dto);
	}

	public void write(BoardDTO dto) {
		boardDAO.write(dto);
	}

	public ArrayList<HashMap<String, Object>> list2(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.list2(map);
	}

	public void update(Map<String, Object> map) {
		boardDAO.update(map);

	}

	public void delete(Map<String, Object> map) {
		boardDAO.delete(map);
	}

	public void views(int no) {
		boardDAO.views(no);

	}

	public void detail1(int no) {
		boardDAO.delete1(no);

	}

	public ArrayList<HashMap<String, Object>> list3(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.list3(map);
	}

	public ArrayList<HashMap<String, Object>> getBoardList(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.getBoardList(map);
	}

}
