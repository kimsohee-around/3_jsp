<%@page import="java.time.LocalDateTime"%>
<%@page import="org.iclass.vo.NewMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vo 클래스 test</title>
</head>
<body>
<%
	NewMember vo = NewMember.builder()
				.id("momo")
				.name("김모모")
				.age(25)
				.joinDate(LocalDateTime.now())
				.build();
%>
<h3>가입한 회원 정보</h3>
<table>
	<tr>
		<th>id</th>
		<th>이름</th>
		<th>나이</th>
		<th>가입날짜</th>
	</tr>
	<tr>
		<td><%= vo.getId()%></td>
		<td><%= vo.getName()%></td>
		<td><%= vo.getAge()%></td>
		<td><%= vo.getJoinDate()%></td>
	</tr>
</table>
</body>
</html>