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
rs=pstmt.executeQuery();  // �ҷ��� ���ڵ带 rs �� ����

%>



<body>
<center>
  SCORE LIST
  <table border="1">
    <tr><td>�й�</td><td>�̸�</td><td>����</td><td>����ð�</td></tr>
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
  <button type="button" onClick="location.href='Exam_Main.jsp'">��������</button>
</center>
</body>
</html>