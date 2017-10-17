<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>" type="text/javascript" >
<script type="text/javascript" src="<%=basePath%>static/easyui-1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/easyui-1.4.2/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/easyui-1.4.2/themes/default/easyui.css"/> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>static/easyui-1.4.2/themes/icon.css"/>
<script type="text/javascript" src="<%=basePath%>static/easyui-1.4.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/jquery.easyui.extension.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/js/jsUtils.js"></script>



<!-- 首页样式 -->		
<link rel="stylesheet" href="<%=basePath%>static/css/default.css">
<link rel="stylesheet" href="<%=basePath%>static/css/style.css">
<link rel="stylesheet" href="<%=basePath%>static/css/menu.css">
<link rel="stylesheet" href="<%=basePath%>static/css/constyle.css">
<link rel="stylesheet" href="<%=basePath%>static/css/dghy_style.css">
<link rel="stylesheet" href="<%=basePath%>static/css/tanchu.css">
<link rel="stylesheet" href="<%=basePath%>static/css/top.css">
<script type="text/javascript">
	function myformatter2(date){
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
	}
</script>




    
    



