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
    ���� �߰�
    <br><br>
    ���� Ÿ��
    <input type="radio" name="Q_TYPE" value="TT"> TT
    <input type="radio" name="Q_TYPE" value="TI"> TI
    <input type="radio" name="Q_TYPE" value="IT"> IT
    <br><br>
    ���� <input type="text" name="Q_QUESTION">
    <br><br>
    ���� 1�� <input type="text" name="Q_EX1">
    <br><br>
    ���� 2�� <input type="text" name="Q_EX2">
    <br><br>
    ���� 3�� <input type="text" name="Q_EX3">
    <br><br>
    ���� 4�� <input type="text" name="Q_EX4">
    <br><br>
    ���� <input type="text" name="Q_ANSWER">
    <br><br>
    <input type="submit" value="���� �߰�">
	</form>
	
	<br><br>
	<form name = "deleteQuiz" action="DeleteQuiz.jsp" method="post">
	<% 
	while(rs.next())
	{
	%>
		<span>���� : <%= rs.getString("Q_QUESTION")%></span>
		<br><br>
		<span>����Ÿ�� : <%= rs.getString("Q_TYPE")%></span>
		<br><br>
		<span>���� 1�� : <%= rs.getString("Q_EX1")%></span>
		<br><br>
		<span>���� 2�� : <%= rs.getString("Q_EX2")%></span>
		<br><br>
		<span>���� 3�� : <%= rs.getString("Q_EX3")%></span>
		<br><br>
		<span>���� 4�� : <%= rs.getString("Q_EX4")%></span>
		<br><br>
		<a href="DeleteQuiz.jsp?number=<%=rs.getString("Q_NUM")%>"><%="����"%></a>
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
  ���� ������ �����ϴ�
  <br>
  <br>
  <button type = "button" onClick="location.href='Exam_Main.jsp'">�������� ���ư���</button>
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