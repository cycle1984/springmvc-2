<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>springmvc-2首页</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#testJson").on("click",function(){
				
				var url = this.href;
				var args = {};
				console.info(url);
				$.post(url,args,function(data){
					
					for (var i = 0; i < data.length; i++) {
						var id = data[i].id;
						var lastName = data[i].lastName;
						
						alert(id + ": " + lastName);
					}
				})
				return false;
			})
		})
	</script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/emp/emps">employee列表</a>
	<br><br>
	<a href="${pageContext.request.contextPath}/testJson" id="testJson">测试json数据</a>
</body>
</html>