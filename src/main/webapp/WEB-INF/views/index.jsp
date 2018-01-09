<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>用户管理</title>
<script type="text/javascript" src="${ctx}/plugins/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${ctx}/plugins/bootstrap/css/bootstrap.css">
<script src="${ctx}/plugins/bootstrap/js/popper.min.js"></script>
<script src="${ctx}/plugins/bootstrap/js/bootstrap.js"></script>
<script
	src="${ctx}/plugins/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script
	src="${ctx}/plugins/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${ctx}/plugins/bootstrap/js/moment-with-locales.js"></script>

<script src="${ctx}/plugins/jquery-form/jquery.form.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<link rel="stylesheet"
	href="${ctx}/plugins/bootstrap/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/style.css">
</head>
<style>
</style>
<body>
	<header>
	<h2>用户管理系统</h2>
	<nav> <a>帮助</a> <a>退出</a> </nav> </header>
	<div class="content">
		<aside id="left" data-id="1" class="left">
		<div class="menu">
			<a id="show-userList" data-class="#show-userList" data-url="/list"
				class="menu-item active">用户查询</a> <a class="menu-item"
				data-class="#to-addUser" id="to-addUser" data-url="/toAddAndUpdate">用户新增</a>
			<a class="menu-item" id="to-userAnalyze" data-url="/analyze">用户分析</a>
		</div>
		<div class="head-avatar">
			<img src="images/avatar.png" alt="头像" />
			<h5>当前登录用户</h5>
		</div>
		</aside>
		<div id="right" class="right">
			<div class="main-panel intr px-5"></div>

			<footer id="footer"> Copyright © 2017.轻实训版权所有 </footer>
		</div>
	</div>
	<script type="text/javascript">
		var g_rootPath = "${ctx}"
		$(function() {
			var $right = $(".right")
			var $mainPanel = $right.find(".main-panel")
			//统计男女比例

			// 取消保存
			$mainPanel.on("click", "#out-user-btn", function() {
				// 刷新页面
				$(".menu-item").removeClass("active");
				$("#show-userList").addClass("active");
				triggerCurrentMenu();
			});

			//添加用户信息
			$mainPanel.on("click", "#save-user-btn", function() {
				var url = $(this).data("url")
				var name = $mainPanel.find("input[name='user.name']")
				var email = $mainPanel.find("input[name='user.email']")
				var address = $mainPanel.find("input[name='user.address']")
				var age = $mainPanel.find("input[name='user.age']")
				var phone = $mainPanel.find("input[name='user.phone']")
				if (name.val() === "") {
					showInputTip(name, "请输入姓名")
					return false;
				} else {
					hideInputTip(name)
				}
				if (address.val() === "") {
					showInputTip(address, "请输入地址")
					return false;
				} else {
					hideInputTip(address)
				}
				if (email.val() === "") {
					showInputTip(email, "请输入邮箱")
					return false;
				} else {
					hideInputTip(email)
				}
				if (age.val() === "") {
					showInputTip(age, "请输入职业")
					return false;
				} else {
					hideInputTip(age)
				}
				if (phone.val() === "") {
					showInputTip(phone, "请输入电话")
					return false;
				} else {
					hideInputTip(phone)
				}
				addUser(url);
			})
			//查询需要修改的信息
			$mainPanel.on("click", "#to-update-user", function() {
				var userId = $(this).data("id")
				var url = $(this).data("url")
				var $targes = $("#right")
				$targes.find(".main-panel").load("${ctx}/toAddAndUpdate", {
					userId : userId
				})
			})

			var $menu = $(".menu")
			//进入查询页面显示用户信息
			$menu.find(".menu-item").on("click", function() {
				var url = $(this).data("url")
				$menu.find(".menu-item").removeClass("active");
				$(this).addClass("active");
				loadMainContent(url);
			}).first().click();

			$mainPanel.on("click", "#delete-user-btn", function() {
				var userId = $(this).data("id")
				var $targes = $("#right")
				if (confirm("是否删除该用户信息？")) {
					$.ajax({
						url : "${ctx}/deleteUser",
						data : {
							userId : userId
						},
						success : function() {
							alert("删除成功")
							$targes.find(".main-panel").load("${ctx}/list")
							$(".menu-item").removeClass("active");
							$("#show-userList").addClass("active");
						}
					})
				}

			})
		})

		// 触发当前菜单点击
		function triggerCurrentMenu() {
			var $menu = $(".menu")
			$menu.find(".menu-item.active").trigger("click");
		}

		// 加载主页面内容
		function loadMainContent(url, params) {
			var $targes = $("#right")
			$targes.find(".main-panel").load(g_rootPath + url, {
				userId : -1
			});
		}

		//添加用户
		function addUser(url, $form) {
			var $targes = $("#right")
			$.ajax({
				url : g_rootPath + url,
				type : "post",
				dataType : "json",
				data : $("#addUser-form").serialize(),
				success : function() {
					alert("操作成功")
					$targes.find(".main-panel").load("${ctx}/list")
					$(".menu-item").removeClass("active");
					$("#show-userList").addClass("active");
				},
				error : function() {
					alert("操作失败")
				}
			})
		}

		// 显示验证提示
		function showInputTip($input, value) {
			var $parent = $input.parent();
			$(".input-lable").addClass("error-group");
			$parent.find(".input-label span").remove();
			$parent.find(".input-label").append("<span>" + value + "</span>");
			$input.addClass("error-input");
			return false;
		}

		// 隐藏验证提示
		function hideInputTip($input) {
			var $parent = $input.parent();
			$parent.removeClass("error-group");
			$input.removeClass("error-input")
			$parent.find(".input-label span").remove();
		}
		
	</script>
</body>

</html>