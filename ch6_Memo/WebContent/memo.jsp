<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.Calendar"%>
<body>
<% 
if ((session.getAttribute("id")==null)) {
out.println("<script>");
out.println("location.href='memberLogin.jsp'");
out.println("</script>");
}
%>
<form action="memo_ok.jsp" method="post">
<table border=1 align="center">
<tr><td colspan=5 align=center width="650px">�� �� �޸���</td></tr>
<tr><td>�ۼ���</td><td> <input name="name" readonly  type="text" VALUE="<%= session.getAttribute("id")  %>"> </td>
    <td>��й�ȣ</td><td><input name="pass" type="password"></td>
    <td rowspan=2><input value="�����ϱ�" type="submit"></td></tr>
    <tr><td>�� ��</td><td colspan=3>
<input name="title" type="text" size="70"></td>   
</table>
</form><br>
<%
int c_day;
Calendar now = Calendar.getInstance();
c_day=now.get(Calendar.DATE);


     request.setCharacterEncoding("euc-kr");
   String i= "";
    Connection conn=null;
     PreparedStatement pstmt=null;
     ResultSet rs=null;
    String driver="oracle.jdbc.driver.OracleDriver"; 
    String url="jdbc:oracle:thin:@localhost:1521:orcl";
    Statement stmt =null;
    String cntsql=null ;
    ResultSet rs1=null;
    Statement stmt3=null;
    String cntsql3=null;
    ResultSet rs3=null ;

    
    try {
Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
// ���� SQL  ����Ϸ��� �� ���Ϻ��� �ٽ� �߰� �Ͽ� ����ϸ� ��.

pstmt=conn.prepareStatement("SELECT * FROM memo_Test where name='admin' order by indate desc  "); 
rs=pstmt.executeQuery();

Class.forName(driver);  
conn=DriverManager.getConnection(url,"jisu","jisu");
 stmt3 = conn.createStatement();
 
cntsql3 = "SELECT * FROM memo_Test where name !='admin' order by indate desc ";
rs3 = stmt3.executeQuery(cntsql3);

stmt = conn.createStatement();
cntsql = "SELECT COUNT(*) FROM memo_Test";
rs1 = stmt.executeQuery(cntsql);

if( rs1.next() )
{i= rs1.getString(1); }    

}
catch(Exception e){
e.printStackTrace();
}

%>
    <table border="1" cellspacing="1" align="center">
    <tr ><td colspan=6 align = center>�� ���ڵ� ���� <%=i %>�� �Դϴ�.</td></tr>
<% 
if(session.getAttribute("id").equals("admin"))
{
	int j=0;
	while(rs.next()&& j<3)
	{
	j++;%>
	<tr><td width="40px"> <%= rs.getString(1) %></td>
	
	<% 
	String write_day=rs.getString("indate").substring(8,10) ; 
	int w_day = Integer.parseInt(write_day);
    if(w_day +2> c_day )
    {%><td width="100px"> <%= rs.getString(2)%><td width="300px"> <%= rs.getString(3) %> <img src="new.PNG"> </td> 
    <% } else
	{%>
    	<td width="100px"> <%= rs.getString(2)%><td width="300px"> <%= rs.getString(3) %>  </td> 
    <% }%>
	 </td> 
	 <%

	 %>
	
	<td width="90px"> <%=(rs.getString("indate")).substring(0,10) %>  </td>           <td width="40px">
	<a href="memo_Delete.jsp?num=<%=rs.getString(1) %>">����</a></td>   </tr>  
	<%} 
	%>
	
	<%while ( rs3.next() ){%>
	<tr><td width="40px"> <%= rs3.getString(1) %></td>
	<% 
	String write_day=rs3.getString("indate").substring(8,10) ; 
	int w_day = Integer.parseInt(write_day);
    if(w_day +2> c_day )
    {%><td width="100px"> <%= rs3.getString(2)%><td width="300px"> <%= rs3.getString(3) %> <img src="new.PNG"> </td> 
    <% System.out.println("���ƾƾ�"); } else
	{%>
    	<td width="100px"> <%= rs3.getString(2)%><td width="300px"> <%= rs3.getString(3) %>  </td> 
    <% }%>
	 </td> 
	 <%

	 %>
	<td width="90px"> <%=(rs3.getString("indate")).substring(0,10) %>  </td>
	
	           <td width="40px"> 
	<a href="memo_Delete.jsp?num=<%=rs3.getString(1) %>">����</a></td>   </tr>     
		<%}
	
}
else
{
	int j=0;
	while(rs.next()&& j<3)
	{
	j++;%>
	<tr><td width="40px"> <%= rs.getString(1) %></td>
	<% 
	String write_day=rs.getString("indate").substring(8,10) ; 
	int w_day = Integer.parseInt(write_day);
	if(w_day +2> c_day )
    {%><td width="100px"> <%= rs.getString(2)%><td width="300px"> <%= rs.getString(3) %> <img src="new.PNG"> </td> 
    <% } else
	{%>
    	<td width="100px"> <%= rs.getString(2)%><td width="300px"> <%= rs.getString(3) %>  </td> 
    <% }%>
	 </td> 
	 <%

	 %>

	<td width="90px"> <%=(rs.getString("indate")).substring(0,10) %>  </td>           
	<td ></td></tr>  
	<% 
	}
	while ( rs3.next() )  {
		%>
		 <tr><td width="40px"> <%= rs3.getString(1) %></td>
        <% 
	String write_day=rs3.getString("indate").substring(8,10) ; 
	int w_day = Integer.parseInt(write_day);
    if(w_day+2> c_day )
    {%><td width="100px"> <%= rs3.getString(2)%><td width="300px"> <%= rs3.getString(3) %> <img src="new.PNG"> </td> 
    <% } else
	{%>
    	<td width="100px"> <%= rs3.getString(2)%><td width="300px"> <%= rs3.getString(3) %>  </td> 
    <% }%>
	 </td> 
	 <%

	 %>
        
<td width="90px"> <%=(rs3.getString("indate")).substring(0,10) %>  </td>
<td></td>   </tr>  
		<%
	}
}
%>
</table>
</body>
    