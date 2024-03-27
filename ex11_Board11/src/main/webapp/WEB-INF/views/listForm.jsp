<%@page import="com.example.demo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    $.ajax({
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
});
</script>

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
    <tbody>
        <!-- AJAX를 통해 여기에 데이터가 동적으로 추가됩니다 -->
    </tbody>
</table>

</body>
</html>
