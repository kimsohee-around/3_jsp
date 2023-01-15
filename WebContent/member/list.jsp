<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.iclass.dao.NewMemberDao"%>
<%@page import="org.iclass.vo.NewMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원 목록</title>
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
<%--         <td><%= temp.getId() %></td> --%>        
		<td><a href="update.jsp?id=<%= temp.getId() %>"><%= temp.getId() %></a></td>
		<!-- a 태그 : 요청 url은 update.jsp , 파라미터 id -->
        <td><%= temp.getName() %></td>
        <td><%= temp.getEmail() %></td>
        <td><%= temp.getAge() %></td>
        <td><%= temp.getGender() %></td>
        <td><%= temp.getHobbies() %></td>
        <td><%= temp.getJoinDate2() %> ,
        <%
        	//날짜형식을 원하는 형식으로 변경하기        	
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        	String joind = sdf.format(temp.getJoinDate2());
        	out.print(joind);
        	out.print(",");
        	out.print(temp.timestampToLocalDateTime());
        %>
        </td>
      </tr>
<%
	}
%>     
  </table>
  <button type="button" onclick="location.href='/jsp'">HOME</button>
</div>

</body>
</html>