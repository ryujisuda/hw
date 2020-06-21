<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String age=request.getParameter("age");
   /*  forward 방식으로 이동하면 request와 response 값이 유지됨. */ 
   /*  fowardForm.jsp 에서 입력한 age 값을 forwardTest.jsp 를 거쳐   */
   /*  fowardResult.jsp 까지 전달이 가능함 */
   /* 그러므로 여기서 age=request.getParameter("age"); 사용이 가능함 */
String name=(String)request.getAttribute("name");
%>
<body bgcolor=pink>
forward 방식으로 이동된 페이지에서 속성값으로 출력함  <br>
나이 : <%=age %><br>
이름 : <%=name %>
</body>
