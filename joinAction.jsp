<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="member.Member" scope="page" />
<jsp:setProperty name="member" property="MemberID" />
<jsp:setProperty name="member" property="MemberPassword" />
<jsp:setProperty name="member" property="MemberName" />
<jsp:setProperty name="member" property="MemberNumber" />
<jsp:setProperty name="member" property="MemberEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		if(member.getMemberID() == null || member.getMemberPassword() == null || member.getMemberName() == null ||
			member.getMemberNumber() == null || member.getMemberEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			MemberDao memberDao = new MemberDao();
			int result = memberDao.join(member);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>