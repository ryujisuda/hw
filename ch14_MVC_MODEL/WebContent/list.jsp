<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
  <!-- JSTL ���̺귯���� ����ϱ� ���ؼ��� taglib �����ڸ�   -->
  <!-- �̿��Ͽ� uri�� prefix �� �����ؾ߸� �Ѵ�. --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body><center>
<table border="1" width="350">
<caption>����Ʈ ���� </caption>
    <tr> <td>���̵�</td><td>�̸�</td> <td>�޿�</td> <td>�μ���</td></tr>

    <!--  core lib�� �̿��Ͽ�  -->
   <!-- FrontController���� �Ѱ����� list ��ü��  ������ dto �� ���Ѵ�. -->
   <!--  �������ʹ� ������ dto. ���� �����Ѵ�. -->
   <!-- list ���� EmpDTO ��ü�� �ּҰ��� ����ִ�. --> 
   <!-- ArrayList ���̸�ŭ for�� �ݺ��� -->
  <c:forEach items="${list}" var="dto">
   <tr>  <td> 
   <!-- id �� ������ ��ũ�� �ɾ� Ŭ���ϸ� view.jsp �� �̵��ϰ� �Ѵ�. -->
   <!-- �ѱ� �� �ش� id ���� �ٿ��� �ѱ��. -->
    <a href="view.jsp?id=${dto.emp_id}">  ${dto.emp_id} </a> 
    <!-- ��ũ �ɱ� ���� ��� -->
   </td>   
    
    <td> ${dto.ename} </td>  <!-- dto�� �� ��� -->
   <td> ${dto.salary} </td>  
   <td> ${dto.depart} </td>
</tr> </c:forEach>
 </table><br>
 
<a href="write.jsp"> �� ����</a> <br><br>

<table border="1" width="350">
<tr><td>
 <form  action="search.co" >
	<select name="searchName" size="1">
	 <option value="emp_id">���̵�</option>
	<option value="ename">�̸�</option>  </select>
		<input type="text"  name="searchValue" >
		<input type="submit" value="ã��">
  </form></td></tr></table>
 
</center></body>
    