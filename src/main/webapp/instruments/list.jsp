<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<c:forEach var="instrument" items="${instrumentList }">
	<table >
		<tr>
			<td width="10%"><img  src="${pageContext.request.contextPath}/${instrument.pic}" width="250px" height="200px"/></td>
			<td width="40%" >
				<h4>${instrument.name }</h4>
				${instrument.content}
			</td>
		</tr>
	</table>
	<div>&nbsp;</div>
	

</c:forEach>

