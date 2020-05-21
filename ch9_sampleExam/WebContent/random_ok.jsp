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
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt = 
conn.prepareStatement("INSERT INTO SCORE(S_NUM,S_Name,S_GRADE) VALUES (?,?,?)");

int score = 0;
for(int r=0;r<5;r++)
{
	String bogis;
	bogis = request.getParameter(Integer.toString(r));
	String [] array_word;
	array_word=bogis.split("");

	String tmp1="";
	String tmp2="";
	boolean flag=false;


	for(int i=0;i<array_word.length;i++)
	{
		if(array_word[i].equals("!"))
		{
			flag=true;
			continue;
		}
		if(!flag)
		{
			tmp1+=array_word[i];
		}
		else
		{
			tmp2+=array_word[i];
		}
		
	}
	if(tmp1.equals(tmp2))
	{
		score++;
	}

}

pstmt.setString(1,request.getParameter("id"));
pstmt.setString(2,request.getParameter("name"));
pstmt.setString(3,score+"");
pstmt.executeUpdate();
%>

<body>

<center>
    시험결과
    <br>
    <br>

  <table border="1">
    <tr><td>학번</td><td><%=request.getParameter("id") %></td></tr>
    <tr><td>이름</td><td><%=request.getParameter("name") %></td></tr>
    <tr><td>점수</td><td><%=score %></td></tr>
    <tr><td align = "center" colspan ="2" ><a href="scoreList.jsp">점수 리스트 보기</a></td></tr>  
    
  </center>


</body>
</html>