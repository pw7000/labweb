<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	
</script>

<%-- <div class="row search" >
  <div class="col-md-6">
	<form action="${pageContext.request.contextPath}/paper/list.do" method="post">
	    <div class="input-group" style="width: 300px">
		      <input type="text" class="form-control" name="paperName"  value="${s_paper.paperName }" placeholder="search paper...">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>&nbsp;Search</button>
		      </span>
	    </div>
    </form>
  </div>
 
</div> --%>
<div>
    <c:forEach var="paper" items="${paperList }" varStatus="status">
	<div>
		${status.index+1 }. &nbsp;&nbsp;<a target="_blank" href="${paper.href }">${paper.paperName} </a> <br/>
		 &nbsp;&nbsp; &nbsp;&nbsp;${paper.paperAuthors }<br/>
		&nbsp;&nbsp; &nbsp;&nbsp;${paper.publication}
		<p>&nbsp;</p>
	</div>
	</c:forEach>
	
	<nav >
		<ul class="pagination">
			${pageCode }
		</ul>
	</nav>
</div>



