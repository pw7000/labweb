<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	
</script>

<div class="row search" >
  <div class="col-md-6">
	<form action="${pageContext.request.contextPath}/department/list.do" method="post">
	    <div class="input-group" style="width: 300px">
		      <input type="text" class="form-control" name="deptName"  value="${s_department.deptName }" placeholder="search News...">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>&nbsp;Search</button>
		      </span>
	    </div>
    </form>
  </div>
 
</div>
<div>
	<%-- <table class="table table-hover  table-bordered table-striped" style="margin-bottom: 0px;">
	  <tr>
	  	<th>newsId</th>
	  	<th>newsName</th>
	  	<th>newsContent</th>
	  	<th>newsDate</th>
	  </tr>
	  <c:forEach var="news" items="${newsList }" varStatus="status">
	  	<tr>
	  		<td>${status.index+1 }</td>
	  		<td>${news.newsName }</td>
	  		<td>${news.newsContent }</td>
	  		<td>${news.newsDate}</td>
	  		
	  	</tr>
	  </c:forEach>
	</table> --%>
	<nav >
		<ul class="pagination">
			${pageCode }
		</ul>
	</nav>
</div>



