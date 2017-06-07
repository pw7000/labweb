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
	function deletePaper(){
		var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的记录");
			return;
		}
		var paperIds=[];
		for(var i=0;i<selectedRows.length;i++){
			paperIds.push(selectedRows[i].id);
		}
		var ids=paperIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/paper/delete.do",{ids:ids},function(result){
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
	
		function addPaperDialog(){
			$("#dlg").dialog("open").dialog("setTitle","添加链接信息");
			url="${pageContext.request.contextPath}/paper/save.do";
		}
		
		function searchPaper(){
			$("#dg").datagrid("load",{
				"paperName":$("#s_paperName").val()
			});
		}
		
		function savePaper(){
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
		function modifyPaperDialog(){
			var selectedRows=$("#dg").datagrid("getSelections");
			if(selectedRows.length!=1){
				$.messager.alert("系统提示","请选择<font color=red>1</font>条要修改的数据");
				return;
			}
			
			var row=selectedRows[0];
			$("#dlg").dialog("open").dialog("setTitle","编辑文章信息");
			$("#paperName").val(row.paperName);
			$("#paperAuthors").val(row.paperAuthors);
			$("#publication").val(row.publication);
			$("#href").val(row.href);
			url="${pageContext.request.contextPath}/paper/save.do?id="+row.id;
		}
		function closePaperDialog(){
			$("#dlg").dialog("close");
			resetValue();
			
		}
		function exportPaper(){
			window.open("${pageContext.request.contextPath}/paper/export.do");
		}
		
		function exportPaper2(){
			window.open("${pageContext.request.contextPath}/paper/export2.do");
		}
		
		function openUploadFileDialog(){
			$("#dlg2").dialog('open').dialog('setTitle','批量导入数据');
		}
		
		function uploadFile(){
			$("#uploadForm").form("submit",{
				success:function(result){
					var result=eval('('+result+')');
					if(result.errorMsg){
						$.messager.alert("系统提示",result.errorMsg);
					}else{
						$.messager.alert("系统提示","上传成功");
						$("#dlg2").dialog("close");
						$("#dg").datagrid("reload");
					}
				}
			});
		}
		
		function downloadTemplate(){
			window.open('template/paperImportTemplate.xls');
		}
		function resetValue(){
			$("#paperAuthor").val("");
			$("#paperTitle").val("");
			$("#paperSource").val("");
		}
</script>
<title>Insert title here</title>
</head>
<body style="margin:1px">
	<table id="dg" title="文章管理" class="easyui-datagrid" fitColumns="true"
	pagination="true" rownumbers="true" url="${pageContext.request.contextPath}/paper/listajax.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="paperName" width="100" align="center">文章标题</th>
				<th field="paperAuthors" width="100" align="center">文章作者</th>
				<th field="publication" width="250" align="center">文章来源</th>
				<th field="href" width="250" align="center">链接</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:addPaperDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:modifyPaperDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deletePaper()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
			<!-- <a href="javascript:exportPaper()" class="easyui-linkbutton" iconCls="icon-export" plain="true">导出文章</a> -->
			<a href="javascript:exportPaper2()" class="easyui-linkbutton" iconCls="icon-export" plain="true">用模板导出文章</a>
			<a href="javascript:openUploadFileDialog()()" class="easyui-linkbutton" iconCls="icon-import" plain="true">用膜板批量添加文章</a>
			
		</div>
		<div>&nbsp;文章标题：<input type="text" name="s_paperName" id="s_paperName" size="10" onKeydown="if (event.keyCode==13) searchPaper()"/> 
		<a href="javascript:searchPaper()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>
<div id="dlg" class="easyui-dialog" style="width: 570px;height: 300px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post">
  	<table cellspacing="8px;">
  		<tr>
  			<td >文章标题：</td>
  			<td ><input type="text" size="60" id="paperName" name="paperName" class="easyui-validatebox"  required="true"/></td>
  		</tr>
  		<tr >
  			<td >文章作者：</td>
  			<td ><input type="text" size="60" id="paperAuthors" name="paperAuthors" class="easyui-validatebox"  required="true"/></td>
  		</tr>
  		<tr >
  			<td >文章来源：</td>
  			<td><input type="text" size="60" id="publication" name="publication" class="easyui-validatebox"  required="true"/></td>
  		</tr>
  		<tr>
  			<td>文章链接：</td>
  			<td><input type="text" size="60" id="href" name="href" class="easyui-validatebox"  required="true"/></td>
  		</tr>
  	</table>
  			
  </form>
</div>
<div id="dlg-buttons">
	<a href="javascript:savePaper()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closePaperDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>	

<div id="dlg2" class="easyui-dialog" style="width:400px;height:180px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons2">
        <form id="uploadForm" action="user!upload" method="post" enctype="multipart/form-data">
        	<table>
        		<tr>
        			<td>下载模版：</td>
        			<td><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="downloadTemplate()">导入模版</a></td>
        		</tr>
        		<tr>
        			<td>上传文件：</td>
        			<td><input type="file" name="paperUploadFile"></td>
        		</tr>
        	</table>
        </form>
	</div>
    
	<div id="dlg-buttons2">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="uploadFile()">上传</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg2').dialog('close')">关闭</a>
	</div>
</body>
</html> 