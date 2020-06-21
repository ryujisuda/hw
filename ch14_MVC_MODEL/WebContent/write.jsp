<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<form action="write.mo" method="post">
 <!-- 아래 폼에서 입력 된 내용을 가지고 FrontControllerServlet 88 라인으로 감-->
<center>
<table border=1 width=300>
<caption> 글 쓰기 </caption>    
<tr align=center><td>아이디 </td>
         <td> <input type="text" name="emp_id"> </td> </tr>
<tr align=center><td>이름  </td>
        <td> <input type="text" name="ename"> </td> </tr>
<tr align=center><td>급여  </td><td> <input type="text" name="salary"></td> </tr>
<tr align=center><td>부서명  </td>
     <td> <input type="text" name="depart"> </td> </tr>
<tr align=center><td colspan=2>
   <input type="submit" value="저장하기">&nbsp;&nbsp;&nbsp;&nbsp;
<a href="list.mo"> 리스트 보기</a> </td></tr>
     <!-- 설명 -->
</table> 
</center>
</form>
        