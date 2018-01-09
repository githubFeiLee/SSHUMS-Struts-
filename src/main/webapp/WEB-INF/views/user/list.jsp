<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<%@ include file="/commons/taglibs.jsp"%>
<style>
.operation-btn{
	width: 35px;
	height:20px;
	padding: 0px;
	font-size: 12px;
	
}
</style>
<div id="right" class="right">
	<section class="main-panel">
		<h3 class="form-title">用户信息</h3>
	</section>
</div>
<table class="table table-sm">
	<thead class="thead-light">
		<tr class="text-center">
			<th scope="col">序号</th>
			<th scope="col">姓名</th>
			<th scope="col">性別</th>
			<th scope="col">电话</th>
			<th scope="col">邮箱</th>
			<th scope="col">地址</th>
			<th scope="col">年龄</th>
			<th scope="col">操作</th>

		</tr>
	</thead>
	<tbody class="text-center">
		<c:forEach var="users" items="${users }" varStatus="status">
			<tr>
				<th scope="row">${status.count }</th>
				<td>${users.name }</td>
				<td>${users.gender }</td>
				<td>${users.phone }</td>
				<td>${users.email }</td>
				<td>${users.address }</td>
				<td>${users.age }</td>
					<td>
					<button type="button" id="to-update-user"
						data-url=""
						class="btn btn-primary btn-sm to-add-button pt-0 operation-btn" data-id="${users.id }">编辑</button>
					<button type="button" id="delete-user-btn" data-url="${ctx}/deleteForm"
						class="btn bg-danger text-white btn-sm pt-0 operation-btn" data-id="${users.id }">删除</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

	

<script type="text/javascript">


</script>