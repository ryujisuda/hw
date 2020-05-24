<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%  request.setCharacterEncoding("euc-kr");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
</head>
<body>
  <center>
  <%
  if(request.getParameter("admin").toString().equals("admin*"))
  {
  %>
    <form action="QuizUpdateSuccess.jsp" method="post">
    문제 추가
    <br><br>
    문제 타입
    <input type="radio" name="Q_TYPE" value="TT"> TT
    <input type="radio" name="Q_TYPE" value="TI"> TI
    <input type="radio" name="Q_TYPE" value="IT"> IT
    <br><br>
    문제 <input type="text" name="Q_QUESTION">
    <br><br>
    보기 1번 <input type="text" name="Q_EX1">
    <br><br>
    보기 2번 <input type="text" name="Q_EX2">
    <br><br>
    보기 3번 <input type="text" name="Q_EX3">
    <br><br>
    보기 4번 <input type="text" name="Q_EX4">
    <br><br>
    정답 <input type="text" name="Q_ANSWER">
    <br><br>
    <input type="submit" value="문제 추가">
	</form>
  <%
  } 
  else
  {
  %>
  접근 권한이 없습니다
  <br>
  <br>
  <button type = "button" onClick="location.href='Exam_Main.jsp'">이전으로 돌아가기</button>
  <%
  }
  %>
  </center>
 
</body>
</html>
</body>
</html>