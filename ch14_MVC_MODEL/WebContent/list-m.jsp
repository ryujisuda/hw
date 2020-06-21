<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
  <!-- JSTL 라이브러리를 사용하기 위해서는 taglib 지정자를   -->
  <!-- 이용하여 uri와 prefix 를 지정해야만 한다. --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body><center>
<table border="1" width="350">
<caption>리스트 보기 </caption>
    <tr> <td>아이디</td><td>이름</td> <td>급여</td> <td>부서명</td></tr>

    <!--  core lib를 이용하여  -->
   <!-- FrontController에서 넘겨져온 list 객체를  변수명 dto 로 정한다. -->
   <!--  이제부터는 변수명 dto. 으로 접근한다. -->
   <!-- list 에는 EmpDTO 객체의 주소값이 들어있다. --> 
   <!-- ArrayList 길이만큼 for문 반복함 -->
  <c:forEach items="${list}" var="dto">
   <tr>  <td> 
   <!-- id 에 하이퍼 링크를 걸어 클릭하면 view.jsp 로 이동하게 한다. -->
   <!-- 넘길 때 해당 id 값을 붙여서 넘긴다. -->
    <a href="view.jsp?id=${dto.emp_id}">  ${dto.emp_id} </a> 
    <!-- 링크 걸기 위해 사용 -->
   </td>   
    
    <td> ${dto.ename} </td>  <!-- dto의 값 출력 -->
   <td> ${dto.salary} </td>  
   <td> ${dto.depart} </td>
</tr> </c:forEach>
 </table><br>
 
<a href="write.jsp"> 글 쓰기</a> <br><br>

<table border="1" width="350">
<tr><td>
 <form  action="search.co" >
	<select name="searchName" size="1">
	 <option value="emp_id">아이디</option>
	<option value="ename">이름</option>  </select>
		<input type="text"  name="searchValue" >
		<input type="submit" value="찾기">
  </form></td></tr></table>
 
</center></body>
    