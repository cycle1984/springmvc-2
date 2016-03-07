<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>
</head>
<body>
	<form:form modelAttribute="employee"  action="${pageContext.request.contextPath }/emp/emp" method="POST">
		<c:if test="${employee.id != null }">
			<form:hidden path="id"/>
			<input type="hidden" name="_method" value="PUT"/>
			<%-- 对于 _method 不能使用 form:hidden 标签, 因为 modelAttribute 对应的 bean 中没有 _method 这个属性 --%>
			<%-- 
			<form:hidden path="_method" value="PUT"/>
			--%>
		</c:if>
		<br>
		LastName:<form:input path="lastName"/><form:errors path="lastName"></form:errors><br>
		email:<form:input path="email"/><form:errors path="email"></form:errors><br>
		<%
			Map<String,String> genders = new HashMap<String,String>();
			genders.put("0", "女");
			genders.put("1", "男");
			request.setAttribute("genders", genders);
		%>
		gender:<form:radiobuttons path="gender"  items="${genders }"/><br>
		department:<form:select path="department.id" items="${departments }" itemLabel="departmentName" itemValue="id"/><br>
		Birth: <form:input path="birth"/><form:errors path="birth"></form:errors>
		<br>
		Salary: <form:input path="salary"/>
		<br>
		<input type="submit" value="Submit"/>
	</form:form>
</body>
</html>