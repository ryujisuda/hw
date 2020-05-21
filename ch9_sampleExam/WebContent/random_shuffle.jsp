<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%  request.setCharacterEncoding("euc-kr");  %>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script language="JavaScript">
	
		var SetTime = 100;		// 최초 설정 시간(기본 : 초)
		function msg_time() {	// 1초씩 카운트
			
			m = SetTime + "초";	// 남은 시간 계산
			
			var msg = "제한시간 : " + m + "입니다.";
			
			document.all.ViewTimer.innerHTML = msg;		// div 영역에 보여줌 
					
			SetTime--;					// 1초씩 감소
			
			if (SetTime < 0) {			// 시간이 종료 되었으면..
				
				clearInterval(tid);		// 타이머 해제
				alert("주어진 시간을 다 사용하여 자동으로 제출됩니다.");
				document.random_suffle.submit();
			}
			
		}

		window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
		
		function check_id() 
		{
		  var JSPName = "id_check.jsp";
		  browsing_window = window.open(JSPName,      
		  "_idcheck","height=220,width=420");
		   browsing_window.focus(); 
		 }
		
	</script>


<%!
 // 보기를 랜덤하게 보여주기 위한 함수
  String[] STRRandom(String[] mun) {
  boolean [] visit2={false,false,false,false};
  int []ee = {0,0,0,0};
  String []result = new String[4];
  Random random = new Random();
  
  for(int i=0; i<4 ; i++)
  {
	 int n=random.nextInt(4);
	 while(ee[n]!=0)
 	{
 		n= random.nextInt(4);
 	}
  	result[i]=mun[n+3];
  	ee[n]++;
  }
  
  return result;
}
 %>

<%

Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String driver="oracle.jdbc.driver.OracleDriver";  
String url="jdbc:oracle:thin:@localhost:1521:orcl";
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
pstmt = 
conn.prepareStatement("SELECT * FROM QUIZ");
rs=pstmt.executeQuery();  // 불러온 레코드를 rs 에 저장

String[][] bg =new String[10][8];
int a=0;
while(rs.next()){
	bg[a][0]=Integer.toString(rs.getInt("Q_NUM"));
	bg[a][1]=rs.getString("Q_QUESTION");
	bg[a][2]=rs.getString("Q_TYPE");
	bg[a][3]=rs.getString("Q_EX1");
	bg[a][4]=rs.getString("Q_EX2");
	bg[a][5]=rs.getString("Q_EX3");
	bg[a][6]=rs.getString("Q_EX4");
	bg[a][7]=rs.getString("Q_ANSWER");
	a++;
}


Random ran2 = new Random();
Date date = new Date();

boolean [] visit={false,false,false,false,false,false,false,false,false,false};
int [] arr_munje_num={0,0,0,0,0,0,0,0,0,0};
for(int k =0; k <5 ; k++)
{
	int n= ran2.nextInt(10);
	while(visit[n])
	{
		n=ran2.nextInt(10);
	}
	visit[n]=true;
	arr_munje_num[k]=n;
}

%>

<body>

<div id="ViewTimer"></div>

<br><br>
<form name = "random_suffle" action="random_ok.jsp" method="post">

  학번 : <input type="text" name="id" readonly/> <input TYPE=button VALUE="ID Check" onclick="check_id()" onmouseover="this.style.cursor='hand';"> 이름 : <input type="text" name = "name">

  <br>
  <br>
<%
for(int j = 0 ; j<5 ; j++)
{
	String[] show= STRRandom(bg[arr_munje_num[j]]);
%>

	문제<%=bg[arr_munje_num[j]][0] %>&nbsp; <%= bg[arr_munje_num[j]][1] %><br>&nbsp;&nbsp;
	<span><input type="radio" name="<%= j %>" value="<%=show[0]+'!'+bg[arr_munje_num[j]][7]%>" checked="checked"><%=show[0] %> &nbsp;&nbsp;</span>
	<span><input type="radio" name="<%= j %>" value="<%=show[1]+'!'+bg[arr_munje_num[j]][7]%>"><%=show[1] %> &nbsp;&nbsp;</span>
	<span><input type="radio" name="<%= j %>" value="<%=show[2]+'!'+bg[arr_munje_num[j]][7]%>"><%=show[2] %> &nbsp;&nbsp;</span>
	<span><input type="radio" name="<%= j %>" value="<%=show[3]+'!'+bg[arr_munje_num[j]][7]%>"><%=show[3] %> &nbsp;&nbsp;</span>
	
	<br><br>
<%

	
}
%>

<input type="submit" value="채점하기">
</form>
</body>
</html>