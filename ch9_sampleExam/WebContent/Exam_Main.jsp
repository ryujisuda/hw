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
    온라인 시험 문제 메인 페이지
    <br>
    <br>
    <button type = "button" onClick="location.href='random_shuffle.jsp'">문제풀기</button>

    </button>
    <br>
    <br>
    <button type = "button" onClick="location.href='Admin.jsp'" >관리자페이지</button>
    </button>
  </center>
</body>
</html>