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
<form action="modify.co" method="post">
<center><table border=1 width=300>
<caption>  수정하기 </caption>    
<tr align=center><td>아이디 </td>
 <td> <%=rs.getString("emp_id") %> 
<!-- 아이디를 출력만 하는 기능 -->
<input type="hidden" name="emp_id" value="<%=rs.getString("emp_id") %>"> </td></tr>
   <!-- 아디는 수정되면 안되므로 hidden 으로 처리 그러나 value 의 아디값은 modify.co 로 전달된다   -->
<tr align=center><td>이름  </td>
<td>  <input type="text" name="ename" value="<%=rs.getString("ename") %>"></td></tr>
<tr align=center><td>급여  </td>
     <td> <input type="text" name="salary" value="<%=rs.getString("salary") %>"> </td></tr>
<tr align=center><td>부서명  </td>     
       <td> <input type="text" name="depart" value="<%=rs.getString("depart") %>"> </td></tr>
<tr align=center><td colspan=2>
    <input type="submit" value="수정하기">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="list.co"> 리스트 보기</a>
</td></tr>
</table> </center>
</form> </body>

