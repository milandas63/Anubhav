<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		out.println(name + ", how are you doing!");
		
		int from = Integer.parseInt(request.getParameter("from"));
		int to = Integer.parseInt(request.getParameter("till"));
		
		out.println("<br>");
		out.println("<body>");
		out.println("<table border='1'><tr>");
		for(int i=from; i<=to; i++) {
			out.println("<td><table>");
			for(int j=1; j<=10; j++) {
				out.println("<tr>");
				out.println("<td align='right'>"+i+"</td>");
				out.println("<td align='center'>x</td>");
				out.println("<td align='right'>"+j+"</td>");
				out.println("<td align='center'>=</td>");
				out.println("<td align='right'>"+(i*j)+"</td>");
				out.println("</tr>");
			}
			out.println("</table></td>");
		}
		out.println("</tr></table>");
		out.println("</body>");	%>
</body>
</html>