<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리</title>
<%@ include file="../include/include.jsp" %>
</head>
<body>
	<a href="empCreatePage"><button>사원 추가</button></a>
	<table>
		<thead>
			<tr>
				<th>사원번호</th>
				<th>사원명</th>
				<th>부서</th>
				<th>직책</th>
				<th>입사일자</th>

				<th>실적</th>
				<th>급여</th>
				<th>재직여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${empList}" var="empList">
				<tr>
					<td>${empList.emp_id}</td>
					<td><a href="empDetail?empId=${empList.emp_id}">${empList.emp_name}</a></td>
					<td>${empList.emp_department}</td>
					<td>${empList.emp_position}</td>
					<td>${empList.emp_hiredate}</td>

					<td>${empList.emp_profit}</td>
					<td>${empList.emp_salary}</td>
					<td>${empList.emp_state}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul>
		<%
			int cnt = Integer.parseInt(String.valueOf(request.getAttribute("pageCnt")));
			int cur = Integer.parseInt(String.valueOf(request.getAttribute("page")));
		%>
		<%
			for (int i = 1; i <= cnt; i++) {
				if (i == cur) {
		%>
		<li class="active"><span><%=i%></span></li>
		<%
			} else {
		%>
		<li><a href="empList?page=<%=i%>"> <span><%=i%></span>
		</a></li>
		<%
			}
			}
		%>
	</ul>
	<form action="searchList">
<table >
	<thead>
		<tr>
			<td>사원 번호</td>
			<td>사원명</td>
			<td>부서</td>
			<td>직책</td>
			<td>입사일자</td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="text" name="empId" id="empId"></td>
			<td><input type="text" name="empName" id="empName" ></td>
			<td><input type="text" name="empDepartment" id="empDepartment" ></td>
			<td><input type="text" name="empPosition" id="empPosition" ></td>
			<td><input type="date" name="empHiredate" id="empHiredate" min="2010-07-01" max="2025-06-30" ></td>
			<td><input type="submit" value="검색"></td>
		</tr>
	</tbody>
</table>
</form>
</body>
</html>