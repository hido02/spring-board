package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.iBoardDao;
import com.example.demo.dto.BoardDto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class MyController {

	@Autowired
	iBoardDao boardDao;

	private static final Logger logger = LoggerFactory.getLogger(MyController.class);

	@RequestMapping("/")
//	@ResponseBody
	public String root() {
//		return "root()함수 호출됨."; 
		System.out.println("listForm으로 리다이렉트됨");
		return "redirect:listForm";
	}

	@RequestMapping("/listForm")
	public String listForm(Model model) {
		return "listForm"; // "listForm.jsp" 디스패치해줌
	}
}
