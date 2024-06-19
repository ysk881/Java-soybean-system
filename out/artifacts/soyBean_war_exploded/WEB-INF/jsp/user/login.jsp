<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/2/28
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <!-- 引入 Bootstrap 美化界面 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body style="background: url(${pageContext.request.contextPath}/image/usbg.jpg) no-repeat center center fixed; background-size: 100%;">
<div class="modal-dialog" style="margin-top: 8%;width: 424px;">
    <div class="modal-content">
        <form action="${pageContext.request.contextPath}/User/uslogin" method="post">
            <div class="modal-header">
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo.png" style="margin-left: 55px;
				float: left;" alt="logo"></a>
            </div>
            <div class="modal-body" id="model-body">
                <div class="form-group" align="center">
                    <h4 class="modal-title text-center text-muted">欢迎登录大豆种质资源数据库</h4>
                </div>
                <div class="form-group" align="center">

                    <input type="text" class="form-control" placeholder="请输入账号名.." required autocomplete="off"
                           name="username" style="width: 348px; height: 40px;">
                </div>
                <div class="form-group" align="center">
                    <input type="password" class="form-control" placeholder="密码.." required autocomplete="off"
                           name="password" style="width: 348px; height: 40px;">
                </div>
                <div class="form-group" style="margin-left: 25px;">
                    <span id="helpBlock2" class="help-block" style="color: red;">${errmsg}</span></div>
            </div>
            <div class="modal-footer">
                <div class="form-group">
                    <button type="submit" class="btn btn-info form-control"
                            style="width: 348px; height: 40px;">登录</button>
                </div>
                <div class="form-group" style="margin-left: 100px;">
                    <span>还没有账号?</span>&nbsp;<a class="btn btn-link"
                                                href="${pageContext.request.contextPath}/User/toregist" style="text-decoration: none;">注册账号</a>
                </div>
                <div class="form-group">
                    <button type="button" class="btn btn-link"><a href="${pageContext.request.contextPath}/admin/tologins" >管理员登录</a></button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
