<%@page import="com.example.demo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록보기</title>
<style>
* {
	margin: 0 auto;
	padding: 0 auto;
	overflow: hidden;
}

td, h2 {
	text-align: center;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var ajaxRequest = null;

$(document).ready(function() {
    sendAjaxRequestForBoardList();
});

function sendAjaxRequestForBoardList() {
    // 중복 실행 방지
    if (ajaxRequest !== null) {
        ajaxRequest.abort();
    }

    ajaxRequest = $.ajax({
        url: '/board/list',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            var html = '';
            $.each(data, function(index, item) {
                html += '<tr>' +
                        '<td>' + item.board_idx + '</td>' +
                        '<td>' + item.name + '</td>' +
                        '<td>' + item.title + '</td>' +
                        '<td>' + item.date + '</td>' +
                        '<td>' + item.board_hit + '</td>' +
                        '</tr>';
            });
            $('table > tbody').append(html);
        }
    });
}
</script>
</head>
<body>
	<h2>게시판 글목록</h2>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
        <!-- AJAX로 불러온 데이터가 여기에 추가됩니다 -->
		
		<tr>
			<td colspan="5"><a href="writeForm">글작성</a></td>
		</tr>
	</table>
</body>
</html>