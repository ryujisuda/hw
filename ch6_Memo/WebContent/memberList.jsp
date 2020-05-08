<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
int i=0;
    request.setCharacterEncoding("euc-kr");

     String id=null;
     Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;

    String driver="oracle.jdbc.driver.OracleDriver";  
    String url="jdbc:oracle:thin:@localhost:1521:orcl";

    try {
    Class.forName(driver);  
    conn=DriverManager.getConnection(url,"jisu","jisu");
    pstmt=conn.prepareStatement("SELECT * FROM member where status=0");
    rs=pstmt.executeQuery();
    }catch(Exception e){
    e.printStackTrace();
    }
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border=1 width=500>
<tr align=center><td colspan=8>[회원 목록]</td></tr>
<tr><td>NO</td><td>ID</td><td>PASS</td><td>이름</td><td>나이</td><td>성별</td><td>이메일</td><td>상태</td></tr>
<% while(rs.next()) { ++i;%>
<tr><td> <%=i%></td><td><%=rs.getString("id") %></td><td><%=rs.getString("pass") %></td>
<td><%=rs.getString("name") %></td><td><%=rs.getInt("age") %></td><td><%=rs.getString("gender") %></td>
<td><%=rs.getString("email") %></td><td><%=rs.getInt("status") %></td></tr>
<% }  %>
</table>
</body>
</html>