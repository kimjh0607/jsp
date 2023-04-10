<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="utils.AlertFunc" %>
<%
	String num=request.getParameter("num");
	
	BoardDAO dao=new BoardDAO(application);
	int res=dao.deletePost(num);
	dao.close();
	
	if(res==1){
		AlertFunc.alertLocation("삭제완료", "List.jsp", out);
	}else{
		AlertFunc.alertBack("삭제 실패", out);
	}
%>
<!-- 
7행 - 
request객체는 클라이언트의 요청 정보를 담고있음. 
getParameter메서드로  요청에 포함된 num 파라미터를 가져옴.
num은 삭제할 게시물의 고유번호(board의 컬럼- 대부분 primary key). 
request내장객체를 사용하면 HttpServletRequest 인터페이스 메서드에 접근 가능.
8행 -


 -->