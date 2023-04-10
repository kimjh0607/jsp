<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
</head>
<body>
   <jsp:include page="../common/Top.jsp" />
   <h2>로그인 페이지</h2>
   <span style="color: red; font-size: 1.2em;"> 
   <%=request.getAttribute("loginErrMsg")==null?"":request.getAttribute("loginErrMsg") 
   %>
   </span>
   <% if(session.getAttribute("UserId")==null){ 
   %>
   <form action="LoginProcess.jsp" method="post"><%--아아디 패스워드 입력받아 'LP'페이지로 POST방식으로 전송 --%>
      아이디 : <input type="text" name="user_id" /><br>
      패스워드 : <input type="password" name="user_pw" /><br> 
      <input type="submit" value="로그인" />
   </form>
   <% }else{ //로그인 된 상태일때의 처리 정의. UserName값 출력, 로그아웃 링크를 표시-링크를 누르면 Logout페이지로 이동. %>
   	<%=session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br>
   	<a href="Logout.jsp">[로그아웃]</a>
   <% } %>
</body>
</html>


<%-- 
13행 - 로그인 오류가 발생하지 않는다면 loginErrMsg속성은 설정되지 않고 null -> 화면에 아무것도 표시안됨 / 
	   잘못된 정보가 입력되면 loginErrMsg에 '로그인 오류입니다.' 메시지가 설정된다.
15행 - UserId 속성을 가져오고, 그 값이 null인지 확인. 로그인이 되어있지않으면 UserId의 속성은 설정되지 않았을것.
	   이 경우에는 코드는 로그인 폼을 표시하려고 한다.
17행 - 이 폼은 사용자가 정보를 입력하고 제출하면 'LoginProcess.jsp'로 데이터가 전송. ('post'는 전송방식)
22행 - 로그인(submit)을 누르면 데이터가 서버로 전송되고 'LoginProcess.jsp'에서 처리된다.
24행 - session에 저장된 'UserName'속성 값을 가져와 출력. '홍길동'이라고 가정하면 '홍길동 회원님, 로그인하셨습니다.'
25행 - 로그아웃 링크생성 클릭하면 'Logout.jsp'로 이동.

==> 로그인 상태일 떄 사용자의 이름을 출력, 로그아웃 링크를 표시하므로써 사용자에게 로그인 정보를 주고 로그아웃 기능을 사용할 수 있게한다.

--%>

