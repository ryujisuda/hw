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
<script language="JavaScript">
	function send()
	{
		document.deleteQuiz.submit();
	}


</script>
<%
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt = 
conn.prepareStatement("SELECT * FROM QUIZ");
rs=pstmt.executeQuery();

%>
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
	
	<br><br>
	<form name = "deleteQuiz" action="DeleteQuiz.jsp" method="post">
	<% 
	while(rs.next())
	{
	%>
		<span>문제 : <%= rs.getString("Q_QUESTION")%></span>
		<br><br>
		<span>문제타입 : <%= rs.getString("Q_TYPE")%></span>
		<br><br>
		<span>보기 1번 : <%= rs.getString("Q_EX1")%></span>
		<br><br>
		<span>보기 2번 : <%= rs.getString("Q_EX2")%></span>
		<br><br>
		<span>보기 3번 : <%= rs.getString("Q_EX3")%></span>
		<br><br>
		<span>보기 4번 : <%= rs.getString("Q_EX4")%></span>
		<br><br>
		<a href="DeleteQuiz.jsp?number=<%=rs.getString("Q_NUM")%>"><%="삭제"%></a>
		<br><br>
<% 
	}
%>	<input type ="submit" value="">
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
  <%

	%>
	
  </center>
 
</body>
</html>
</body>
</html>