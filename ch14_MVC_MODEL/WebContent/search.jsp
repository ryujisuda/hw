 
<%@ page import="java.util.ArrayList"  %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
  <!-- JSTL 라이브러리를 사용하기 위해서는 taglib 지정자를   -->
  <!-- 이용하여 uri와 prefix 를 지정해야만 한다. --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% int count=0; %>
<body><center>
<table border="1" width="350">
<caption>검색 결과  </caption>
<tr> <td>아이디</td><td>이름</td> <td>급여</td> <td>부서명</td></tr>
<!--  core lib를 이용하여 request로 list 객체를 받아오고 변수명을 dto 라 한다. -->
   <!--  이제부터는 변수명 dto. 으로 접근한다. -->
  <c:forEach items="${list2}" var="dto"> 
  <% count ++; %>
   <tr>  <td>  ${dto.emp_id}    </td>  
   <td>${dto.ename}</td>  <!-- dto의 값 출력 -->
   <td>${dto.salary}</td>  
   <td>${dto.depart}</td>
</tr></c:forEach>
 </table>
 <font color="red"> <%=request.getParameter("searchName") %> </font> 로 
<font color="red"> <%=request.getParameter("searchValue") %> </font> 를 검색한 결과
 <font color="red">  <%=count %>   </font>건이 검색 됨.  
 
<br><a href="write.jsp"> 글 쓰기</a> &nbsp;&nbsp;
<a href="list.mo"> 리스트 보기</a> &nbsp;&nbsp;
