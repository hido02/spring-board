package com.example.demo.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;

import lombok.Data;

//create table board(
//	    board_idx   number(4) primary key,
//	    board_name varchar2(20),
//	    board_title varchar2(100),
//	    board_content varchar2(300),
//	    board_date date default sysdate,
//	    board_hit number(4) default 0
//	);

//@Data: lombok 연결
@Data
public class BoardDto {
	  @JsonProperty("id")
	    private int board_idx;

	    @JsonProperty("name")
	    private String board_name;

	    @JsonProperty("title")
	    private String board_title;

	    @JsonProperty("content")
	    private String board_content;

	    @JsonProperty("date")
	    private Date board_date;

	    @JsonProperty("hits")
	    private int board_hit;
	
	public BoardDto() {
		
	}
	public BoardDto(int board_idx, String board_name, String board_title, String board_content, Date board_date,
			int board_hit) {
		super();
		this.board_idx = board_idx;
		this.board_name = board_name;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_hit = board_hit;
	}
	
	@Override
	public String toString() {
	  return "BoardDto [board_idx=" + board_idx + ", title=" +board_title +  
	  ", content=" + board_content + "]"; 
	}

	
	
}
