<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
  	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <title>网页头</title>
	    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
	   <%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css"> --%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/styleloginsign.css">
		<script src="${pageContext.request.contextPath }/js/jquery-1.11.0.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/jquery.validate.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath }/js/loginsignup.js" type="text/javascript"></script>
  	</head>
	<body>
	<!-- 头的背景图片 -->
	<div style="padding: 30px 50px 10px 50px">
	
		<!--logo行-->
    	<div class="container-fluid" >
		  <div class="row">
		  	<!--圆角响应式图片-->
		    <!--<img src="img/1.bmp" class="img-rounded img-responsive" width="100%">-->
		    <div class="col-xs-12" style="background: url(${pageContext.request.contextPath }/img/head/title.png);">
		    	<img src="${pageContext.request.contextPath }/img/head/logo1.png" class="img-rounded img-responsive" width="">
		    </div>
		  </div>
		</div>
	
		<!--用户注册/登录-->
		<div class="text-right" style="margin-top: 10px;">
			<a class="btn btn-default" href="${pageContext.request.contextPath }/pages/base/signup.jsp" role="button">注册</a>
			<a class="btn btn-default" href="#" role="button">登录</a>
		</div>
	
		<!--导航条-->
		<nav class="navbar navbar-inverse" style="margin-top: 10px;">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="${pageContext.request.contextPath }">首页</a>
		    </div>
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="${pageContext.request.contextPath }/pages/base/aboutquanjing.jsp">关于全景</a></li>
		        <li><a href="${pageContext.request.contextPath }/pages/base/business_area.jsp">业务领域</a></li>
		        <li><a href="${pageContext.request.contextPath }/pages/base/profession_team.jsp">专业团队</a></li>
		        <li><a href="#">法律咨询</a></li>
		        <li><a href="#">案例分析</a></li>
		        <li><a href="#">经典案例</a></li>
		        <li><a href="#">新闻咨询</a></li>
		        <li><a href="#">专业领域</a></li>
		        <li><a href="#">联系我们</a></li>
		        <li><a href="#">公司招聘</a></li>
		    </div>
		  </div>
		</nav>
	</div>
	</body>
</html>
