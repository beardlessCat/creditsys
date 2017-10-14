$(function(){
	//获取焦点
	$("#inputObj").focus(function(){
		if($("#inputObj").val()=="请输入关键字"){ 
			$("#inputObj").val('') ;
		}
	});
	//失去焦点
	$("#inputObj").blur(function(){
		var value = $("#inputObj").val() ;
		if(value.length==0||value==null){
			$("#inputObj").val('请输入关键字') ;
		}
	});
	initNotice(getContextPath());
}) ;
//获取工程根路径
function getContextPath(){     
    var pathName = document.location.pathname;     
    var index = pathName.substr(1).indexOf("/");     
    var result = pathName.substr(0,index+1);     
    return result;     
}   
/*
 	<li style="list-style-type:none; " >
		<p class="hid">
			<a href=""  style="font-size:15px;color:#666666;">8月20号唱响东方活动</a>
		</p>
	</li>
*/

/*
 	<li style="list-style-type:none;">
		<p class="hid">
			<strong style="letter-spacing:5px;">·</strong>
			<a href="" style="font-size:16px;">8月20号唱响东方活动</a>
		</p>
	</li>
  
 */
//ajax 初始化html
function initNotice(path){
	$.ajax({
		url : path+"/initNotice",
		type : 'POST',
		dataType : 'json',
		async : true,
		success : function(data) {
			if(data.result=="success"){
				console.log(data.news) ;
				var notice = "";
				var str = "";
				for(var i = 0;i<data.news.length;i++){
					str +=  '<li style="list-style-type:none; ">' ;
					str +=  	'<p class="hid">' ;
					str +=  		'<a href=""   style="font-size:15px;">'+data.news[i]+'</a>' ;
					str +=  	'</p>' ;
					str +=   '</li>' ;
					
					notice +='<li style="list-style-type:none;">' ;
					notice += 	'<p class="hid">' ;
					notice += 		'<strong style="letter-spacing:5px;">·</strong><a href="" style="font-size:15px;">'+data.news[i]+'</a>';
					notice += 	 '</p>' ;
					notice += '</li>' ;
				}
				$('#noticeUl').append(str) ;
				$('#infoUl').append(notice) ;
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			 alert(XMLHttpRequest.status);
			 alert(XMLHttpRequest.readyState);
			 alert(textStatus);
		}
	});
}