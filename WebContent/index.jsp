<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>>
<!DOCTYPEhtml PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<metahttp-equiv ="Content-Type" content="text/html;charset=UTF-8">
<title>Inserttitle here</title>
</head>
<body>
	<%!  
public static final String DBDRIVER="com.mysql.cj.jdbc.Driver";  
public static final String DBURL="jdbc:mysql://localhost:3306/nlpclass?serverTimezone=UTC&useSSL=false&characterEncoding=utf8";  
public static final String DBUSER="root";  
public static final String DBPASS="1234" ;
%>
	<%  
Connection conn=null;  
PreparedStatement pstmt=null;  
ResultSet rs=null;  
%>
	<%  
try{  
Class.forName(DBDRIVER);  
conn=DriverManager.getConnection(DBURL,DBUSER,DBPASS);  
String sql="SELECT 网站,新闻标题,新闻内容,摘要,新闻来源 from alldata;";  
pstmt=conn.prepareStatement(sql);  
rs=pstmt.executeQuery();  
  
%>
	<center>
		<tableborder ="1" width="80%">
		<tr>
			<td>网站</td>
			<td>新闻标题</td>
			<td>新闻内容</td>
			<td>摘要</td>
			<td>新闻来源</td>
		</tr>
		<%  
while(rs.next())  
{  
	String empno=rs.getString(1);  
     String ename=rs.getString(2);  
     String job=rs.getString(3);  
     String sal=rs.getString(4);  
     String date=rs.getString(5);  
  
%>
		<tr>
			<td><%=empno%></td>
			<td><%=ename%></td>
			<td><%=job%></td>
			<td><%=sal%></td>
			<td><%=date%></td>
		</tr>
		<%  
}  
%>
		</table>
	</center>
	<%
}  
catch(Exception e)  
{  
     System.out.println(e);    
}  
finally  
{  
     rs.close();  
     pstmt.close();  
     conn.close();  
}  
%>
</body>
</html>
