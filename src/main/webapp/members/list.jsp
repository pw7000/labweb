<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<h3>Professor:</h3>
	<table cellpadding="50">
		<tr>
			<td width="30%"><img  src="${pageContext.request.contextPath}/images/teacher/1.jpg" width="140px" height="165px"/></td>
			<!-- <td width="20%"></td> -->
			<td width="40%" style="padding:20px 20px">
				<p>Di Wu (吴镝)</p>
				<p>Email:  dwu@nju.edu.cn</p>
				<p>Phone:  025-83686543</p>
				<p>ContactAddress: Tang Zhong Ying Building,L202 Nanjing University, Nanjing, Jiangsu, China</p>
			</td>
		</tr>
	</table>

<h3>Graduate Students:</h3>
			<table >
				<tr>
					<c:forEach items="${memberList1 }" var="member" varStatus="status">
						<c:if test="${status.index%3==0 }">
							<tr>
								
						    </tr>
					
						</c:if>
					<td>
						<div style="margin:30px ">
							<img src="${pageContext.request.contextPath}/${member.memberPic}" width="140px" height="165px"/><br/>
							<h5>${member.memberName }</h5>
						    <h5>${member.email }</h5>
						</div>
						
					</td>
					</c:forEach>
				</tr>
			
			</table>
			<%-- <ul class="product clearfix">
				<c:forEach items="${memberList1 }" var="member">
					<li>
						<dl>
							<dt>
								
								<img src="${pageContext.request.contextPath}/${member.memberPic}" width="140px" height="165px"/>
							</dt>
							<dd class="title">
								${member.memberName }
							</dd>
							<dd class="price">
								${member.email }
							</dd>
						</dl>
					</li>
				</c:forEach>
			</ul> --%>
			
			
<h3>Graduated Students:	</h3>

            <ul>
				<c:forEach items="${memberList2 }" var="member">
				<li>
					<p>${member.memberName }</p>
					<p>${member.email }</p>
				</li>
				</c:forEach>
			</ul>

</body>
</html>