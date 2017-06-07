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
	function deleteNews(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的记录");
			return;
		}
		var newsIds=[];
		for(var i=0;i<selectedRows.length;i++){
			newsIds.push(selectedRows[i].id);
		}
		var ids=newsIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/news/delete.do",{ids:ids},function(result){
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
	
		function addNewsDialog(){
			$("#dlg").dialog("open").dialog("setTitle","添加新闻信息");
			url="${pageContext.request.contextPath}/news/save.do";
		}
		
		function searchNews(){
			$("#dg").datagrid("load",{
				"newsName":$("#s_newsName").val()
			});
		}
		
		function saveNews(){
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
		function modifyNewsDialog(){
			var selectedRows=$("#dg").datagrid("getSelections");
			if(selectedRows.length!=1){
				$.messager.alert("系统提示","请选择<font color=red>1</font>条要修改的数据");
				return;
			}
			
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","编辑新闻信息");
			$("#newsName").val(row.newsName);
			$("#newsContent").val(row.newsContent);
			$("#newsPic").val(row.newsPic);
			url="${pageContext.request.contextPath}/news/save.do?id="+row.id;
		}
		function closeNewsDialog(){
			$("#dlg").dialog("close");
			resetValue();
			
		}
		
		
		function resetValue(){
			$("#newsName").val("");
			$("#newsContent").val("");
			$("#newsPic").val("");
		}
</script>
<title>Insert title here</title>
</head>
<body style="margin:1px">
	<table id="dg" title="新闻管理" class="easyui-datagrid" fitColumns="true"
	pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/news/listajax.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="newsName" width="100" align="center">新闻名称</th>
				<th field="newsContent" width="100" align="center">内容</th>
				<th field="newsPic" width="250" align="center">图片</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:addNewsDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:modifyNewsDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteNews()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			&nbsp;&nbsp;&nbsp;<font color="red">添加News前，请先将News上传至服务器！</font>
		</div>
		<div>&nbsp;新闻名称：<input type="text" name="s_newsName" id="s_newsName" size="10" onKeydown="if (event.keyCode==13) searchNews()"/> 
		<a href="javascript:searchNews()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
<div id="dlg" class="easyui-dialog" style="width: 570px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="8px;">
  		<tr>
  			<td>新闻名称：</td>
  			<td><input type="text" size="60" id="newsName" name="newsName" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>创建内容：</td>
  			<td><input type="text" size="60" id="newsContent" name="newsContent" class="easyui-validatebox"  /></td>
  		</tr>
  		<tr>
  			<td>图片：</td>
  			<td><input type="text" size="60" id="newsPic" name="newsPic" class="easyui-validatebox"  required="true"/></td>
  		</tr>
  	</table>
  </form>
</div>
<div id="dlg-buttons">
	<a href="javascript:saveNews()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeNewsDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>	
</body>
</html> 