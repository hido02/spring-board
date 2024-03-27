package com.example.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import com.example.demo.dto.BoardDto;
import com.example.demo.dao.iBoardDao; // 또는 Repository

@Service
public class BoardServiceImpl implements BoardService {

    private final iBoardDao boardDao; // 또는 Repository

    @Autowired
    public BoardServiceImpl(iBoardDao boardDao) {
        this.boardDao = boardDao;
    }

    @Override
    public List<BoardDto> findAll() {
        return boardDao.findAll(); // 게시글 목록 조회 구현
    }

    // 다른 메서드들의 구현 ...
}
