<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>上传图片</title>
	<link rel="stylesheet" type="text/css" href="${ctx }/css/photo/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${ctx }/css/photo/demo.css">
	<link href="${ctx }/dist/styles.imageuploader.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="mysesisgn">
<form action="${ctx }/photo/up" method="POST" enctype="multipart/form-data" id="myformid">
<div style="position: relative;">
	<section role="main" class="l-main" style="margin-top:50px;margin-bottom:50px;">
		<div class="uploader__box js-uploader__box l-center-box">
				<div class="uploader__contents">
					<label class="button button--secondary" for="fileinput">请选择文件</label>
					<input name="files" id="fileinput" class="uploader__file-input" type="file" value="Select Files">
				</div>
		</div>
	</section>
</div>
</form>
</div>

	<script src="${ctx }/js/photo/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="${ctx }/dist/jquery.imageuploader.js" type="text/javascript"></script>
	<script type="text/javascript">
	(function(){
		var options = {};
		$('.js-uploader__box').uploader({
			'selectButtonCopy':'请选择或拖拽文件',
			'instructionsCopy':'你可以选择或拖拽多个文件',
			'furtherInstructionsCopy':'你可以选择或拖拽更多的文件',
			'secondarySelectButtonCopy':'选择更多的文件',
		});
	}());
	</script>
</body>
</html>