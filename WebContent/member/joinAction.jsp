<%@page import="org.iclass.vo.NewMember"%>
<%@page import="org.iclass.dao.NewMemberDao"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지는 데이터 처리만 합니다.(서블릿 역할)
	request.setCharacterEncoding("UTF-8");
	String temp = request.getParameter("age");   //입력안한 파라미터 "" , 없는 파라미터 null
	int age=-1;
	try {
		age = Integer.parseInt(temp);
	}catch(NumberFormatException e){}
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	//String hobby = request.getParameter("hobby");
	//배열 요소는 
	String[] hobbies =request.getParameterValues("hobby");  //체크박스 선택한 것만 배열에 저장
/*
	out.print(name);
	out.print("<br>");
	out.print(gender);
	out.print("<br>");
	out.print(Arrays.toString(hobbies));
	out.print("<br>");
*/	
	//dao 의 insert 
	NewMemberDao dao = new NewMemberDao();
	dao.insert(NewMember.builder()
			.id(id)
			.name(name)
			.password(password)
			.email(email)
			.age(age)
			.gender(gender.equals("male")?"1":gender.equals("female")?"2":"3")   //규칙
			.hobbies(Arrays.toString(hobbies))
			.build()
			);
			
	//자바스크립트로 회원가입 완료 메시지 출력(alert) -> join.html 로 요청 보내기
	out.print("<script>");
	out.print("alert('회원 가입을 완료했습니다.');");
	out.print("location.href='join.html'");
	out.print("</script>");
	
	
//	response.sendRedirect("join.html");   //위의 out 출력은 확인 안됩니다.응답 결과가 바뀝니다.

%>