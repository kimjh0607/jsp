<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL XML</title>
</head>
<body>
	<c:import url="./include/FruitList.xml" var="fruitlist" charEncoding="UTF-8" />
	${fruitlist}
	<x:parse xml="${fruitlist}" var="flist" /><br>
	<x:out select="$flist/fruitlist/fruit[3]/name" /><br>
	<x:out select="$flist/fruitlist/fruit[3]/from" /><br>
	<x:out select="$flist/fruitlist/fruit[3]/price" /><br>
	
	<table border="1">
		<tr>
			<th>이름</th><th>원산지</th><th>가격</th>
		</tr>
		<x:forEach select="$flist/fruitlist/fruit" var="item">
			<tr>
				<td><x:out select="$item/name"/></td>
				<td><x:out select="$item/from"/></td>
				<td><x:out select="$item/price"/></td>				
			</tr>
		</x:forEach>
	
	
	</table>
</body>
</html>