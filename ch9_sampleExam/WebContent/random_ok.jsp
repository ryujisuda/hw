<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*"%>

<%  request.setCharacterEncoding("euc-kr");  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
String [] numbers={null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null};
String [] answer={null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null};
int idx=0;

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
	String tmp3="";
	int flag=0;

	for(int i=0;i<array_word.length;i++)
	{

		if(array_word[i].equals("!"))
		{
			flag++;
			continue;
		}
		if(flag==0)
		{
			tmp1+=array_word[i];
		}
		else if(flag==1)
		{
			tmp2+=array_word[i];
		}
		else if(flag==2)
		{
			tmp3+=array_word[i];
		}
		
	}
	if(tmp2.equals(tmp3))
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
    
    <button type "button" onClick="location.href='Exam_Main.jsp'">
    메인으로 돌아가기
    </button>
   	<br>
   	<br>
   	틀린 문제 보기와 정답
   	<br>
    <br>
   	<%
   	
   	for(int r=0;r<5;r++)
   	{
   		String bogis;
   		bogis = request.getParameter(Integer.toString(r));
   		String [] array_word;
   		array_word=bogis.split("");

   		
   		String tmp1="";
   		String tmp2="";
   		String tmp3="";
   		int flag=0;


   		for(int i=0;i<array_word.length;i++)
   		{
   			if(array_word[i].equals("!"))
   			{
   				flag++;
   				continue;
   			}
   			if(flag==0)
   			{
   				tmp1+=array_word[i];
   			}
   			else if(flag==1)
   			{
   				tmp2+=array_word[i];
   			}
   			else if(flag==2)
   			{
   				tmp3+=array_word[i];
   			}
  			
   		}
   		if(tmp2.equals(tmp3))
   		{
   			
   		}
   		else
   		{
			numbers[idx]=tmp1;
			answer[idx]=tmp2;
			idx++;
   		}
 

   	}

   	Connection conn2=null;
   	PreparedStatement pstmt2=null;
   	ResultSet rs2=null;
   	String driver2="oracle.jdbc.driver.OracleDriver";  
   	String url2="jdbc:oracle:thin:@localhost:1521:orcl";
   	Class.forName(driver2);  
   	conn2=DriverManager.getConnection(url2,"jisu","jisu");
   	pstmt2 = 
   	conn2.prepareStatement("SELECT * FROM QUIZ");
   	rs2=pstmt2.executeQuery();  // 불러온 레코드를 rs 에 저장
   	while(rs2.next())
   	{
;
   		for(int i=0;i<idx;i++){

   			if(numbers[i].equals(Integer.toString(rs2.getInt("Q_NUM"))))
   			{
   				%>
   				문제 : <%=rs2.getString("Q_QUESTION") %>
   				<br>
   				<span>보기 1. <%=rs2.getString("Q_EX1")+" " %></span>
   				<span>보기 2. <%=rs2.getString("Q_EX2")+" " %></span>
   				<span>보기 3. <%=rs2.getString("Q_EX3")+" " %></span>
   				<span>보기 4. <%=rs2.getString("Q_EX4")+" " %></span>
   				<br>
   				<span>나의 답 : <%=answer[i] %></span>     
   				<span>정답 : <%=rs2.getString("Q_ANSWER") %></span>
   				<br>
   				<br>
   				<%
   			}
   		}
   	}
   	%>
  </center>


</body>
</html>