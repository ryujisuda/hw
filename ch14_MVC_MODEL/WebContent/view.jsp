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
<caption>  상세보기 </caption>    
<tr align=center><td>아이디 </td><td>  
            <%=rs.getString("emp_id")  %> </td> </tr>
<tr align=center><td>이름  </td><td> 
              <%=rs.getString("ename") %> </td> </tr>
<tr align=center><td>급여  </td><td> 
               <%=rs.getString("salary") %> </td> </tr>
<tr align=center><td>부서명  </td>
                <td> <%=rs.getString("depart") %> </td> </tr>
  <tr align=center><td colspan=2>
<a href="modify.jsp?id=<%=rs.getString("emp_id")  %>"> 
                수정하기</a>  &nbsp;&nbsp;&nbsp;&nbsp;
<a href="delete.jsp?id=<%=rs.getString("emp_id")  %>"> 
                삭제하기</a>  &nbsp;&nbsp;&nbsp;&nbsp;
<a href="list.mo"> 리스트 보기</a> </td></tr>
</table> 
</center>
</form> 
</body>
    