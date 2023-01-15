<%@page import="org.iclass.vo.NewMember"%>
<%@page import="org.iclass.dao.NewMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 수정</title>
<link rel="stylesheet" href="../css/join.css">
</head>
<body>
<%
	NewMember vo=null;
    NewMemberDao dao =null;
	String id = request.getParameter("id");
	if(id == null )
		response.sendRedirect("../fail.jsp");
	else {	
	 dao = new NewMemberDao();
	 vo = dao.selectById(id);
	}
	
	if(vo == null) 
		response.sendRedirect("../fail.jsp");
	else {	
%>
<h3>회원 수정</h3>
<!-- 수정가능한 정보 : email , 취미 -->
<form action="updateAction.jsp" method="POST">
<input type="hidden" name="extra"> <!-- 회원탈퇴시에 사용 -->
<table>
	<tr>
		<td>
			<label for="lblUid">아이디</label>
		</td>
		<td>
		<input type="text" id="lblUid" name="id" value="<%=vo.getId() %>" readonly>  <!-- disabled="disabled" 로 하면 파라미터 전달이 안됩니다. -->
		</td>
	</tr>
	<tr>
		<td>
			<label for="lblName">이름</label>
		</td>
		<td>
		<input type="text" id="lblName" name="name" value="<%=vo.getName() %>" disabled="disabled">
		</td>
	</tr>
<!-- 	<tr>
		<td>
			<label for="lblPass">패스워드</label>
		</td>
		<td>
		<input type="password" id="lblPass" name="password">
		</td>
	</tr> -->
	<tr>
		<td>
			<label for="lblEmail">이메일</label>
		</td>
		<td>
		<input type="text" id="lblEmail" name="email" value="<%= vo.getEmail() %>">
		</td>
	</tr>
	<tr>
		<td>
			<label for="lblAge">나이</label>
		</td>
		<td>
		<input type="number" id="lblAge" name="age" value="<%= vo.getAge() %>" disabled="disabled">
		</td>
	</tr>
	<!-- <tr>
		<td>
			<label for="lblAddr">지역(주소)</label>
		</td>
		<td>  선택상자(콤보 박스) , 드롭다운
			<select id="lblAddr">
				<option>서울</option>
				<option>인천</option>
				<option>대전</option>
				<option>대구</option>
				<option>광주</option>
				<option>부산</option>
				<option>기타</option>
			</select>
		</td>
	</tr> -->
	<tr>
		<td>
			<label>성별</label>
		</td>
		<td>
		<!-- radio 버튼은 여러개 중 단일 선택. name 속성값이 같게하여
			 그룹화.
		 -->
		 	<input type="hidden" value="<%=vo.getGender() %>" id="gender">  <!-- 자바스크립트에서 사용하기 위함. -->
			<input type="radio" name="gender" id="lblMale" value="male" disabled="disabled">
			<label for="lblMale">남성</label>
			<input type="radio" name="gender" id="lblFemale" value="female" disabled="disabled">
			<label for="lblFemale">여성</label>
			<input type="radio" name="gender" id="lblNo" value="unknown" 
			checked="checked" disabled="disabled">
			<label for="lblNo">모름</label>
		</td>
	</tr>
	<tr>
		<td>
			<label>취미</label>
		</td>
		<td>  
			<!-- 체크박스는 다중 선택. toggle 동작 -->
			<input type="hidden" value="<%= vo.getHobbies() %>" id="hobbies">  <!-- 자바스크립트에서 사용하기 위함. -->
			<input type="checkbox" id="lblFootball" name="hobby" value="축구">
			<label for="lblFootball">축구</label>
			<input type="checkbox" id="lblBaseball" checked="checked" name="hobby" value="야구">
			<label for="lblBaseball">야구</label>
			<input type="checkbox" id="lblRun" name="hobby" value="달리기">
			<label for="lblRun">달리기</label>
			<input type="checkbox" id="lblSwim" name="hobby" value="수영">
			<label for="lblSwim">수영</label>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button>수정하기</button>  
			<!-- form 태그 안에 있을 때는 type=submit 생략됨.  -->
			<button type="reset" >다시쓰기</button>
				<button type="button" onclick="location.href='list.jsp'">회원목록</button>
			<button type="button" id="delete">회원 탈퇴</button>
		</td>
	</tr>
</table>
</form>	
<script type="text/javascript">
		let gender = document.querySelector("#gender").value
		gender = (gender=='1')? 'male':(gender=='2')? 'female':'unknown'
		const hobbies = document.querySelector("#hobbies").value
		
		document.querySelectorAll("input[name='gender']").forEach(radioItem => {
			  if(radioItem.value == gender) radioItem.checked = 'checked'
			
		});
		
		document.querySelectorAll("input[name='hobby']").forEach(checkItem => {
			if(hobbies.includes(checkItem.value)) checkItem.checked ='checked'
			else
				checkItem.checked = false
			
		});

		document.querySelector("#delete").addEventListener('click',()=>{
			const frm = document.forms[0]
			const id = frm.id.value
			const yn = confirm(id + "님 😪  정말로 회원 탈퇴를 하십니까??")
			if (yn) {
				frm.extra.value='yes'
				frm.submit()
			}
			
		})

</script>
<%
	}
	
%>
</body>
</html>