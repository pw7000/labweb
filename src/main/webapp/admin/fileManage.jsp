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
<body>
<form action="${pageContext.request.contextPath}/file/uploadPic.do" method="post" enctype="multipart/form-data">
	<div>
		<h2>学生照片上传</h2>
		<p>
			<input type="file" name="file"/>
		</p>   
		<p><input type="submit" value="上传文件"/></p> 
		
	</div>
</form>

<form action="${pageContext.request.contextPath}/file/uploadFile.do" method="post" enctype="multipart/form-data">
	<div>
		<h2>News上传</h2>
		<p>
			<input type="file" name="file"/>
		</p>   
		<p><input type="submit" value="上传文件"/></p> 
		
	</div>
</form>

	<form action="${pageContext.request.contextPath}/file/uploadInstrument.do"
		method="post" enctype="multipart/form-data">
		<div>
			<h2>Instrument上传</h2>
			<p>
				<input type="file" name="file" />
			</p>
			<p>
				<input type="submit" value="上传文件" />
			</p>

		</div>
	</form>



	<form action="${pageContext.request.contextPath}/file/downloadFile.do" method="post" enctype="multipart/form-data">
	<div>
		<h2>资料下载</h2>
		<p>
			<input type="file" name="file"/>
		</p>   
		<p><input type="submit" value="上传文件"/></p> 
		
	</div>
</form>
</body>
</html> 
