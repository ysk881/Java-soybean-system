<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			
			*{
				margin: 0px;
				padding: 0px;
				background-color: #ECECEC;
			}
			
			#all{
				width:1170px ;
				height: 55px;
				line-height: 55px;
				margin: 0px auto;
				margin-top: 58px;
				margin-left: 35px;
				
				border: 1px solid #ECECEC;
				
			}
			
			#all p{
				font-size: 25px;
				font-family: 黑体;
				background-color: #F2DEDE;
			}
			
		</style>
	</head>
	<body>
		<div id="all">
			<p class="alert alert-primary" role="alert">
				修改错误<a href="${pageContext.request.contextPath}/User/tologin" class="alert-link">返回</a>. 你修改的密码有误请检查后重试！
			</p>
		</div>
	</body>
</html>
