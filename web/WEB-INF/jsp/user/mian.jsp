<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <!-- 引入 Bootstrap 美化界面 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!-- bootstrap-icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/fonts/bootstrap-icons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userma.css"/>
    <!-- 页面样式 -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%--导航--%>
<div class="usermain">
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
        <a class="col-2 navbar-brand" href="${pageContext.request.contextPath}/User/usmian"><img
                src="${pageContext.request.contextPath}/image/logo.png" height="69px;"
                class="d-inline-block col-12" alt=""></a>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="col-4 nav-item ">
                    <h5 align="center"><a class="nav-link active" href="${pageContext.request.contextPath}/User/usmian">首页 </a>
                    </h5>
                </li>
                <li class="col-3 nav-item dropdown ">
                    <a class="nav-link" type="button" data-toggle="dropdown">
                        <h5>种质资源 &nbsp;<i class="bi bi-caret-down-fill"></i></h5>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allVar">基本信息</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allNess">抗病毒性</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allSou">品种来源</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allArea">适宜区域</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allphy">植物学特征</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allbio">生物学特征</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allqua">品质性状</a>
                    </div>
                </li>
                <li class="col-3 nav-item ">
                    <a class="nav-link" type="button" data-toggle="dropdown">
                        <h5>科普知识&nbsp;<i class="bi bi-caret-down-fill"></i></h5>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allknow">豆类科普</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/allcrop">农作物科普</a>
                    </div>
                </li>

                <li class="col-3 nav-item dropdown  ">
                    <a class="nav-link" type="button" data-toggle="dropdown">
                        <h5>用户管理&nbsp;<i class="bi bi-caret-down-fill"></i></h5>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#" class="dropdown-item" data-toggle="modal"
                           data-target="#uInfoModel"><i class="bi bi-person-vcard"></i>&nbsp;&nbsp;用户信息</a>
                        <a class="dropdown-item" href="#" class="dropdown-item" data-toggle="modal"
                           data-target="#UpdateModal"><i class="bi bi-nut"></i>&nbsp;&nbsp;修改密码</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/admin/tologins"><i
                                class="bi bi-house-gear-fill"></i>&nbsp;&nbsp;后台管理</a>
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/User/outLogin"><i
                                class="bi bi-door-open-fill"></i>&nbsp;&nbsp;退出</a>

                    </div>
                </li>
                <li class="col-4 nav-item ">
                    <a class="nav-link active" type="button" data-toggle="dropdown">
                        <h5>欢迎您，<i class="bi bi-emoji-smile">${sessionScope.user.name}</i></h5>
                    </a>

                </li>

            </ul>
        </div>
    </nav>
</div>
<%--主体--%>

<div class="userbody">
    <div class="containers">
        <div id="overlay">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/User/allVar" class="form-inline">
                    <input type="text" class="col-8 form-control mb-8 mr-sm-8" id="" name="name"
                           placeholder="请输入品种名称....">
                    <button type="submit" class="col-1 btn btn-success" style="height: 40px;"><i
                            class="bi bi-search"></i></button>
                </form>
            </div>

        </div>
        <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-interval="8000">
                    <img src="${pageContext.request.contextPath}/image/轮播.jpg" class="d-block " alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>First slide label</h5>
                        <p>Some representative placeholder content for the first slide.</p>
                    </div>
                </div>
                <div class="carousel-item" data-interval="4000">
                    <img src="${pageContext.request.contextPath}/image/轮播1.jpg" class="d-block " alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Second slide label</h5>
                        <p>Some representative placeholder content for the second slide.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="${pageContext.request.contextPath}/image/轮播2.jpg" class="d-block" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Third slide label</h5>
                        <p>Some representative placeholder content for the third slide.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-target="#carouselExampleInterval"
                    data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-target="#carouselExampleInterval"
                    data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </button>
        </div>
    </div>

</div>

<form method="post" action="${pageContext.request.contextPath}/User/upinfo" class="form-horizontal">
    <!-- Modal -->
    <div class="modal fade" id="UpdateModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">

        <div class="modal-dialog bg-white">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">修改密码</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group row">
                        <label for="name"
                               class="col-form-label col-form-label-sm font-weight-bold text-right   text-secondary">用户账号：</label>
                        <div class="col-10">
                            <input type="text" class="form-control" readonly name="username" id="name"
                                   value="${sessionScope.user.username}"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="pwd"
                               class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">登录密码：</label>
                        <div class="col-10"><input type="password" class="form-control"
                                                   name="password" id="pwd" value=""/>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary"
                            onclick="upPwd()">修改
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
<!-- 查看用户信息Modal -->
<div class="modal fade " id="uInfoModel" tabindex="-1"
     aria-labelledby="infoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content bg-white">
            <div class="modal-header">
                <h5 class="modal-title" id="infoModalLabel">用户信息详细</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group row">
                    <label
                            class="col-form-label col-form-label-sm font-weight-bold text-right   text-secondary">用户账号：</label>
                    <div class="col-10">
                        <input type="text" class="form-control" readonly name="username"
                               value="${sessionScope.user.username}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">登录密码：</label>
                    <div class="col-10"><input type="text" class="form-control" readonly
                                               name="password"
                                               value="${sessionScope.user.password}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">用户名称：</label>
                    <div class="col-10"><input type="text" class="form-control" readonly
                                               name="name" value="${sessionScope.user.name}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">&nbsp;&nbsp;性&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;</label>
                    <div class="col-10"><input type="text" class="form-control" readonly
                                               name="sex" value="${sessionScope.user.sex}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">电子邮箱：</label>
                    <div class="col-10"><input type="text" class="form-control" readonly
                                               name="email" value="${sessionScope.user.email}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label
                            class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">联系电话：</label>
                    <div class="col-10"><input type="text" class="form-control" readonly
                                               name="phone" value="${sessionScope.user.phone}"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary"
                        data-dismiss="modal">确定
                </button>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    function upPwd() {
        alert("密码修改成功，请重新登录！...")
    }
</script>


</html>

