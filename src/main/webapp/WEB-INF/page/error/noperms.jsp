<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE HTML >
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="<%=basePath%>static/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>static/css/error.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="wrap">
		<div class="error">
			<dl style="width:999px;height:500px">
				<dt style="margin-top:170px">您没有权限操作权限！</dt>
				<dd>
					<a href="javascript:;" onclick="window.history.back(); return false;">点击返回上级界面</a>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>