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
  
  <body>
<form name="m2_view" >
<center><table border=1 width=300>
<caption>  �󼼺��� </caption>    
<tr align=center><td>���̵� </td><td>  
            <%=rs.getString("emp_id")  %> </td> </tr>
<tr align=center><td>�̸�  </td><td> 
              <%=rs.getString("ename") %> </td> </tr>
<tr align=center><td>�޿�  </td><td> 
               <%=rs.getString("salary") %> </td> </tr>
<tr align=center><td>�μ���  </td>
                <td> <%=rs.getString("depart") %> </td> </tr>
  <tr align=center><td colspan=2>
<a href="modify.jsp?id=<%=rs.getString("emp_id")  %>"> 
                �����ϱ�</a>  &nbsp;&nbsp;&nbsp;&nbsp;
<a href="delete.jsp?id=<%=rs.getString("emp_id")  %>"> 
                �����ϱ�</a>  &nbsp;&nbsp;&nbsp;&nbsp;
<a href="list.mo"> ����Ʈ ����</a> </td></tr>
</table> 
</center>
</form> 
</body>
    