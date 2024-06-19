<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>超级管理员登录页面</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
  <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>

</head>
<body style=" background: url(${pageContext.request.contextPath}/image/bg.jpg) no-repeat center center fixed; background-size: 100%;">


<div class="modal-dialog" style="margin-top: 8%;width: 424px;">
  <div class="modal-content">
    <form action="${pageContext.request.contextPath}/admin/login" method="post">
      <div class="modal-header">
        <a href="#"><img src="${pageContext.request.contextPath}/image/logo.png" style="margin-left: 55px;
				float: left;" alt="logo"></a>
      </div>
      <div class="modal-body" id="model-body">
        <div class="form-group" align="center">
          <h4 class="modal-title text-center text-muted">大豆种质资源管理员后台登录</h4>
        </div>
        <div class="form-group" align="center">

          <input type="text" class="form-control"  required placeholder="请输入管理员账号" autocomplete="off"
                 name="username" style="width: 348px; height: 40px;">
        </div>
        <div class="form-group" style="margin-left: 25px;">
          <span style="color:red;font-weight: bold">${nameError}</span></div>
        <div class="form-group" align="center">
          <input type="password" class="form-control" required  placeholder="密码" autocomplete="off"
                 name="password" style="width: 348px; height: 40px;">
        </div>
        <div class="form-group" style="margin-left: 25px;">
          <span style="color:red;font-weight: bold">${passError}</span></div>
        <div class="form-group" align="center">
          <label class="radio-inline">
            <input type="radio" name="type" checked value="Admin" class="radio-inline"> 超级管理员
          </label> &nbsp; &nbsp;
          <label class="radio-inline">
            <input type="radio" name="type" value="User" class="radio-inline" > 普通管理员
          </label>
        </div>
      </div>
      <div class="modal-footer mt-3">
        <div class="form-group">
          <button type="submit" class="btn btn-info form-control"
                  style="width: 348px; height: 40px; margin-right: 20px">登录</button>
        </div>
        <div class="form-group" style="margin-right: 30px;">
         <a href="${pageContext.request.contextPath}/User/tologin">普通用户登录</a></button>
        </div>
      </div>
    </form>

  </div>
</div>
</body>



</html>

