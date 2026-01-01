<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! int a=10,b=10; %>
<%= a+b %>





<%! public int add(int x,int y){
	return x+y;
} %>

<h1><%=add(1,2) %>
</h1>
<%int[] arr={1,2,3,4,5}; %>
<h1>

<% for(int i:arr){ %>
<%=i %>



<%} %>

</h1>




</body>
</html>