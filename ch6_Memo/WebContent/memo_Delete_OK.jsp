<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>   
<%@ page import="javax.naming.*" %>

<%
request.setCharacterEncoding("euc-kr");
String num =request.getParameter("num");
String pass= request.getParameter("pass");
Connection conn=null;
PreparedStatement pstmt=null;
PreparedStatement pstmt2=null;
ResultSet rs=null;

String driver="oracle.jdbc.driver.OracleDriver"; 
String url="jdbc:oracle:thin:@localhost:1521:orcl";

Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt=conn.prepareStatement("SELECT * FROM memo_Test");

rs = pstmt.executeQuery();
%>
<body>
<%=num %> <%=pass %>
<%
out.println(num);
while(rs.next()){
	pstmt2=conn.prepareStatement("DELETE from memo_Test WHERE num=? and pass=?");
	pstmt2.setInt(1,Integer.parseInt(num));
	pstmt2.setString(2,pass);
	pstmt2.executeUpdate();
	break;

}
out.println("<script>");
out.println("location.href='memo.jsp'");
out.println("</script>");
%>
</body>




