<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp start</title>
</head>
<body>
<!-- 
이 프로젝트는 mvc 모델1 입니다. 서블릿 없고 jsp 가 요청을 직접 받아 처리.
    ㄴ url 에 jsp 파일명이 보입니다.

jsp 특징
1. 자바코드를 넣을 수 있다. : 스크립트릿
2. 태그 사이에 자바 변수(메소드결과,수식결과 포함) 값을 출력 : 표현식
3. jsp 자체 태그가 있다. 
4. jsp 객체는 선언하지 않고 사용할 수 있다.
	ㄴ request,response,out,pageContext,session 등등
5. 위 형식과 관련된 주석은 별도 기호를 사용합니다.	
6. 지시자 : 맨위에. (page지시자 :컴파일 및 응답결과물형식,인코딩,임포트..)
 -->
 <h3>JSP 문법 테스트</h3>
 <%
 	//1.스트립트릿
 	String[] names = {"사나","신비","은하","모모"};
 	for(int i=0;i<names.length;i++) {
 		//4. out 객체로 html 문서 출력
 		out.print("<hr>");  //태그 출력 가능
 		out.print(names[i]);
 	}
 %>
 <hr>
 <ul>
 <!-- 2. 표현식으로 변수값 출력 -->
 	<li><%= names[0] %></li>
 	<li><%= names[1] %></li>
 	<li><%= names[2] %></li>
 	<li><%= names[3] %></li>
<%--  	<li><%= names[4] %></li> --%>   <!-- jsp요소포함할 때 주석 -->
 </ul>
 <hr>
 <ul>
<%
	//Arrays.asList(names);    //리스트를 배열로
 	for(int i=0;i<names.length;i++) {
%>
 	<!-- 반복할 태그 작성 -->
 	<li><%= names[i] %></li>
<%
 	}
	
	//배열을 리스트로 만드는 방법
	List<String> list = new ArrayList<>(List.of(names));
	for(int i=0;i<list.size();i++){
%>
	<li><strong><%= list.get(i) %></strong></li>
<%
	}
%>
 </ul>
 <!-- 협업하기 어려운 형식 : 자바코드 와 태그 섞여있어 css와 처리코드 분리 안됨 -->
</body>
</html>







