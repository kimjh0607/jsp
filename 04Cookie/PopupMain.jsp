<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupMode="on";

	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie c:cookies){
			String cName = c.getName();
			if(cName.equals("popupMode")){
				popupMode=c.getValue();
			}
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 관리</title>
<style>
	#popup{
		position:absolute; top:100px; left:50px;
		color:yellow; width:270px; height:100px; background-color:gray;
	}
	#popup>div{
		position:relative; background-color:white; top:0px;
		border:1px solid gray; padding:10px; color:black;
	}
</style>
<script 
  src="http://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<script>
$(function(){
    $('#closeBtn').click(function(){
    	$('#popup').hide();
    	  //쿠키 설정()
    	var chk=$('#inactiveToday:checked').val();
    	if(chk=='1'){
    		$.ajax({
    		    url:'./PopupCookie.jsp'
    			type:'get',
    			data:{inactive:chk},
    			datatype:'text',
    			success:function(resData){
    				if(resData!=''){
    					console.log(resData);
    					location.reload();
    				}
    			}
    		});
    	}
    });
 });
</script>
</head>
<body>
	<h2>팝업 메인 페이지</h2>
<%
	if(popupMode.equals("on")){
%>
	<div id="popup">
		<h2 align="center">공지사항</h2>
			<div align="right">
				<form name="popform">
					<input type="checkbox" id="inactiveToday" value="1"/>
						하루동안 안 열기
					<input type="button" value="닫기" id="closeBtn"/>
				</form>
			</div>
	</div>
<%
	}
%>
</body>
</html>