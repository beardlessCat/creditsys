<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="easyui-layout" data-options="fit:true" style="width: 800px;margin-top:10px;margin-left:10px;margin-right:10px;">
	<div data-options="region:'west',border:true" class="easyui-panel" style="width: 800px" id="info">
  			<!-- <h1 style="font-size: 20px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;"><strong>山东建筑大学</strong><br/></h1>
  			
  			<p style="line-height: 2em;"><strong>公司地址：</strong>济南历城区<strong><br/></strong></p>
  			
  			<p style="line-height: 2em;"><strong>公司电话：</strong>18865947337</p>
  			
  			<p style="line-height: 2em;"><strong>公司网址：<a target="_blank" href="http://baike.baidu.com/" style="white-space: normal; color: rgb(19, 110, 194); text-decoration: none;">山东建筑工程学院</a></strong></p>
  			
  			<p style="line-height: 2em;"><strong>公司详情：</strong></p><p style="line-height: 2em;">&nbsp;&nbsp;&nbsp;&nbsp;无线手持设备的范围从简单的单、双向短信设备上网功能的掌上电脑，平板电脑，智能手机。这些设备不再被视为令人垂涎的小工具，早期技术的采用。相反，它们已经成为移动劳动力不可或缺的工具和具有竞争力的业务优势.。这些设备的使用引入了新的安全风险，一个机构现有的网络。此外，由于这些设备开始有自己的IP地址，设备本身可以成为攻击的目标。手持设备有不同的功能和不同的用途，从台式机和笔记本电脑。手持设备和台式机和笔记本电脑之间的差异，影响机构的安全性总结如下。
			</p><p style="line-height: normal;"><br/></p> -->
  	</div>
  	</div>
  	<script type="text/javascript">
  		 var selected ;
  		 var companyName ;
  		 var  companyAddress ;
  		 var companyTel ;
  		 var companyInfo ;
  		 var companyUrl ;
	  	function doInit(dialog){
	  		selected= dialog.getData("selected");
	  		companyName =selected.companyName ;
	  		companyAddress =selected.companyAddress;
	  		companyTel =selected.companyTel ;
	  		companyInfo=selected.companyInfo ;
	  		companyUrl = selected.companyUrl;
	  		 var companyNames ='<h1 style="font-size: 20px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;"><strong>'+companyName+'</strong><br/></h1>';
	  	  	 var companyAddresss='<p style="line-height: 2em;"><strong>公司地址：</strong>'+companyAddress+'<strong><br/></strong></p>';
	  	  	 var companyTels ='<p style="line-height: 2em;"><strong>公司电话：</strong>'+companyTel+'</p>';
	  	  	 var companyInfos='<p style="line-height: 2em;"><strong>公司详情：</strong></p><p style="line-height: 2em;">&nbsp;&nbsp;&nbsp;&nbsp;'+companyInfo+'</p><p style="line-height: normal;"><br/></p> ';
	  	  	 var companyUrls ='<p style="line-height: 2em;"><strong>公司网址：<a target="_blank" href=http://'+companyUrl+' style="white-space: normal; color: rgb(19, 110, 194); text-decoration: none;">'+companyUrl+'</a></strong></p>';

	  		initHtml(companyNames,companyAddresss,companyTels,companyInfos,companyUrls);
	  	}
	
	 function initHtml(companyName,companyAddress,companyTel,companyInfo,companyUrl){
		 var str = companyName+companyAddress+companyTel+companyUrl+companyInfo;
		 $("#info").append(str);
	 }
  	 </script>
