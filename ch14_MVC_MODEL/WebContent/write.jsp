<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<form action="write.mo" method="post">
 <!-- �Ʒ� ������ �Է� �� ������ ������ FrontControllerServlet 88 �������� ��-->
<center>
<table border=1 width=300>
<caption> �� ���� </caption>    
<tr align=center><td>���̵� </td>
         <td> <input type="text" name="emp_id"> </td> </tr>
<tr align=center><td>�̸�  </td>
        <td> <input type="text" name="ename"> </td> </tr>
<tr align=center><td>�޿�  </td><td> <input type="text" name="salary"></td> </tr>
<tr align=center><td>�μ���  </td>
     <td> <input type="text" name="depart"> </td> </tr>
<tr align=center><td colspan=2>
   <input type="submit" value="�����ϱ�">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="list.mo"> ����Ʈ ����</a> </td></tr>
     <!-- ���� -->
</table> 
</center>
</form>
        