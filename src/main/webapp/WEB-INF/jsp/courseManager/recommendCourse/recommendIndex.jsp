<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/commonJs.jsp"%> 
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<head>
<head>
    <meta charset="utf-8">
</head>
<body>
<script id="code">
  function init() {
    if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
    var $ = go.GraphObject.make;  // for conciseness in defining templates in this function
    myDiagram =
      $(go.Diagram, "myDiagramDiv",  // must be the ID or reference to div
        { initialContentAlignment: go.Spot.Center });
    
     myDiagram2 =
        $(go.Diagram, "myDiagramDiv2",  // must be the ID or reference to div
          { initialContentAlignment: go.Spot.Center });
 
    // define all of the gradient brushes
  	 var graygrad = $(go.Brush, "Linear", { 0: "#F5F5F5", 1: "#F1F1F1" });
    var bluegrad = $(go.Brush, "Linear", { 0: "#CDDAF0", 1: "#91ADDD" });
    var yellowgrad = $(go.Brush, "Linear", { 0: "#FEC901", 1: "#FEA200" });
    var lavgrad = $(go.Brush, "Linear", { 0: "#EF9EFA", 1: "#A570AD" });
    // define the Node template for non-terminal nodes
    myDiagram.nodeTemplate =
      $(go.Node, "Auto",
        { isShadowed: true },
        // define the node's outer shape
        $(go.Shape, "RoundedRectangle",
          { fill: graygrad, stroke: "#D8D8D8" },
          new go.Binding("fill", "color")),
        // define the node's text
        $(go.TextBlock,
          { margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif" },
          new go.Binding("text", "key"))
      );
     myDiagram2.nodeTemplate =
        $(go.Node, "Auto",
          { isShadowed: true },
          // define the node's outer shape
          $(go.Shape, "RoundedRectangle",
            { fill: graygrad, stroke: "#D8D8D8" },
            new go.Binding("fill", "color")),
          // define the node's text
          $(go.TextBlock,
            { margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif" },
            new go.Binding("text", "key"))
        );
 
    myDiagram.linkTemplate =
      $(go.Link,  // the whole link panel
        { selectable: false },
        $(go.Shape));  // the link shape
        myDiagram2.linkTemplate =
            $(go.Link,  // the whole link panel
              { selectable: false },
              $(go.Shape));  // the link shape 
              
        
       /*  myDiagram.model = new go.TreeModel([
            { key: "Root" },
            { key: "Left1", parent: "Root", dir: "left", text:"ddd"},
            { key: "leaf1", parent: "Left1" ,dir: "left",text:"yyy"},
            { key: "leaf2", parent: "Left1" , dir: "left"},
            { key: "Left2", parent: "Left1",  dir: "left"},
            { key: "leaf3", parent: "Left2" ,  dir: "left"},
            { key: "leaf4", parent: "Left2" , dir: "left"}
          
      ]);     */
    	//getData(myDiagram) ;
      // doubleTreeLayout(myDiagram,root);  
 }

  function doubleTreeLayout(diagram,root) {
    var $ = go.GraphObject.make;  // for conciseness in defining templates
    diagram.startTransaction("Double Tree Layout");

    var leftParts = new go.Set(go.Part);
    var rightParts = new go.Set(go.Part);
    separatePartsByLayout(diagram, leftParts, rightParts,root);
    var layout1 =
      $(go.TreeLayout,
        { angle: 180,
          arrangement: go.TreeLayout.ArrangementFixedRoots,
          setsPortSpot: false });

    var layout2 =
      $(go.TreeLayout,
        { angle: 0,
          arrangement: go.TreeLayout.ArrangementFixedRoots,
          setsPortSpot: false });

   	layout1.doLayout(leftParts);
    layout2.doLayout(rightParts);

    diagram.commitTransaction("Double Tree Layout");
  }

  function separatePartsByLayout(diagram, leftParts, rightParts,root) {
    var root = diagram.findNodeForKey(root);
    if (root === null) return;
    // the ROOT node is shared by both subtrees!
    leftParts.add(root);
    rightParts.add(root);
    // look at all of the immediate children of the ROOT node
    root.findTreeChildrenNodes().each(function(child) {
        // in what direction is this child growing?
        var dir = child.data.dir;
        var coll = (dir === "left") ? leftParts : rightParts;
        // add the whole subtree starting with this child node
        coll.addAll(child.findTreeParts());
        // and also add the link from the ROOT node to this child node
        coll.add(child.findTreeParentLink());
      });
  }
$(function(){
	$('#start').bind('click', function(){
		//var chooseType = $("#chooseType").combobox("getValue");
		$.showModalDialog({
            title: '选择职位',
            content:'url:recommendCourse/listTree',   
            useiframe:false,//默认false，扩展属性
            width:'800px',
            height:'80%',
            toolbar:[{
                text:'保存',
                iconCls:'icon-save',
                handler: 'doSave'
            },'-',{
                text: '关闭',
                iconCls: 'icon-cancel',
                handler: function(dialog){
                    dialog.close();
                }
            }],
            onLoad: function(dialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
                if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
                    cotent.doInit(dialog);//调用dialog页面的方法
                }
            }
        }); 
	})
})
function choose(){
	$.showModalDialog({
        title: '选择职位',
        content:'url:recommendCourse/listTree',   
        useiframe:false,//默认false，扩展属性
        width:'800px',
        height:'80%',
        toolbar:[{
            text:'保存',
            iconCls:'icon-save',
            handler: 'doSave'
        },'-',{
            text: '关闭',
            iconCls: 'icon-cancel',
            handler: function(dialog){
                dialog.close();
            }
        }],
        onLoad: function(dialog, cotent){//参数扩展，dialog表示弹出页面，cotent表示弹出页面的body
            if(cotent && cotent.doInit){//判断弹出页面是否加载完，是否有这个方法
                cotent.doInit(dialog);//调用dialog页面的方法
            }
        }
    }); 
}
</script>
</head>
<body onload="init()" class="easyui-layout">
<div data-options="region:'center',tools:'#treeTools'"  title="所选职位课程关系" style="width:50%;">	
		<div >
		</div>
  <div  id="myDiagramDiv" style="background-color: white; border: solid 1px black; width: 99%; height: 98%"></div>
</div>
<div data-options="region:'east',split:true" title="根据学习进度推荐如下" style="width:50%;">
	<div data-options="region:'north',title:'学习路线',split:true" style="height:48%;">
	 	<div  id="myDiagramDiv2" style="background-color: white; border: solid 1px black; width: 99%; height: 99%"></div>
	</div>  
    <div data-options="region:'center',title:'说明'" style="padding:5px;height:48%;">
    <div id="info" style="margin-top:30px">
    </div>
	</div>  
</div> 	  
<div id="treeTools">
			<a href="javascript:" onclick="choose()"  class="icon-add" title="选择"></a>
</div>
</body>
</html>