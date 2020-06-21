<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    String id = request.getParameter("id");
%>
<form name="view" >
<center><table border=1 width=250>
   <caption> 삭제하기 </caption>  
<tr align=center><td>아이디 </td> <td> <%= id  %> </td> </tr>
<tr align=center> <td colspan=2> 정말 삭제 삭제하겠습니까 ?   </td></tr>

<tr align=center> <td colspan=2>
  <a href="delete.mo?id=<%= id  %>"> 삭제하기</a>
   </td></tr>
</table> </center>
</form>
   