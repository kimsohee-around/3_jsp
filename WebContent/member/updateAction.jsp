<%@page import="org.iclass.vo.NewMember"%>
<%@page import="org.iclass.dao.NewMemberDao"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지는 데이터 처리만 합니다.(서블릿 역할)
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	//수정 항목
	String email = request.getParameter("email");
	String[] hobbies =request.getParameterValues("hobby");  //체크박스 선택한 것만 배열에 저장

	//dao 의 insert 
	NewMemberDao dao = new NewMemberDao();
	dao.update(NewMember.builder()
			.id(id)
			.email(email)
			.hobbies(Arrays.toString(hobbies))
			.build()
			);
			
	//자바스크립트로 회원가입 완료 메시지 출력(alert) -> join.html 로 요청 보내기
	out.print("<script>");
	out.print("alert('회원 정보 수정을 완료했습니다.');");
	out.print("location.href='update.jsp?id="+id +"'");
	out.print("</script>");
	

%>