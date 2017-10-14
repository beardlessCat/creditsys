<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<body class="easyui-layout">
<script type="text/javascript">
var tree = null;//表示树  
$(function() {  
    tree = $('#vl');  
    initTree();//初始化树  
    initCombotree() ;
    $('#deptParentId').combotree('setValue','2f83c97cb5464890bba8291b51bd61a8') ;
});  
  
function initTree() {  
     tree.tree({  
        url: 'tree/deptTree',  
        animate: false,  
        lines : true,  
        checkbox : false,//是否显示复选框  
        onClick: function(node) {  
            //nodeClick(node);  
        },  
        onLoadSuccess: function(data) {  
        }  
    });   
}  

function initCombotree(){
	$('#deptParentId').combotree({  
	    url:'tree/deptTree',  
	    multiple: false,  
	    //cascadeCheck: false  
	    //onlyLeafCheck: true  
	});
}
</script>
	 <div style="width: 30%; position: absolute; top: 34px; bottom: 0;">  
        	<table id="deptList"  >
	  				<tr>
						<td class="form-label" align="right">上级组织机构：</td>
						<td class="form-control">			
							<input id="deptParentId"  class="easyui-combotree"   data-options="required:true"  style="width:300px;height:30px">
						</td>
					</tr>
 				</table>	
        
        <ul id="vl" data-options="region:'center',border: true"  
            class="easyui-tree">  
        </ul>  
    </div>  
	</body>
</html>