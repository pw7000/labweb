<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	function deleteMember(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的记录");
			return;
		}
		var memberIds=[];
		for(var i=0;i<selectedRows.length;i++){
			memberIds.push(selectedRows[i].id);
		}
		var ids=memberIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/members/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","数据已成功删除！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示',"删除失败");
					}
				},"json");
			}
		});
	}	
	
		function addMemberDialog(){
			$("#dlg").dialog("open").dialog("setTitle","添加用户信息");
			url="${pageContext.request.contextPath}/members/save.do";
		}
		
		function searchMember(){
			$("#dg").datagrid("load",{
				"memberName":$("#s_memberName").val()
			});
		}
		
		function saveMember(){
			$("#fm").form("submit",{
				url:url,
				onSubmit:function(){
					if($("#memberType").combobox("getValue")==""){
						$.messager.alert("系统提示","请选择成员类型");
						return false;
					}
					return $(this).form("validate");
				},
				success:function(result){
					var result=eval('('+result+')');
					if(result.success){
						$.messager.alert("系统提示",result.success);
						resetValue();
						$("#dlg").dialog("close");
						$("#dg").datagrid("reload");
					}else{
						$.meaaasger.alert("系统提示","保存失败");
						return ;
					}
				}
			});
		}
		function modifyMemberDialog(){
			var selectedRows=$("#dg").datagrid("getSelections");
			if(selectedRows.length!=1){
				$.messager.alert("系统提示","请选择<font color=red>1</font>条要修改的数据");
				return;
			}
			
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","编辑成员信息");
			$("#memberName").val(row.memberName);
			$("#email").val(row.email);
			$("#memberPic").val(row.memberPic);
			$("#memberType").combobox("setValue",row.memberType);
			url="${pageContext.request.contextPath}/members/save.do?id="+row.id;
		}
		function closeMemberDialog(){
			$("#dlg").dialog("close");
			resetValue();
			
		}
		
		
		function resetValue(){
			$("#id").val("");
			$("#memberName").val("");
			$("#email").val("");
			$("#memberPic").val("");
			$("#memberType").val("");
			
			
		}
		
		
</script>
<title>Insert title here</title>
</head>
<body style="margin:1px">
	<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true"
	pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/members/listajax.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="memberName" width="50" align="center">成员名</th>
				<th field="email" width="50" align="center">邮箱</th>
				<th field="memberPic" width="50" align="center">成员图片</th>
				<th field="memberType" width="50" align="center">成员类型</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:addMemberDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:modifyMemberDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteMember()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			&nbsp;&nbsp;&nbsp;<font color="red">添加用户前，请先将用户照片上传至服务器！</font>
		</div>
		
		<div>&nbsp;用户名：<input type="text" name="memberName" id="s_memberName"  size="10" onKeydown="if (event.keyCode==13) searchMember()"/> 
		<a href="javascript:searchMember()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
<div id="dlg" class="easyui-dialog" style="width: 370px;height: 220px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="8px;">
  		<tr>
  			<td><input type="hidden" id="id" name="id" value="${member.id }"/></td>
  		</tr>
  		
  		<tr>
  			<td>成员名：</td>
  			<td><input type="text" id="memberName" name="memberName" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>邮件：</td>
  			<td><input type="text" id="email" name="email" class="easyui-validatebox" validType="email" required="true"/></td>
  		</tr>
  		<tr>
  			<td>成员照片：</td>
  			<td><input type="text" id="memberPic" name="memberPic" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>成员类型：</td>
  			<td>
  				<select class="easyui-combobox" id="memberType" name="memberType" style="width: 154px;" editable="false" panelHeight="auto">
	 						<option value="">请选择成员类型：</option>
	 						<option value="2">2</option>
	 						<option value="3">3</option>
	 		</select>	
  			</td>
  			
  		</tr>
  		
  	</table>
  </form>
</div>
<div id="dlg-buttons">
	<a href="javascript:saveMember()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeMemberDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>	
</body>
</html> 