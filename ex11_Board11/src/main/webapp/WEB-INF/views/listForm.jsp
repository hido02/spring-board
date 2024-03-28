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
function run_ajax(url, type, data, _async, successCallback, errorCallback) {
    // dataType 및 contentType 속성명 수정, JSON.stringify 오타 수정
    $.ajax({
        url: url,
 //       data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
        dataType: 'json', // 서버로부터 받아올 데이터의 타입
        type: type,
        async: _async,
        contentType: 'application/json; charset=UTF-8', // contentType 속성명 수정
        traditional: true,
        success: function(data) {
            successCallback(data);
        },
        error: function(request, status, error) {
            console.log("url1="+url);
            errorCallback(request, status, error);
        }
    });
}

$(document).ready(function() {
    sendAjaxRequestForBoardList();
});

function sendAjaxRequestForBoardList() {
    run_ajax('/board/list', 'GET', {}, true, function(data) {
        // 성공 콜백에서의 데이터 처리
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
    }, function(request, status, error) {
        // 오류 처리 콜백
        console.error("AJAX Error: ", status, error);
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