<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>editor</title>  
    <style type="text/css">
        div{
            width:100%;
        }
    </style>
    <script type="text/javascript" charset="utf-8">
   		 var ue =UE.getEditor('content')
   		  function getContent() {
	        var arr = [];
	        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
	        arr.push("内容为：");
	        arr.push(UE.getEditor('content').getContent());
	        console.log(arr) ;
	   }
    </script>
</head>
<body>
	<div data-optopns="region:center,title:'内容'">
		<textarea id="content" name="comtent" style="width:800px;height:60%;"></textarea>
	</div>
	<div id="btns">
    	<div>
            <button onclick="getContent()">获得内容</button>
        </div>
     </div>
     <div>
		<table><tbody><tr class="firstRow"><td width="379" valign="top" style="word-break: break-all;">w</td><td width="379" valign="top"><br/></td><td width="379" valign="top"><br/></td></tr><tr><td width="379" valign="top"><br/></td><td width="379" valign="top" style="word-break: break-all;">ww</td><td width="379" valign="top" style="word-break: break-all;">&nbsp; ww</td></tr></tbody></table><p style="text-align: center;"><span style="color: rgb(255, 0, 0);">我和我交</span><br/></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);">搜索</span></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);">听取</span></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);"><br/></span></p><p><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;可以<br/></span></p>
     </div>
</body>

</html>