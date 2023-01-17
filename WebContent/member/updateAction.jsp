<%@page import="org.iclass.vo.NewMember"%>
<%@page import="org.iclass.dao.NewMemberDao"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지는 데이터 처리만 합니다.(서블릿 역할)
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String message;
	String url;
	NewMemberDao dao = new NewMemberDao();
	int result=0;
	if(request.getParameter("extra").equals("yes")) {   //회원탈퇴
		result = dao.delete(id);		
		message= "회원 탈퇴를 완료했습니다.";
		url="location.href='list.jsp'";
	}else {	//회원 수정
	
	String email = request.getParameter("email");
	String[] hobbies =request.getParameterValues("hobby");  //체크박스 선택한 것만 배열에 저장

	//dao 의 insert 
		result = dao.update(NewMember.builder()
				.id(id)
				.email(email)
				.hobbies(Arrays.toString(hobbies))
				.build()
				);
	//자바스크립트로 회원수정 완료 메시지 출력(alert) -> 회원수정 페이지 로 요청 보내기
		message="회원 정보 수정을 완료했습니다.";
		url="location.href='update.jsp?id="+id +"'";
		//예시 : location.href='update.jsp?id=hgd'
	}		
	
	if(result==1) {    //정상적으로 수정과 삭제가 됬을때,
		out.print("<script>");
		out.print("alert('"+message+"');");
		out.print(url);
		out.print("</script>");
	}else{
		response.sendRedirect("list.jsp");
	}

%>