<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee列表</title>
	<style type = "text/css">

		table{
			border-collapse:collapse;
		}
		
		th,td{
			border:1px solid red;
			width:10%;
		}

	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
	
	<form action="" method="POST">
		<input type="hidden" name="_method" value="DELETE"/>
	</form>

	<c:if test="${empty requestScope.employees }">
		没有任何数据
	</c:if>
	<c:if test="${!empty requestScope.employees }">
		<table>
			<tr>
				<th>ID</th>
				<th>LastName</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Department</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${requestScope.employees }" var="emp">
				<tr>
					<td>${emp.id }</td>
					<td>${emp.lastName }</td>
					<td>${emp.email }</td>
					<td>${emp.gender == 0 ? '男':'女' }</td>
					<td>${emp.department.departmentName }</td>
					<td><a href="${pageContext.request.contextPath}/emp/emp/${emp.id}">Edit</a></td>
					<td><a class="delete" href="${pageContext.request.contextPath}/emp/emp/${emp.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<a href="emp">Add New Employee</a>
</body>
<script type="text/javascript">
	$(function(){
		$(".delete").on("click",function(){
			var href = this.href;
			$("form").attr("action", href).submit();
			return false;
		});
	});
</script>
</html>