<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.DataSource" %>
<%
 DataSource dataFactory;
 Context ctx = new InitialContext();
    dataFactory = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
 Connection conn=null;
    
String id=null;
String info_id=request.getParameter("id");

PreparedStatement pstmt=null;
ResultSet rs=null;
conn=dataFactory.getConnection();

pstmt=conn.prepareStatement("SELECT * FROM emp WHERE emp_id=?");
pstmt.setString(1,info_id);
rs=pstmt.executeQuery();
rs.next();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="modify.mo" method="post">
<center><table border=1 width=300>
<caption>  �����ϱ� </caption>    
<tr align=center><td>���̵� </td>
 <td> <%=rs.getString("emp_id") %> 
<!-- ���̵� ��¸� �ϴ� ��� -->
<input type="hidden" name="emp_id" value="<%=rs.getString("emp_id") %>"> </td></tr>
   
  <!-- ���̵�� �����Ǹ� �ȵǹǷ� hiden ���� ó����. 
 �׷��� value �� ���̵� ���� modify.co �� ���޵�.  -->
<tr align=center><td>�̸�  </td>
<td>  <input type="text" name="ename" value="<%=rs.getString("ename") %>"></td></tr>
<tr align=center><td>�޿�  </td>
     <td> <input type="text" name="salary" value="<%=rs.getString("salary") %>"> </td></tr>
<tr align=center><td>�μ���  </td>     
       <td> <input type="text" name="depart" value="<%=rs.getString("depart") %>"> </td></tr>
<tr align=center><td colspan=2>
    <input type="submit" value="�����ϱ�">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="list.co"> ����Ʈ ����</a>
</td></tr>
</table> </center>
</form> </body>

</html>