<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String url = request.getRequestURL().toString();
	url = url.substring(0, url.indexOf('/', url.indexOf("//") + 2));
	String context = request.getContextPath();
	url += context;
	application.setAttribute("ctx", url);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<script type="text/javascript" src="${ctx}/static/easyui-1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui-1.4.2/jquery.easyui.min.js"></script>


<style>
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body background=""style="background-color:#002c4c; background-repeat:no-repeat ;background-size:100% 100%; background-attachment:fixed;">
	<form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
		  
		<table style="width: 1000px;border: 0px;position:relative;left:50%;margin-left:-500px;" cellpadding="0" cellspacing="0">
		  <tr>
		    <td style="vertical-align:top;background-image:url(${ctx}/static/img/login.jpg);height: 700px;">
			    <table style="width: 264px;border: 0px;margin-top:305px; margin-left:148px;" cellspacing="0" cellpadding="0">
			      <tr>
			        <td style="width: 50px;height: 37px;vertical-align:right;     font-size: 14px;line-height: 32px;color: #FFF;"  class="login_txt">用户：</td>
			        
			      </tr>
			      <tr>
			        <td style="height:35px;vertical-align:right;    font-size: 14px;line-height: 32px;color: #FFF;" class="login_txt">密码：</td>
			       
			      </tr>
			      <tr>
			        <td style="height:50px;vertical-align:right;" colspan="2" ><table style="width: 200px;border: 0px;position:relative;left:25%;margin-top:20px;" cellspacing="0" cellpadding="0">
			          <tr>
			            <td style="width:113px;height: 28px;vertical-align:right;">
			            	<img onclick="login();" src="${ctx}/static/img/dl.png" style="width: 80px;height: 34px;" >
			            </td>
			            <td style="width: 87px;vertical-align:right;">
			            	<img onclick="rest();" src="${ctx}/static/img/cz.png" style="width: 80px;height: 34px;">
			            </td>
			          </tr>
			        </table></td>
			      </tr>
			    </table></td>
		  </tr>
		</table>
			<div class="row btn-row">
					<input type="hidden" name="lt" value="${loginTicket}" />
					<input type="hidden" name="execution" value="${flowExecutionKey}" />
					<input type="hidden" name="_eventId" value="submit" />

					<!--
					<input class="btn-submit" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
					-->
				</div>
	</form:form>
	<div style="vertical-align: top;background-image: url(${ctx}/static/img/login.jpg);height: 700px;     width: 1000px; border: 0px;position: relative;left: 50%;margin-left: -500px;">
	<div  style="    position: relative; top: -392px; left: 205px;">
		<form action="${ctx}/sysUser/checkLogin" method="post" id="ff">
			<input type="text" name="username" style="height:25px;    background: transparent; border-top-style: none; border-right-style: none;border-bottom-style: none;border-left-style: none;color: #FFF;margin-top:1px;"><br>
			<input type="password" name="password"  style="height:25px;background: transparent; border-top-style: none; border-right-style: none;border-bottom-style: none;border-left-style: none;color: #FFF;margin-top:10px;">
		</form>
	</div>
	</div>
</body>
<script type="text/javascript">
			
			function login(){
				var str_username = $("#username").val();
				var str_password = $("#password").val();
				if(str_username==""){
					alert('必须录入用户名。');
					$("#username").focus();
					return;
				}
				
				if(str_password==""){
					alert('必须录入密码。');
					$("#password").focus();
					return;
				}
				
				$("#ff").submit();
			}
		</script>
			
		
</html>