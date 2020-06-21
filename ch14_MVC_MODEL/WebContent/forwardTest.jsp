<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int age=Integer.parseInt(request.getParameter("age"));
if(age<=19){
%>
<script type="text/javascript">
alert("19세 미만이므로 입장 불가능")
history.go(-1)  /* 지정한 단계로 이동함. -1은 비로 이전 단계 */
/* back() 한단계 전으로 , forward() 한단계 뒤로 이동함 */
</script>
<%
}
else
{
request.setAttribute("name", "kbs");
/* request에는 이미 age 값이 있는데, 거기에 name 값을 더 추가해서 보냄 */
RequestDispatcher dispatcher=request.getRequestDispatcher("forwardResult.jsp");
dispatcher.forward(request, response);
}
%>
