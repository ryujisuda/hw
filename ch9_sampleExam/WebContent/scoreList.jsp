<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%  request.setCharacterEncoding("euc-kr");  %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt = 
conn.prepareStatement("SELECT * FROM SCORE ORDER BY Q_INDATE DESC");
rs=pstmt.executeQuery();  // 불러온 레코드를 rs 에 저장

%>



<body>
<center>
  SCORE LIST
  <table border="1">
    <tr><td>학번</td><td>이름</td><td>성적</td><td>제출시간</td></tr>
	<%
	while(rs.next())
	{
	%>
		<tr><td><%=rs.getString("S_NUM")%></td>
		<td><%=rs.getString("S_Name")%></td>
		<td><%=rs.getString("S_GRADE")%></td>
		<td><%=rs.getString("Q_INDATE")%></td></tr>	
	<%
	}
	
	%>    
  </table>
  <br>
  <br>
  <button type="button" onClick="location.href='Exam_Main.jsp'">메인으로</button>
</center>
</body>
</html>