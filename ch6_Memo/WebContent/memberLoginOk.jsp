<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%
     String id=request.getParameter("id");
     String pass=request.getParameter("pass");
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
 String url="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt = 
conn.prepareStatement("SELECT * FROM member WHERE id=?");
// ������ �Է��� id �� DB �� �Ƶ� ������ �ҷ��ͼ�
pstmt.setString(1,id);
rs=pstmt.executeQuery();  // �ҷ��� ���ڵ带 rs �� ����
if(rs.next()){
if(pass.equals(rs.getString("pass"))){
// ������ �Է��� �н��� DB ���� �ҷ��� �н��� ������
// �ᱹ�� ���̵�� �н� �� �� ������ 
session.setAttribute("id",id); // �Ƶ� ���ǰ����� ����
out.println("<script>");
out.println("location.href='memo.jsp'"); // ���� �α����̸�
out.println("</script>");
}
}
// �н��� �ٸ��� �ٽ� �α��� â���� ����
out.println("<script>");
out.println("location.href='memberLogin.jsp'");
out.println("</script>");  
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>