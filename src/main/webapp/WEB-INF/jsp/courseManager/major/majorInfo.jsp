<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="content" style="color: #666666;background-color: #f5efef;">
		<p style="font-size:32px;margin: 0 0 15px 0;color:#795548" id='title'></p>
		<div class="summer" label-module="lemmaSummary">
			<div class="para" label-module="para" id='majorOverview'></div>
			</div>
		<div class="baseInfo">
			<dl class="baseInfo-left">
				<dt class="item-name" >中文名</dt>
				 <dd class="item-value" id="majorName"></dd> 
				<dt class="item-name" >专业代码</dt>
				<dd class="item-value" id="majorCode"></dd> 
			</dl>
			<dl class="baseInfo-right">
				<dt class="item-name">英文名字</dt>
				<dd class="item-value" id="majorEnglishName"></dd>
				<dt class="item-name">授予学位</dt>
				<dd class="item-value" id="majorDegree"></dd> 
				<dt class="item-name">修学年限</dt>
				<dd class="item-value" id="majorLength"></dd>
			</dl>
		</div>
		<div class="level" label-module="para-title">
			<h2 class="text" >专业条件</h2>
		</div>
		<div class="para" label-module="para" id='majorCondition'></div>
		<div class="level" label-module="para-title">
			<h2 class="text">专业目标</h2>
		</div>
		<div class="para" label-module="para" id='majorPurpose'></div>
	</div>
<script type="text/javascript">
  	function doInit(dialog){
  		var selected= dialog.getData("selected");
  		$('#majorName').append(selected.majorName) ;
  		$('#majorOverview').append(selected.majorOverview) ;
  		$('#majorCondition').append(selected.majorCondition) ;
  		$('#title').append(selected.majorName) ;
  		$('#majorCode').append(selected.majorCode) ;
  		$('#majorEnglishName').append(selected.majorEnglishName) ;
  		$('#majorDegree').append(selected.majorDegree) ;
  		$('#majorLength').append(selected.majorLength) ;
  		$('#majorPurpose').append(selected.majorPurpose) ;
  	}
</script>