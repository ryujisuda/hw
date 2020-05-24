<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%  request.setCharacterEncoding("euc-kr");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
Connection conn2=null;
PreparedStatement pstmt2=null;
ResultSet rs2=null;
String driver2="oracle.jdbc.driver.OracleDriver";  
String url2="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver2);  
conn2=DriverManager.getConnection(url2,"jisu","jisu");
pstmt2 = 
conn2.prepareStatement("SELECT * FROM QUIZ");
rs2=pstmt2.executeQuery();
int num=0;
while(rs2.next())
{
	num++;
}

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt = 
conn.prepareStatement("INSERT INTO QUIZ(Q_NUM,Q_QUESTION,Q_TYPE,Q_EX1,Q_EX2,Q_EX3,Q_EX4,Q_ANSWER) VALUES (?,?,?,?,?,?,?,?)");
System.out.println(num);
pstmt.setString(1,Integer.toString(num+1));
pstmt.setString(2,request.getParameter("Q_QUESTION"));
pstmt.setString(3,request.getParameter("Q_TYPE"));
pstmt.setString(4,request.getParameter("Q_EX1"));
pstmt.setString(5,request.getParameter("Q_EX2"));
pstmt.setString(6,request.getParameter("Q_EX3"));
pstmt.setString(7,request.getParameter("Q_EX4"));
pstmt.setString(8,request.getParameter("Q_ANSWER"));
pstmt.executeUpdate();


%>
<body>


<center>
    추가가 완료되었습니다!
    <br>
    <br>
    <button type="button" onClick="location.href='Exam_Main.jsp'">메인으로</button>
  </center>
</body>
</html>