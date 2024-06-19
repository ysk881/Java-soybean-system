<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main2.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/ajaxfileupload.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>


</head>
<body>
<div class="container-fluid p-0">
    <div class="row vh-100 no-gutters">
        <div class="col overflow-auto  menus-box">
            <a
                    class="h4 mt-4 ml-3 d-flex justify-content-start align-items-center text-light text-decoration-none brand">
                <i class="bi bi-dropbox"></i>
                <span class="ml-2">种质资源管理</span>
            </a>
            <div class="d-flex mt-5 ml-3">
                <div class="rounded-circle overflow-hidden border user-img">
                    <img src="${pageContext.request.contextPath}/image/noradmin.jpg" class="img-fluid">
                </div>
                <div class=" ml-4 d-flex flex-column justify-content-center text-light">
                    <span>Welcome,</span>
                    <span>${sessionScope.user.name}</span>
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
                            <a href="${pageContext.request.contextPath}/manage/allVariety"
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
                    <div class="card-body p-0 collapse show  bg-transparent" id="b2" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/manage/allphytology"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative d-flex align-items-center pl-4">植物学特征</a>
                            <a href="${pageContext.request.contextPath}/manage/allbiology"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative d-flex align-items-center pl-4">生物学特征</a>
                            <a href="${pageContext.request.contextPath}/manage/allquality"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative d-flex align-items-center pl-4">品质性状</a>
                        </div>
                    </div>
                </div>
                <div class="card rounded-0 bg-transparent">
                    <div class="card-head p-3 border-top show shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b3">
                        <i class="bi bi-person-fill-gear mr-2"></i>
                        <span>科普知识管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse bg-transparent" id="b3" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/manage/allknow"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                全部科普知识</a>
                            <a href="${pageContext.request.contextPath}/manage/alllegu"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                豆类科普知识</a>
                            <a href="${pageContext.request.contextPath}/manage/allcrop"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                农作物科普知识</a>
                        </div>
                    </div>
                </div>
                <div class="card rounded-0 bg-transparent">
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b4">
                        <i class="bi bi-person-fill-gear mr-2"></i>
                        <span>修改账号信息</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse bg-transparent" id="b4" data-parent="#cardList">
                        <div class="list-group list-group-flush py-1 pl-4">
                            <a href="${pageContext.request.contextPath}/manage/adminfo"
                               class="list-group-item small text-light text-decoration-none  bg-transparent border-0 position-relative  d-flex align-items-center pl-4">
                                修改账号信息</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="col overflow-auto main-box">
            <nav class="navbar navbar-expand-lg justify-content-between navbar-light border-bottom"
                 style="background-color: #339999;">
                <a href="#" class="navbar-brand mr-auto"><img src="${pageContext.request.contextPath}/image/logo.png"
                                                              style="width: 180px;height: 55px;"/></a>
                <div class="navbar-collapse flex-grow-0">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle text-light"
                               data-toggle="dropdown">${sessionScope.user.name}</a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="${pageContext.request.contextPath}/admin/tologins" class="dropdown-item"><span style="margin-left: 35px;">退出&nbsp;&nbsp;&nbsp;<i
                                        class="bi bi-box-arrow-right"></i></span></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="row flex-column m-2">
                <div class="col">
                    <div class="card px-2">
                        <div class="card-body">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <div class="alert alert-danger alert-dismissable">
                                        <h4>
                                            警告!
                                        </h4>
                                        <strong>Warning!</strong> The function module you are using is incorrect, please check whether the function statement is correct.
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col mt-3">
                    <div class="card px-3 ">
                        <div class="card-body ">
                            <div class="main_container">
                                <div class="col-md-12">
                                    <div class="col-middle">
                                        <div class="text-center text-center">
                                            <h1 class="error-number">404</h1>
                                            <h2>页面找不到啦</h2>
                                            <div class="mid_center">
                                                <h3>Search</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>

</html>
