<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#sendButton").click(
				function() {

					/* var params = "userId=" + $("#userId").val() + "&userPwd="+ $("#userPwd").val(); */
					var params = {"userId":$("#userId").val(),"userPwd":$("#userPwd").val()};
					$.ajax({
						type : "post",
						url : "ajax_ok.jsp",
						data : $.param(params),
						dataType : "json",
						success : function(args) {
							console.log(args);
							var str = "userId=" + args.userId + ",userPwd="
									+ args.userPwd + "<br/>";
							$("#resultDIV").html(str);
						},
						error : function(e) {
							alert(e.responseText);
						}
					});
				});
	});
</script>
</head>
<body>
	아이디 :
	<input type="text" id="userId" />
	<br> 패스워드 :
	<input type="password" id="userPwd" />
	<br>
	<button id="sendButton">전송</button>
	<br>
	<br>
	<div id="resultDIV"></div>
</body>
</html>