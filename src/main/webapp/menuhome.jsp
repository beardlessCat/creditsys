<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/commonJs.jsp"%> 

<%@ page import="org.springframework.context.ApplicationContext" %>
<%
		String id = request.getParameter("id");
		String i = request.getParameter("i");
%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>多规合一智慧政务平台</title>		
		
		<style type="text/css">
			.layout-split-west .panel-header{
				background:#6a869b;
				height:25px;
				position:relative;
			}
			.layout-split-west .panel-title{
				  color: #ffffff;
				  position:absolute;
				  top:25%;
			}
			.layout-expand-west{
				background:#1283b4;
			}
			.accordion-body{
				background-color:#cee9ff;
			}
			.accordion .accordion-header{
				background:#1283b4;
				height:25px;
			}
			.accordion .accordion-header-selected {
				  background:#1283b4;
			}
 			.accordion .panel-title{
				  color: #ffffff;
				  position:absolute;
				  top:25%;
			}
			.accordion .accordion-header-selected .panel-title {
  				color: #ffffff;
			} 
			#wnav{
				background:#cee9ff;
			}
			 .icon-nav{
			background:url('<%=basePath%>static/img/ico_nav.png') no-repeat center center;
			}
			.icon-menu{
				background:url('<%=basePath%>static/img/menufile3.png') no-repeat center center;
			}
			.icon-smenu{
				background:url('<%=basePath%>static/img/meunfile1.png') no-repeat center center;
			} 
		</style>
		
		<script type="text/javascript">
		function addMenuAndMain(node){
			if(node){
				$("body").layout("add",{
					region: 'west',    
					width: 250,    
					title: node.RES_NAME,    
					split: true,
					iconCls:"icon-nav",
					content:"<div id='wnav' class='easyui-accordion' fit='true' border='false'></div>",
				});
			}
		}
		
		/**
		 * 菜单项鼠标Hover
		 */
		 function hoverMenuItem() {
			$(".easyui-accordion").find('a').hover(function() {
				$(this).parent().addClass("hover");
			}, function() {
				$(this).parent().removeClass("hover");
			});
		}
		
		function addNav(data) {
			$.each(data, function(i, sm) {
				var menulist = "";
				menulist += '<ul style="background:#a4d6ff;padding:0px">';
				$.each(sm.menus, function(j, o) {
					var u = o.url +'?resId='+o.menuid ;
					menulist += '<li style="border-top:1px #66c7cc solid;"><div><a ref="' + o.menuid + '" href="#" rel="'
							+ u + '" ><span class="icon-menu" >&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;<span class="nav">' + o.menuname
							+ '</span></a></div></li> ';
				});
				menulist += '</ul>';
				$('#wnav').accordion('add', {
					title : sm.menuname,
					content : menulist,
					iconCls : 'icon-smenu'
				});
			});
			var pp = $('#wnav').accordion('panels');
			var t = pp[0].panel('options').title;
			$('#wnav').accordion('select', t);

			$('#wnav li a').click(function() {
				var tabTitle = $(this).children('.nav').text();
				console.log("url------------>"+url);
				var url = $(this).attr("rel");
				addTab(tabTitle, url);
				$('#wnav li div').removeClass("selected");
				$(this).parent().addClass("selected");
				return false;
			}); 
		}
	
	 	function addTab(tabTitle, url){
	 		
			var $tabs = $('#workspace');
            if($tabs.tabs('exists', tabTitle)){
                $tabs.tabs('select', tabTitle);
                return;
            }
            if(url){
            	if(url.indexOf("/")==0){
            		url=url.substr(1);
				}
            	if(url.indexOf("http")==-1){
            		url="<%=basePath%>"+url;
            	}
            	console.log(url);
				$tabs.tabs('add',{
                    title: tabTitle,
                    useiframe: true,//宽展属性，把tab放到iframe里
                    closable: true,
                    content:'url:' + url
                });
            }
            /* 双击关闭TAB选项卡 */
        	$(".tabs-inner").dblclick(function() {
        		var subtitle = $(this).children(".tabs-closable").text();
        		$tabs.tabs('close', subtitle);
        	});
		}
		$(function(){
			window.myTabs = $("#workspace").tabs({
				fit:true,
				border:false,
				plain:true
			});
			
			var menuTreeData = parent.menuTreeData;
			var menuData = parent.menuData;
			var id = "<%=id%>";
			var i = "<%=i%>";
			
			addMenuAndMain(menuTreeData[i]);
			addNav(menuData[id]);
			hoverMenuItem();
		});
		function createFrame(url) {
			var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
			return s;
		}

		</script>
	</head>
<body  class="easyui-layout">
	 <div region="center" split="true">
		<div class="easyui-tabs" id="workspace">
			 <div title="欢迎使用本系统！" style="padding:20px;overflow:hidden;" id="home">
			<!-- <h1>Welcome to using The jQuery EasyUI!</h1> -->
			</div> 
	    </div>
	</div>
	</div>
</body>
</html>