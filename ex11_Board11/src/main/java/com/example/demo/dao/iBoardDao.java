package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.BoardDto;

//@Mapper: MyBatis와 인터페이스 함수를 연결함
@Mapper
public interface iBoardDao {
	public List<BoardDto> list();
	
	List<BoardDto> findAll();
}
