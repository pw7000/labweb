<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:forEach var="news" items="${newsList }">
    <div ><font size="5" color="#0000FF">${news.newsName }</font></div>
	<img  src="${pageContext.request.contextPath}/${news.newsPic}" width="600px" height="400px"/>
	<div>&nbsp;&nbsp;</div>
	<div>&nbsp;&nbsp;</div>
 	<div ><font size="3">${news.newsContent }</font></div> 
		
	

</c:forEach>


<nav >
		<ul class="pagination">
			${pageCode }
		</ul>
</nav>