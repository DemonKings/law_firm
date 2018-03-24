<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <title>专业团队</title>
	    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
  	</head>
	<body>
		<!-- 插入头 -->
		<%@ include file="/pages/base/head.jsp" %>
		<div style="margin: 0px 50px 0px 50px;">
			<!--路径导航-->
			<ol class="breadcrumb">
			  <li><a href="${pageContext.request.contextPath }">全景律师事务所</a></li>
			  <li class="active">专业团队</li>.
			</ol>
			
			<!--标题-->
			<div class="page-header">
			  <h1>专业团队</h1>
			</div>
			
			<div>
				<h3>按首字母查询</h3>
			</div>
			
			<!--首字母查询-->
			<div class="row">
			<div class="col-md-6">
				<table width="100%"  class="table table-bordered" style="table-layout: fixed; text-align: center;">
					<tr style="width: 100%;">
						<td><a>A</a></td>
						<td><a>B</a></td>
						<td><a>C</a></td>
						<td><a>D</a></td>
						<td><a>E</a></td>
						<td><a>F</a></td>
						<td><a>G</a></td>
						<td><a>H</a></td>
						<td><a>I</a></td>
						<td><a>J</a></td>
						<td><a>K</a></td>
						<td><a>L</a></td>
						<td><a>M</a></td>
					</tr>
				</table>
			</div>
			<div class="col-md-6">
				<table width="100%"  class="table table-bordered" style="table-layout: fixed; text-align: center;">
					<tr style="width: 100%;">
						<td><a>N</a></td>
						<td><a>O</a></td>
						<td><a>P</a></td>
						<td><a>Q</a></td>
						<td><a>R</a></td>
						<td><a>S</a></td>
						<td><a>T</a></td>
						<td><a>U</a></td>
						<td><a>V</a></td>
						<td><a>W</a></td>
						<td><a>X</a></td>
						<td><a>Y</a></td>
						<td><a>Z</a></td>
					</tr>
				</table>
			</div>
			</div>
			
			<!--条件查询-->
			<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="input-group">
			      <input type="text" class="form-control" placeholder="请输入名字查询...">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button">
			        	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			        </button>
			      </span>
			    </div>
			</div>
			
			<div class="col-md-3 col-"></div>
			
			<div class="col-md-3 col-sm-6">
				<div class="input-group">
			      <input type="text" class="form-control" placeholder="请输入办公地点查询...">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button">
			        	 <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			        </button>
			      </span>
			    </div>
			</div>
			
			<div class="col-md-3"></div>
			</div>
			<br />
			
			<!--律师表格-->
			<div class="table-responsive">
			  <table class="table table-hover " style="table-layout: fixed;">
			  	<tr class="success">
			  		<td colspan="4">专业团队</td>
			  	</tr>
			  	<tr>
			  		<td>姓名</td>
			  		<td>邮箱</td>
			  		<td>职位</td>
			  		<td>办公地点</td>
			  	</tr>
			  	<tr>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  	</tr>
			  	<tr>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  	</tr>
			  	<tr>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  	</tr>
			  	<tr>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  	</tr>
			  	<tr>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  		<td>aaa</td>
			  	</tr>
			  </table>
			</div>
			
			<!--分页-->
			<nav style="text-align: center;">
			  <ul class="pagination">
			    <li>
			      <a href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li>
			      <a href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
			
		</div>
		<!-- 插入脚 -->
		<%@ include file="/pages/base/foot.jsp" %>
	</body>
</html>
