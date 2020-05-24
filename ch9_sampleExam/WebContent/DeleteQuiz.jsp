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
<%
Connection conn2=null;
PreparedStatement pstmt2=null;
ResultSet rs2=null;
String driver2="oracle.jdbc.driver.OracleDriver";  
String url2="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver2);  
conn2=DriverManager.getConnection(url2,"jisu","jisu");
pstmt2 = 
conn2.prepareStatement("DELETE FROM QUIZ WHERE Q_NUM=?");
System.out.println(request.getParameter("number"));
pstmt2.setString(1,request.getParameter("number"));
pstmt2.executeUpdate();


%>
<body>


<center>
    삭제가 완료되었습니다!
    <br>
    <br>
    <button type="button" onClick="location.href='Exam_Main.jsp'">메인으로</button>
  </center>
</body>
</html>