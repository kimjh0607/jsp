<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 내장객체</title>
</head>
<body>
<%
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	if(id.equalsIgnoreCase("user")&&pw.equalsIgnoreCase("1234")){//
		//reponse.sendRedirect()
		response.sendRedirect("ResponseOK.jsp");//'Redirect' - client에 링크주소를
	}else{
		//request.getRequestDispatcher
		request.getRequestDispatcher("ResponseMain.jsp?logErr=1")//'Dispatcher' - dispatcher에게 전달? - client
			.forward(request,response);
	}
%>

</body>
</html>