 
<%@ page import="java.util.ArrayList"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
  <!-- JSTL ���̺귯���� ����ϱ� ���ؼ��� taglib �����ڸ�   -->
  <!-- �̿��Ͽ� uri�� prefix �� �����ؾ߸� �Ѵ�. --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int count=0; %>
<body><center>
<table border="1" width="350">
<caption>�˻� ���  </caption>
<tr> <td>���̵�</td><td>�̸�</td> <td>�޿�</td> <td>�μ���</td></tr>
<!--  core lib�� �̿��Ͽ� request�� list ��ü�� �޾ƿ��� �������� dto �� �Ѵ�. -->
   <!--  �������ʹ� ������ dto. ���� �����Ѵ�. -->
  <c:forEach items="${list2}" var="dto"> 
  <% count ++; %>
   <tr>  <td>  ${dto.emp_id}    </td>  
   <td>${dto.ename}</td>  <!-- dto�� �� ��� -->
   <td>${dto.salary}</td>  
   <td>${dto.depart}</td>
</tr></c:forEach>
 </table>
 <font color="red"> <%=request.getParameter("searchName") %> </font> �� 
<font color="red"> <%=request.getParameter("searchValue") %> </font> �� �˻��� ���
 <font color="red">  <%=count %>   </font>���� �˻� ��.  
 
<br><a href="write.jsp"> �� ����</a> &nbsp;&nbsp;
<a href="list.mo"> ����Ʈ ����</a> &nbsp;&nbsp;
