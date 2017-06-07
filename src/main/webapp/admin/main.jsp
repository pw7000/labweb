<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎使用自旋电子实验室后台管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/admin/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	
	function openPasswordModifyDialog(){
		url="${pageContext.request.contextPath}/user/update.do?id=${currentUser.id}";
	    
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
	}
	
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				
				 /*
				不能采用js验证，因为session中的密码是加密后的，而表单获取的是加密前的
				采用ajax验证
				if(oldPassword!='${currentUser.password}'){
					$.messager.alert('系统提示','用户密码输入错误！');
					return false;
				} */ 
				if(newPassword!=newPassword2){
					$.messager.alert('系统提示','确认密码输入错误！');
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.error){
					$.messager.alert('系统提示','用户密码错误');
					return;
				}else if(result.success){
					$.messager.alert('系统提示','密码修改成功，下一次登录生效！');
					closePasswordModifyDialog();
				}else{
					$.messager.alert('系统提示','修改密码失败');
					return;
				}
			}
		});
	}
	
	function closePasswordModifyDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function logOut(){
		$.messager.confirm('系统提示','您确定要退出系统吗？',function(r){
			if(r){
				window.location.href='${pageContext.request.contextPath}/user/logout.do';
			}
		});
	}
</script>
<%
	if(session.getAttribute("currentUser")==null){
		response.sendRedirect(request.getContextPath()+"/admin/login.jsp");
		return;
	}

%>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #E0ECFF">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="60%">
				<font color="blue" size="8">Spintronics Laboratory</font>
			</td>
			<td valign="bottom" align="right" width="50%">
				<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${currentUser.userName }</font>
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="padding-top: 100px"><font color="red" size="8">欢迎使用自旋电子实验室后台管理系统</font></div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="用户管理" data-options="selected:true,iconCls:'icon-user'" style="padding: 10px">
			<a href="javascript:openTab('用户管理','memberManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-userManage'" style="width: 150px;">管理用户</a>
		</div>
		<div title="文章管理"  data-options="iconCls:'icon-user'" style="padding:10px">
		<a href="javascript:openTab('文章管理','paperManage.jsp','icon-notice')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-userManage'" style="width: 150px;">管理文章</a>
		</div>
		<div title="新闻管理"  data-options="iconCls:'icon-user'" style="padding:10px">
			<a href="javascript:openTab('新闻管理','newsManage.jsp','icon-news')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-userManage'" style="width: 150px;">管理新闻</a>
		</div>
		<div title="仪器管理"  data-options="iconCls:'icon-user'" style="padding:10px">
			<a href="javascript:openTab('仪器管理','instrumentManage.jsp','icon-tag')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-userManage'" style="width: 150px;">管理仪器</a>
		</div>
		<div title="文件管理"  data-options="iconCls:'icon-user'" style="padding:10px">
			<a href="javascript:openTab('文件管理','fileManage.jsp','icon-tag')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-userManage'" style="width: 150px;">文件上传</a>
			
		</div>
		<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
			<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
			<a href="javascript:logOut()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
			<%-- <a target="_blank"  href="${pageContext.request.contextPath}/admin/register.jsp" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-userManage'" style="width: 150px;">注册用户</a> --%>
		</div>
		
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px;" align="center">
	版权所有 2014-2016 Spintronics Laboratory
</div>
<div id="dlg" class="easyui-dialog" style="width: 400px;height: 220px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="8px;">
  		<%-- <tr>
  	    	<td><input type="hidden" id="id" name="id" value="${currentUser.id }"/></td>
  	    </tr> --%>
  		<tr>
  			<td>用户名：</td>
  			<td><input type="text" id="userName" name="userName"  readonly="readonly" value="${currentUser.userName }"/></td>
  		</tr>
  		<tr>
  			<td>原密码：</td>
  			<td><input type="password" id="oldPassword" name="oldpassword" class="easyui-validatebox" required="true" /></td>
  		</tr>
  		<tr>
  			<td>新密码：</td>
  			<td><input type="password" id="newPassword" name="password" class="easyui-validatebox"  required="true"/></td>
  		</tr>
  		<tr>
  			<td>确认新密码：</td>
  			<td><input type="password" id="newPassword2"  class="easyui-validatebox"  required="true"/></td>
  		</tr>
  	</table>
  </form>
</div>
<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


</body>
</html>