<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 게시판</title>
<style>a{text-decoration: none;}</style>
</head>
<body>
	<h2>목록 보기</h2>
	<!-- 검색 -->
	
	<form method="get">
		<table border="1" width="90%;">
			<tr>
				<td align="center">
					<select name="searchType">
						<option value="title" 
							<c:if test="${map.searchType=='title'}">selected</c:if>>제목</option>
						<option value="content">내용</option>
						<!-- <option value="content" 
							<c:if test="${map.searchType=='content'}">selected</c:if>>내용</option>
						<option value="content">제목</option> -->
					</select>
					<input type="search" name="searchStr" value="${map.searchStr}"/>
					<input type="submit" value="검색"/>
					
				</td>
			</tr>
		</table>
	</form>
	<!-- 목록 -->
	<table border="1" width="90%;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>첨부파일</th>
		</tr>
<c:choose>

	<c:when test="${empty boardList}">
		<tr>
			<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${boardList}" var="list" varStatus="stat">
			<tr align="center">
				<td>${map.totalCount-((map.pageNum-1)*map.pageSize)-stat.index}</td>
				<td align="center">
					<a href="../m2board/view.do?idx=${list.idx}">${list.title}</a>
				</td>
				<td>${list.name}</td>
				<td>${list.visitcount}</td>
				<td>${list.postdate}</td>
				<td>
				<c:if test="${not empty list.ofile}">
					<a href="../m2board/download.do?ofile=${list.ofile}&nfile=${list.nfile}&idx=${list.idx}">[${list.ofile}]</a>
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</c:otherwise>
	
</c:choose>
	<table border="1" width="90%">
      <tr align="center">
         <td>
         ${map.pagingStr}
         </td>
         <td width="100">
            <button type="button" onclick="location.href='../m2board/write.do';">
               글쓰기
            </button>
         </td>
      </tr>
   </table>

</body>
</html>