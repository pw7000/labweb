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
	function deleteInstrument(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的记录");
			return;
		}
		var linkIds=[];
		for(var i=0;i<selectedRows.length;i++){
			linkIds.push(selectedRows[i].linkId);
		}
		var ids=linkIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/instruments/delete.do",{ids:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示",result.success);
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示',"删除失败");
					}
				},"json");
			}
		});
	}	
	
		function addInstrumentDialog(){
			$("#dlg").dialog("open").dialog("setTitle","添加仪器信息");
			url="${pageContext.request.contextPath}/instruments/save.do";
		}
		
		
		
		function saveInstrument(){
			$("#fm").form("submit",{
				url:url,
				onSubmit:function(){
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
		function modifyInstrumentDialog(){
			var selectedRows=$("#dg").datagrid("getSelections");
			if(selectedRows.length!=1){
				$.messager.alert("系统提示","请选择<font color=red>1</font>条要修改的数据");
				return;
			}
			
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","编辑仪器信息");
			$("#name").val(row.name);
			$("#pic").val(row.pic);
			$("#content").val(row.content);
			url="${pageContext.request.contextPath}/instruments/save.do?id="+row.id;
		}
		function closeInstrumentDialog(){
			$("#dlg").dialog("close");
			resetValue();
			
		}
		
		
		function resetValue(){
			$("#name").val("");
			$("#pic").val("");
			$("#content").val("");
		}
</script>
<title>Insert title here</title>
</head>
<body style="margin:1px">
	<table id="dg" title="仪器管理" class="easyui-datagrid" fitColumns="true"
	pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/instruments/listajax.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="name" width="250" align="center">仪器名称</th>
				<th field="pic" width="150" align="center">仪器图片</th>
				<th field="content" width="250" align="center">仪器介绍</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:addInstrumentDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:modifyInstrumentDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteInstrument()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		
	</div>
<div id="dlg" class="easyui-dialog" style="width: 570px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="8px;">
  		<tr>
  			<td>仪器名称：</td>
  			<td>
  			
  			<input type="text" size="60" id="name" name="name" class="easyui-validatebox" required="true"/>
  			</td>
  		</tr>
  		<tr>
  			<td>仪器图片：</td>
  			<td><input type="text" size="60" id="pic" name="pic" class="easyui-validatebox" editable="false" required="true"/></td>
  		</tr>
  		<tr>
  			<td>仪器介绍：</td>
  			<td>
  			<textarea rows="3" cols="61" id="content" name="content" class="easyui-validatebox" required="true"/></textarea>
  			<!-- <input type="text" id="content" name="content" class="easyui-validatebox"  required="true"/> -->
  			</td>
  		</tr>
  	</table>
  </form>
</div>
<div id="dlg-buttons">
	<a href="javascript:saveInstrument()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeInstrumentDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>	
</body>
</html> 