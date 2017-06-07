<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="list-group">
  <a href="${pageContext.request.contextPath}/main.jsp" class="list-group-item active">Home</a>
  <a href="${pageContext.request.contextPath}/news/list.do" class="list-group-item">News</a>
  <a href="${pageContext.request.contextPath}/research/list.do" class="list-group-item">Research</a>
  <a href="${pageContext.request.contextPath}/paper/list.do" class="list-group-item">Publications</a>
  <a href="${pageContext.request.contextPath}/members/list.do" class="list-group-item">Members</a>
  <a href="${pageContext.request.contextPath}/instruments/list.do" class="list-group-item">Instruments</a>
  <a href="${pageContext.request.contextPath}/contact/list.do" class="list-group-item">Contact us</a>
</div>