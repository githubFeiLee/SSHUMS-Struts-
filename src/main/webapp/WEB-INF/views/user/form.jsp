<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<style>
.userbtn {
	width: 210px;
	height: 45px;
}

label {
	display: block;
	font-size: 12px;
}

.span span {
	float: right;
	color: red;
}

.error-input {
	border: red solid 1px;
}
</style>
<div id="right" class="right ml-5">
	<section class="main-panel">
		<h4 class="form-title">
			<c:if test="${user.id ==null }">
	添加用户
	</c:if>
			<c:if test="${user.id >0 }">
	编辑用户
	</c:if>
		</h4>
	</section>
</div>
<div id="userAddPanel">
	<form id="addUser-form" data-url="addAndUpdate" method="post">
		<div class="text-left mt-3 ml-5">
			<div class="row">
				<input type="hidden" class="form-control" name="user.id"
					value="${user.id }">
				<div class="col-md-5 mb-4 span">
					<label class="input-label" for="validationDefault01">姓名</label> <input
						type="text" class="form-control" name="user.name"
						placeholder="请输入姓名..." value="${user.name }">
					<div class="invalid-feedback">Please provide a valid state.</div>
				</div>
				<div class="col-md-5 mb-4 span">
					<label class="input-label" for="inputState">性别</label> <select
						id="inputState" name="user.gender" class="form-control">
						<option value="男" selected>男</option>
						<option value="女" <c:if test="${user.gender== '女' }">selected</c:if>>女</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 mb-4 span">
					<label class="input-label" for="validationDefault03">地址</label> <input
						type="text" class="form-control" name="user.address"
						placeholder="请输入地址..." value="${user.address }">
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
				<div class="col-md-5 mb-4 span">
					<label class="input-label" for="validationDefault04">邮箱</label> <input
						type="text" class="form-control" name="user.email"
						placeholder="请输入邮箱..." value="${user.email }">
					<div class="invalid-feedback">Please provide a valid state.</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 mb-4 span">
					<label class="input-label" for="validationDefault03">年龄</label> 
					<input type="text" id="time-input" class="form-control" name="user.age" placeholder="请输入年龄..."
						value="${user.age}">
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
				<div class="col-md-5 mb-4 span">
					<label class="input-label" for="validationDefault04">电话</label> <input
						type="text" class="form-control" name="user.phone"
						placeholder="请输入电话号码..." value="${user.phone }">
					<div class="invalid-feedback">Please provide a valid state.</div>
				</div>
			</div>
			<div class="row d-flex mr-5 my-5 justify-content-center">
				<button type="button" id="save-user-btn" data-url="/addAndUpdate"
					class="btn btn-primary btn-sm mx-5 userbtn">提交</button>
				<button type="button" id="out-user-btn"
					class="btn btn-sm mx-5 userbtn">取消</button>
			</div>
		</div>
	</form>

</div>
