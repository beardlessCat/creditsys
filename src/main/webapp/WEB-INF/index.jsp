<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import ="com.creidtsys.utils.ShiroUtils" %>

<%
	String userNo = ShiroUtils.getLoginName() ;
%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<style type="text/css">
.icoImg01{background:url(<%=basePath%>static/img/quert.png) no-repeat; width:16px; height:16px; margin-top:4px;}
</style>
<script type="text/javascript">
$(function(){
	//loadPanel("http://localhost:8036/authorUser/recommendCourse/getIndex");  ------- 加载主页
})
var menuTreeData=[]; //一级菜单数据
var menuData;//二级，三级菜单数据
var id ;
var logoutUrl="logout/cas?service=http://localhost:36/authorUser"
function logout(obj){
  	$('#topMenu').find('li.active').removeClass('active');
	$(obj).parent().addClass('active');
	window.location.href=logoutUrl;
}	
function initMenu(){
 	$.ajax({
		url:'sysUserRes/getAuthMenu',
		method:'POST',
		dataType:'json',
		data:{
			userNo:	id
		},
		success:function(result){//返回数组
			if(result.meta.success){
				menuTreeData=result.data[0].firstlevelmenu;
				menuData = eval("(" +result.data[0].menu+")");
				for(i in menuTreeData){
					var liStr='<li><a href="Javascript:void(0)" onclick="mainNavClick(this)" id="'+menuTreeData[i].RES_ID+'">'+menuTreeData[i].RES_NAME+'</a></li>';
					$("#mainMenu").append(liStr);
				}
			}else{
				$.messager.alert('error', result.meta.message, 'error');
			}
		},
		error:function(){
			$.messager.alert('error','查询菜单失败','error');
		}
	}); 
}
$(function(){
	id = '<%=userNo%>' ;
	initMenu();

});
//点击按钮
function mainNavClick(obj){
	var jq=$(obj);
    $("body").layout("remove",'west');
	$('#mainMenu').find('li.active').removeClass('active');
	jq.parent().addClass('active');
	var id=jq.attr('id');
	if("first"==id){
		loadPanel("http://localhost:8036/authorUser/recommendCourse/getIndex");
		return;
	}
	for(i in menuTreeData){
		if(id==menuTreeData[i].RES_ID){
			loadPanel("menuhome.jsp?id="+id+"&i="+i);
			break;
		}
	}
}
//加载左侧手风琴菜单
function loadPanel(url){
	$("#iframe").attr("src",url);
}
</script>
</head>
<body  class="easyui-layout">
	  <div style="height: 88px; padding: 0; margion: 0; overflow: hidden; " region="north" split="false">
	  <div class="mainTime">
		<div id="jnkc" class="dghytime"></div>
	    <script>setInterval("jnkc.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</script>
	    <div class="manger"><a class="icoImg01"></a><a><%=userNo%></a><a></a>  <a class="icoImg02" href="javascript:void(0)"  onclick="logout(this)"></a><a href="javascript:void(0)"  onclick="logout(this)">退出</a></div>
	  </div>
	  <div class="dghymainTop">
		<div class="dghymainTop_menu">
	        <div class="dghylogo" style="margin-top:13px;"><!-- <img src="static/img/logo.png"/> --></div>
	        <div class="dghylogo2" >权限系统</div>   
	     </div>
	     <div class="dghytopNav">
	       	<ul id='mainMenu'>
 	         <!--   <li class="active"><a href="javascript:void(0)" onClick="mainNavClick(this)" id='first'>首 页</a></li> -->
	        </ul>
	     </div>
	  </div>
	</div>
	<div region="center" split="true">
	    <iframe id="iframe"  scrolling="no" frameborder="0" src="" style="width:100%;height:99.5%;"></iframe>
	</div>
	</body>
</html>