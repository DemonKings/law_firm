<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <title>业务领域</title>
	    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<style>
			button{
				width: 200px;
			}
		</style>
		<script type="text/javascript">
			//加载页面
			$(function() {
				//Ajax查询所有业务领域
				$.post("${pageContext.request.contextPath }/BusinessAreaAction_findAll",null,function(data){
					//控制换行
					var count = 0;
					//遍历json数组,创建按钮并添加单机事件
					for(var i=0;i<data.length;i++){
						$("#bt").append('<div class="col-md-3"><button type="button" class="btn btn-primary" style="text-align: left;" onclick="details('+data[i].id+')">'+data[i].name+'</button></div>');
						count = count +1;
						if(count==4){
							$("#bt").append("</br></br></br>");
							count = 0;
						}
					}
				},"json");
			});
			
			//业务按钮查看详细信息的方法
			function details(id) {
				alert(id);
			}
		</script>
  	</head>
	<body>
		<!-- 插入头 -->
		<%@ include file="/pages/base/head.jsp" %>
		
		<div style="margin: 0px 50px 0px 50px;">
			<!--路径导航-->
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }">全景律师事务所</a></li>
			  <li class="active">业务领域</li>
			</ol>
			
			<!--标题-->
			<div class="page-header">
			  <h1>业务领域</h1>
			</div>
			
			<!--描述-->
			<p style="text-indent: 2em;">
				全景自2004年起进行了从个体化作业向团队化作业转型，向规模化、规范化、专业化、品牌化、国际化方向发展的探索和改革。通过一系列的研究和改革，全景目前已实现了跨越式发展，不仅规模化建设取得明显成效，而且规范化、专业化、团队化建设也取得了丰硕成果。全景现已建立了先进的管理体制和专业化团队作业模式，奠定了有效控制业务质量的基础，建设了资源共享机制的路径。全景将坚持不懈地积极探索中国律师事务所品牌化、国际化的建设和发展道路。				
			</p><br /><br />
			
			<!--业务按钮-->
			<div class="row" id="bt"></div>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
		</div>
		<!-- 插入脚 -->
		<%@ include file="/pages/base/foot.jsp" %>
	</body>
</html>
