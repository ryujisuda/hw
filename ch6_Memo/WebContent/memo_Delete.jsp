<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%String num2 = request.getParameter("num"); %>
<% session.setAttribute("num", num2);%>

<body>
<form name="memo_Delete" action="memo_Delete_OK.jsp" method="post">
<table border=1>
<tr><td>�۹�ȣ</td><td><%=num2%><input type="hidden" name="num" value="<%=num2 %>"></td></tr>
<tr><td>��й�ȣ �Է�</td><td><input type="password" name="pass"></td></tr>
</table>
<input type="submit" value="Ȯ��"> 
</form>
</body>





