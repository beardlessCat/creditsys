<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="easyui-layout" data-options="fit:true">
	<table id="restree" calss="easyui-datagrid" style="height: 91%"></table>
</div>	
 <script type="text/javascript">
  		var selected ;
	  	function doInit(dialog){
	  		selected= dialog.getData("selected");
	  		initTree();
	  	}
	  	function initTree(){
	  		$("#restree").treegrid({
	  	            url: 'resultDetial/initPaperInfo',
	  	            idField: 'prId',
	  	            treeField: 'prName',
	  	            lines:true,
	  	          	queryParams:{"data":JSON.stringify({
	  					otherId:selected.paperId,
	  					resultId:selected.resultId,
	  					userLoginName:selected.userLoginName
	  			})},
	  	        	checkOnSelect:true,
	  				striped: true,
	  				border:false,
	  				rownumbers:true, 
	  				onAfterEdit:onAfterEdit,  
	  				onDblClickCell: onClickCell,  
	  	            columns:[[    
	  	              	        {title:'名称',field:'prName',width:'20%',align:'left',halign:'center'},   
	  	              		    {field:'type',title:'类型',width:'15%',align:'center',halign:'center',formatter:foType},    
	  	              	        {field:'detialCore',title:'分值',width:'20%',align:'center',halign:'center',formatter:forCore},  
	  	              	        {field:'rdResult',title:'成绩',width:'20%',align:'center',halign:'center',editor : 'text'}, 
	  	              	    	{field:'rdRate',title:'得分率',width:'20%',align:'center',halign:'center',editor : 'text',formatter:foRate}, 
	  	              	        {field:'rdRanking',title:'排名比',width:'20%',align:'center',halign:'center',editor : 'text',hidden:true} 
	  	              	    ]],
	  	              	    customAttr: {
	  	                       parentField: 'prPid'
	  	                   }
	  	               }).treegrid('followCustomHandle');      
	  	     
	  	}
	  	function forCore(v,row,rowIndex){
	  		if(row.type=='3') return v; 
	  	}
	  	function foType(value){
	  		if(value=="1") return '试卷';
	  		if(value=='2')return '大题';
	  		if(value="3") return '小题';
	  	}
	  	function foRate(v,row,rowIndex){
	  		if(row.type=='3'){
	  		var all = parseInt(row.detialCore);
	  		var incore = parseInt(row.rdResult) ;
	  		return incore/all;
	  		}
	  	}
	  	function initUsercombo(){
	  			$('#userId').combobox({    
	  			    url:'user/initCobbobox',    
	  			    valueField:'id',    
	  			    textField:'text'   
	  			});  
	  			}
	  	function initComBoBox(){
	  		$('#paperId').combobox({    
	  			    url:'paper/initCobbobox',    
	  			    valueField:'id',    
	  			    textField:'text'   
	  			});  
	  	}
	  	function doSave(dialog){
  			$.ajax({
  				type : "POST",
  				//提交的网址
  				url : "resultInfo/add",
  				datatype:"json",
  				//提交的数据
  				data :{
  					"data":JSON.stringify({
  						"riPaperId":$('#paperId').combobox('getValue'),
  		 				"riUserId": $("#userId").combobox("getValue"),
  						"riResult":$('#riResult').textbox('getValue'),
  						"riRate":$('#riRate').textbox('getValue')						
  						})					
  					},
  				//成功返回之后调用的函数             
  				success : function(data) {
  					if(data.meta.success){
  						$.messager.alert('提示','保存成功!','warning');
  						dialog.getData('grid').datagrid('reload');
  		           		dialog.close();
  		               }else{
  		                   $.messager.alert('error', 'error');
  		               }
  				},
  				//调用出错执行的函数
  				error: function(XMLHttpRequest, textStatus, errorThrown) {
  					$.messager.alert('提示','保存失败!','warning');
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }

  			});
  		}
	  	function vailNull(){        
			var projectName =$('#projectName').textbox('getValue')  ? true : false;
			var state=$('#state').combobox('getValue')  ? true : false;
			var dept=$('#dept').combotree('getValue')  ? true : false;
			var creator=$('#creator').textbox('getValue')  ? true : false;
			var createTime=$('#createTime').textbox('getValue')  ? true : false;
			var mapParam=$('#mapParam').textbox('getValue')  ? true : false;
			return (projectName && state && dept && creator && createTime && mapParam );
		}
	  	var editingId;
	  	function endEditing() {//该方法用于关闭上一个焦点的editing状态  
	  	    if (editingId == undefined) {  
	  	        return true  
	  	    }  
	  	    if ($('#restree').treegrid('validateRow', editingId)) {  
	  	        $('#restree').treegrid('endEdit', editingId);  
	  	        editingId = undefined;  
	  	        return true;  
	  	    } else {  
	  	        return false;  
	  	    }  
	  	}  
	  	function onClickCell(field,row) { 
	  		if (endEditing()) { 
	  			editingId = row.prId;
	  			$('#restree').treegrid('beginEdit', editingId);
	  		} 
	  	}
	  	function onAfterEdit(row,changes) {
	  		 editInfo(row);
	  	}
	  	function editInfo(row){
	  		 $.ajax({
	  				type : "POST",
	  				//提交的网址
	  				url : "resultDetial/editDetial",
	  				datatype:"json",
	  				//提交的数据
	  				data :{
	  					"data":JSON.stringify({
	  		 				"rdResult":row.rdResult,
	  		 				"rdRate":row.rdRate,
	  		 				"rdRanking":row.rdRanking,
	  		 				"rdId":row.rdId
	  						})					
	  					},
	  				error: function(XMLHttpRequest, textStatus, errorThrown) {
	  					$.messager.alert('提示','保存失败!','warning');
	  	            alert(XMLHttpRequest.status);
	  	            alert(XMLHttpRequest.readyState);
	  	            alert(textStatus);
	  	        }
	  	});
	  	}
 </script>
