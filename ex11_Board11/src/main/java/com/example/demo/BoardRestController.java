package com.example.demo;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.dto.BoardDto;
import com.example.demo.service.BoardService;

@RestController
public class BoardRestController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/board/list")
    public List<BoardDto> boardList() {
        return boardService.findAll();
    }
}
