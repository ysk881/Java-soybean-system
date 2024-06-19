<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/2/28
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <!-- 引入 Bootstrap 美化界面 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        $("#usname").blur(function () {
            document.get
            var us =  $(this).val();
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/User/queryName",
                data:"username="+us,
                success:function (msg) {
                    if (msg === true){
                        $("#usInfo").css("color","red");
                        $("#usInfo").html("账号名已存在");
                    }else {
                        $("#usInfo").css("color","green");
                        $("#usInfo").html("账号名可用");
                    }
                }
            })
        });
    });
</script>
<body style=" background: url(${pageContext.request.contextPath}/image/usbg2.jpg) no-repeat center center fixed; background-size: 100%;">
<div class="modal-dialog " style="margin-top: 8%;width: 424px;">
    <div class="modal-content">
        <form action="${pageContext.request.contextPath}/User/register" method="post">
            <div class="modal-header">
                <a href="#"><img src="${pageContext.request.contextPath}/image/logo.png" style="margin-left: 55px;
				float: left;" alt="logo"></a>
            </div>
            <div class="modal-body" id="model-body">
                <div class="form-group" align="center">
                    <input type="text" id="usname" class="form-control" placeholder="请输入注册账号" required autocomplete="off"
                           name="username" style="width: 348px; height: 40px;">
                   <span id="usInfo" class="help-block" style="color: red; margin-right: 230px;"></span>
                </div>
                <div class="form-group" align="center">
                    <input type="password" class="form-control" placeholder="账号密码" required autocomplete="off"
                           name="password" style="width: 348px; height: 40px;">
                </div>
                <div class="form-group" align="center">
                    <input type="text" class="form-control" placeholder="用户名可以为空"
                           autocomplete="off" name="name"  style="width: 348px; height: 40px;">
                </div>
                <div class="form-group" align="center">

                    <div class="mt-2">
                        <input type="radio" checked class="sex" name="sex" id="sex" value="男" />男&nbsp;&nbsp;&nbsp;
                        <input type="radio" class="sex" name="sex" id="sex" value="女" />女
                    </div>

                </div>
                <div class="form-group" align="center">
                    <input type="email" class="form-control" placeholder="邮箱：name@example.com" autocomplete="off"
                           name="email" style="width: 348px; height: 40px;">
                </div>
                <div class="form-group" align="center">
                    <input type="text" class="form-control" placeholder="联系电话." autocomplete="off"
                           name="phone" style="width: 348px; height: 40px;">
                </div>
                <div class="form-group" align="center">
                    <input type="hidden" class="form-control" placeholder="" value="用户" autocomplete="off"
                           name="permission" style="width: 348px; height: 40px;">
                </div>
            </div>
            <div class="modal-footer">
                <div class="form-group" align="center">
                    <button type="submit" class="btn btn-info form-control"
                            style="width: 348px; height: 40px;">注册</button>
                </div>
                <div class="form-group" align="center">

                    <label class="col-form-label">已有账号?</label>
                    &nbsp;<a
                        style=" text-decoration: none; /* 取消默认的下划线 */"
                        href="${pageContext.request.contextPath}/User/tologin">立即登录</a>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

</html>
