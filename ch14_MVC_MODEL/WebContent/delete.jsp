<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    String id = request.getParameter("id");
%>
<form name="view" >
<center><table border=1 width=250>
   <caption> �����ϱ� </caption>  
<tr align=center><td>���̵� </td> <td> <%= id  %> </td> </tr>
<tr align=center> <td colspan=2> ���� ���� �����ϰڽ��ϱ� ?   </td></tr>

<tr align=center> <td colspan=2>
  <a href="delete.mo?id=<%= id  %>"> �����ϱ�</a>
   </td></tr>
</table> </center>
</form>
   