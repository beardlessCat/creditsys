/**@author liuyj
 * 对easyUI的各种组件的初始化方法进行封装，以提高代码的可重复利用
 */
  
/**
 * 
 * @param treeName 	 	树标识
 * @param idField   	节点id
 * @param textField		节点名称
 * @param parentField 	上级节点
 * @param url			请求url
 */
function easyUITree(treeName, id, filed, pid, url) {
	$('#' + treeName).tree({
		customAttr : {
			dataModel : 'simpleData',
			idField : id,
			textField : filed,
			parentField : pid
		}
	}).tree('followCustomHandle');
	$.ajax({
		type : 'POST',
		url : url,
		dataType : 'json',
		success : function(data) {
			$('#' + treeName).tree('loadData', data.data);
		},
		error : function() {
			$.messager.alert('提示', '初始化失败!', 'warning');
		}
	});
}
/** 初始化数据格 
 * 参数设置:		gridName  数据格的标识 ，不可为空
 * 				url:请求的路径   		不可为空
 * 				type :GET OR POST   不可为空
 * 				dataType :传递的数据类型 可为空
 * 				jsonData:传递的参数     可为空
 * 				asyncFlag:异步同步提交   可为空
 * 				useMethod:是否使用jsonMessage进行进行数据的传递 可为空，默认为jsonMessage传递
 */
function initDataGrid(gridName, url, type, dataType, jsonData, useMethod,
		asyncFlag) {
	if (asyncFlag == null || asyncFlag == '') {
		asyncFlag = true;
	}
	$.ajax({
		url : url,
		type : type,
		dataType : dataType,
		async : asyncFlag,
		data : {
			'data' : jsonData
		},
		success : function(data) {
			if (useMethod) {
				$("#" + gridName).datagrid("loadData", data.date);
			} else {
				$("#" + gridName).datagrid("loadData", data);
			}

		}
	});
}

/**
 *  添加弹窗
 * @param title  标题
 * @param url    弹框路径url
 * @param width  宽度
 * @param height 高度
 * @param method 保存的方法
 */
function dialogForAdd(title, url, width, height, method) {
	if (method = null || method != '') {
		method = 'doSave';
	}
	$.showModalDialog({
		title : title,
		content : 'url:' + url,
		useiframe : false,//默认false，扩展属性
		width : width,
		height : height,
		toolbar : [ {
			text : '保存',
			iconCls : 'icon-save',
			handler : method
		}, '-', {
			text : '关闭',
			iconCls : 'icon-cancel',
			handler : function(dialog) {
				dialog.close();
			}
		} ],
		onLoad : function(dialog, cotent) {//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
			if (cotent && cotent.doInit) {//判断弹出页面是否加载完，是否有这个方法
				cotent.doInit(dialog);//调用dialog页面的方法
			}
		}
	});
}

/**
 * 编辑弹窗
 * @param index 行标志
 * @param gridName 数据格标识
 * @param title  标题
 * @param url    弹框路径url
 * @param width  宽度
 * @param height 高度
 * @param method 保存的方法
 */
function dialogForEdit(gridName, title, url, width, height, method) {
	var selected = $("#" + gridName).datagrid("getSelections");
	if (selected.length!=1) {
		$.messager.alert('提示', '请选择一条数据进行操作!', 'warning');
		return;
	}
	if (method = null || method != '') {
		method = 'doSave';
	}
	$.showModalDialog({
		title : title,
		content : 'url:' + url,
		useiframe : false,//默认false，扩展属性
		data : {
			grid : $("#" + gridName),
			selected : selected,
		},//扩展属性，给dilog页面传值
		width : width,
		height : height,
		toolbar : [ {
			text : '保存',
			iconCls : 'icon-save',
			handler : method
		}, '-', {
			text : '关闭',
			iconCls : 'icon-cancel',
			handler : function(dialog) {
				dialog.close();
			}
		} ],
		onLoad : function(dialog, cotent) {//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
			if (cotent && cotent.doInit) {//判断弹出页面是否加载完，是否有这个方法
				cotent.doInit(dialog);//调用dialog页面的方法
			}
		}
	});
}
/**ajax提交表单
 * 
 * @param dataUrl  访问url
 * @param datas    提交的数据
 * @param callback 回调函数
 * @param asyncflag 同步异步提交
 */
function doActionForm(dataUrl,datas,callback,dialog,asyncflag){
	if(asyncflag==null||asyncflag==''){
		asyncflag = true;
	}else{
		asyncflag = false;
	}
	$.ajax({
		url : dataUrl,
		type : "POST",
		dataType : 'json',
		async : asyncflag,
		data : {
			'data' : datas
		},
		success : function(data) {
			$.messager.alert('提示','操作成功!','info') ;
			dialog.close() ;
			callback.apply(this, null);  
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) {
			dialog.close() ;
			$.messager.alert('提示','操作失败!','warning');
        }
	});
}
/**
 *  删除数据
 * @param delMark  删除的根据标识(主键)
 * @param gridName 表格名称
 * @param callback 回调函数
 */
function delRes(delMark,gridName,callback,url){
	var nodes = $('#'+gridName).datagrid('getSelections');
	var str ="";
	for(var i = 0;i<nodes.length;i++){
		str += nodes[i][''+delMark+'']+","
	}
	var ids =str.substr(0,str.length-1,url) ;
	$.messager.confirm('提示', '您确认删除所选数据,如果删除将删除其下关联所有数据', function(r) {
		if (r) {
			$.ajax({
				//提交数据的类型 POST GET
				type : "POST",
				//提交的网址
				url : url,
				//提交的数据
				data : 
					{ids:ids},
				//成功返回之后调用的函数             
				success : function(data) {
					$.messager.alert('提示','删除成功','info');
					callback.apply(this, null);  
				},
				//调用出错执行的函数
				error : function() {
					//请求出错处理
					$.messager.alert('删除失败', data.meta.message);
					callback.apply(this, null);  
				}
			});
		}
	});
}
/**初始化combotree
 * 	
 * @param boxName 		组件标识
 * @param idField		节点id
 * @param textField		节点名称
 * @param parentField   上级节点标识
 * @param url			访问url
 */
function initCombotree(boxName,idField,textField,parentId,url){
		$('#'+boxName).combotree({
			editable:false,
			required:true,
			cascadeCheck:false,//取消树级联
			customAttr:{
				dataModel: 'simpleData',
				idField: idField,
	            textField: textField,
	            parentField: parentId
			}
		}).combotree('followCustomHandle');
		$.ajax({
			type : 'post',
	        url: url,
	        dataType:'json',
	        success: function(data){
	            $('#'+boxName).combotree('loadData',data.data);
	        },
	        error: function(){
	            $.messager.alert('提示','初始化失败!','warning');
	        }
		});
	}
/**
 *  原生方发出上海树
 * @param treeName
 * @param url
 */
function commonTree(treeName,url){
	$('#'+treeName).tree({  
        url: url,  
        animate: true,  
        lines : true,  
        checkbox : false,//是否显示复选框  
        onClick: function(node) {  
            //nodeClick(node);  
        },  
        onLoadSuccess: function(data) {  
        }  
    });   
}

function commonComboTree(treeName,url){
	$('#'+treeName).combotree({  
		    url:url,  
		    multiple: false,  
		    lines:true
		});
}