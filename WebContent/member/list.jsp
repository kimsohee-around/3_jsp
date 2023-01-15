<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.NewMemberDao"%>
<%@page import="org.iclass.vo.NewMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<%
	NewMemberDao dao = new NewMemberDao();
	List<NewMember> list = dao.selectAll();
%>
<div class="container">
  <h2>회원 목록</h2>
  <table class="table table-bordered">
      <tr>
        <th>id</th>
        <th>이름</th>
        <th>Email</th>
        <th>나이</th>
        <th>성별</th>
        <th>취미</th>
        <th>가입날짜</th>
      </tr>
<%
	for(int i=0;i<list.size();i++) {
		NewMember temp = list.get(i);
%>      
      <tr>
        <td><%= temp.getId() %></td>
        <td><%= temp.getName() %></td>
        <td><%= temp.getEmail() %></td>
        <td><%= temp.getAge() %></td>
        <td><%= temp.getGender() %></td>
        <td><%= temp.getHobbies() %></td>
        <td><%= temp.getJoinDate2() %></td>
      </tr>
<%
	}
%>     
  </table>
</div>

</body>
</html>