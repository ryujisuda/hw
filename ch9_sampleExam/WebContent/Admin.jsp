<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%  request.setCharacterEncoding("euc-kr");  %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
</head>

<body>
  <center>
  <form name = "random_suffle" action="QuizUpdate.jsp" method="post">
    ������ ��й�ȣ : <input type="text" name="admin">
  <br><br>
  <input type="submit" value="Ȯ��">
  </form>   
  </center>
 
</body>
</html>