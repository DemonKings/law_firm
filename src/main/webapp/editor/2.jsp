<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>完整demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<body>
<script id="container" name="content" type="text/plain"></script>
<script type="text/javascript">
	var ue = UE.getEditor('container', {
		toolbars : [ [ 'fullscreen', 'source', '|', 'undo', 'redo', '|',
				'bold', 'italic', 'underline', 'autotypeset', '|',
				'forecolor', 'backcolor', 'insertorderedlist',
				'insertunorderedlist', '|', 'rowspacingtop',
				'rowspacingbottom', 'lineheight', '|', 'customstyle',
				'paragraph', 'fontfamily', 'fontsize', '|', 'indent', '|',
				'justifyleft', 'justifycenter', 'justifyright',
				'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
				'link', 'unlink', 'anchor', '|', 'simpleupload', 'emotion',
				'scrawl', 'insertvideo', 'attachment', '|', 'spechars',
				'|', 'inserttable', 'deletetable', 'charts', '|', 'print',
				'preview', 'searchreplace', ] ],
		autoHeightEnabled : true,
		autoFloatEnabled : true
	});
</script>
<input type="button" onclick="sub()" value="tijiao">
<script type="text/javascript">
	function sub() {
		location.href = "NewsAction_save.action?content="+UE.getEditor('container').getContent();
	}
</script>

</body>
</html>