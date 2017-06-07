<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自旋电子实验室后台管理系统</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
<script type="text/javascript">
	function checkForm(){
		 var userName=$("#userName").val();
		 var password=$("#password").val();
		 var imageCode=$("#imageCode").val();
		 if(userName==null||userName==""){
			 $("#error").html("用户名不能为空！");
			 return false;
		 }
		 if(password==null||password==""){
			 $("#error").html("密码不能为空！");
			 return false;
		 }
		 if(imageCode==null||imageCode==""){
			 $("#error").html("验证码不能为空！");
			 return false;
		 }
		 return true;
	}
</script>
</head>
<body>


<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>新用户注册</h1>
			<form id="registerForm" method="post" action="${pageContext.request.contextPath}/user/register.do" onsubmit="return checkForm()">
				<table>
					<tr>
						<td class="field">用户名：</td>
						<td><input class="text" type="text" id="userName" name="userName" /><span></span></td>
					</tr>
					<tr>
						<td class="field">密&nbsp;&nbsp;&nbsp;码：</td>
						<td><input class="text" type="password" id="password" name="password" /><span></span></td>
					</tr>
					<tr>
						<td class="field">验证码：</td>
						<td><input  class="text" style="width: 60px;margin-right: 10px;"
									type=text value="${imageCode }" name="imageCode" id="imageCode"><img
									onclick="javascript:loadimage();" title="换一张试试" name="randImage"
									id="randImage" src="${pageContext.request.contextPath}/image.jsp" width="60" height="20" border="1"
									align="absmiddle">					
						</td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="注册" /></label><font id="error"  color="red">${error }</font></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2014 Spintronics Laboratory  Nanjing University All Rights Reserved.
		
</div>
</body>
</html>