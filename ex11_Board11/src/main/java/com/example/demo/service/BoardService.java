package com.example.demo.service;

import java.util.List;
import com.example.demo.dto.BoardDto;

public interface BoardService {
    List<BoardDto> findAll(); // 게시글 목록 조회
}
