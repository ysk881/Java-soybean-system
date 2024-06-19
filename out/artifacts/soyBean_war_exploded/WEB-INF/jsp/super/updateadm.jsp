<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>大豆种质资源管理数据库后台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 引入 Bootstrap 美化界面 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!-- bootstrap-icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/fonts/bootstrap-icons.css"/>
    <!-- 页面样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/ajaxfileupload.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    function Tureup(){
        alert('密码修改成功,请重新登录!');
    }
</script>

</head>
<body>
<div class="container-fluid p-0">
    <div class="row vh-100 no-gutters">
        <div class="col overflow-auto  menus-box">
            <a
                    class="h4 mt-4 ml-3 d-flex justify-content-start align-items-center text-light text-decoration-none brand">
                <i class="bi bi-dropbox"></i>
                <span class="ml-2">种质资源管理后台</span>
            </a>
            <div class="d-flex mt-5 ml-3">
                <div class="rounded-circle overflow-hidden border user-img">
                    <img src="${pageContext.request.contextPath}/image/gril.png" class="img-fluid">
                </div>
                <div class=" ml-4 d-flex flex-column justify-content-center text-light">
                    <span>Welcome,</span>
                    <span>${sessionScope.admin.name}</span>
                </div>
            </div>
            <div class="accordion mt-5 text-light" id="cardList">
                <div class="card rounded-0 bg-transparent">
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b1">
                        <i class="bi bi-calendar2-range-fill mr-2"></i>
                        <span>大豆品种管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse  bg-transparent" id="b1" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/variety/allVarietys"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0  position-relative d-flex align-items-center pl-4">全部品种</a>
                        </div>
                    </div>
                </div>
                <div class="card rounded-0  bg-transparent">
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b2">
                        <i class="bi bi-diagram-3-fill mr-2"></i>
                        <span>农艺性状管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse  bg-transparent" id="b2" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/agronomic/allphytologys"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative d-flex align-items-center pl-4">植物学特征</a>
                            <a href="${pageContext.request.contextPath}/agronomic/allbiologys"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative d-flex align-items-center pl-4">生物学特征</a>
                            <a href="${pageContext.request.contextPath}/agronomic/allqualitys"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative d-flex align-items-center pl-4">品质性状</a>
                        </div>
                    </div>
                </div>
                <div class="card rounded-0 bg-transparent">
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b3">
                        <i class="bi bi-person-fill-gear mr-2"></i>
                        <span>科普知识管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse bg-transparent" id="b3" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/know/allknows"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                全部科普知识</a>
                            <a href="${pageContext.request.contextPath}/know/alllegumina"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                豆类科普知识</a>
                            <a href="${pageContext.request.contextPath}/know/allcrop"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                农作物科普知识</a>

                        </div>
                    </div>
                </div>
                <div class="card rounded-0 bg-transparent">
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b4">
                        <i class="bi bi-person-vcard-fill mr-2"></i>
                        <span>用户管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse bg-transparent" id="b4" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/admin/allUser"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">全部用户信息</a>
                            <a href="${pageContext.request.contextPath}/admin/allAdmin"
                               class="list-group-item small text-light text-decoration-none bg-transparent border-0 position-relative  d-flex align-items-center pl-4">全部管理员信息</a>
                            <a href="${pageContext.request.contextPath}/admin/authority"
                               class="list-group-item small text-light text-decoration-none bg-transparent border-0 position-relative  d-flex align-items-center pl-4">权限管理</a>
                        </div>
                    </div>
                </div>
                <div class="card rounded-0 bg-transparent">
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b5">
                        <i class="bi bi-person-fill-gear mr-2"></i>
                        <span>修改账号信息</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse show bg-transparent" id="b5" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/admin/admininfo"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                修改账号信息</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col overflow-auto main-box">
            <nav class="navbar navbar-expand-lg justify-content-between navbar-light border-bottom"
                 style="background-color: #019858;">
                <a href="#" class="navbar-brand"><img src="${pageContext.request.contextPath}/image/logo.png"
                                                      style="width: 180px;height: 55px;"/></a>
                <div class="navbar-collapse flex-grow-0">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle text-light"
                               data-toggle="dropdown">${sessionScope.admin.name}</a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="${pageContext.request.contextPath}/admin/outlogin" class="dropdown-item"><span style="margin-left: 35px;">退出&nbsp;&nbsp;&nbsp;<i
                                        class="bi bi-box-arrow-right"></i></span></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="row flex-column m-5">
                <div class="col">
                    <div class="card px-5">
                        <div class="card-header bg-white text-cinerous">
									<span class="h5 font-weight-bold">修改账户基础信息
										<i class="bi bi-caret-right"></i>

										<small class="text-danger">请谨慎修改账号信息。。★</small>
									</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/upadmin" method="post">
                                <div class="row ml-4">
                                    <div class="col">
                                        <!--id 用户账号 、用户权限-->
                                <%--        <div class="form-group row">
                                            <label for="adid" class="col-sm-2 control-label"></label>
                                            <div class="col-sm-6">
                                                <input type="hidden" class="form-control" id="adid"  name="adid" value="${adinfo.adid}">
                                            </div>
                                        </div>--%>
                                        <div class="form-group row" style="margin-left: 150px;">
                                            <label for="adname"
                                                   class="col-form-label col-form-label-sm font-weight-bold text-right   text-secondary">账号名称：</label>
                                            <div class="col-6">
                                                <input type="text" class="form-control" name="username" id="adname" readonly
                                                       value="${sessionScope.admin.username}"/>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="margin-left: 150px;">
                                            <label for="adpass"
                                                   class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">登录密码：</label>
                                            <div class="col-6"><input type="password" class="form-control"
                                                                      name="password" id="adpass" value="${sessionScope.admin.password}"/>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="margin-left: 150px;">
                                            <label for="name"
                                                   class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">用户别名：</label>
                                            <div class="col-6"><input type="text" class="form-control"
                                                                      name="name" readonly
                                                                      id="name" value="${sessionScope.admin.name}"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <button type="submit" class="col-1 btn btn-warning"
                                                    style="margin-left: 380px;"
                                                    onclick="Tureup()">修&nbsp;&nbsp;改
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>


</html>
