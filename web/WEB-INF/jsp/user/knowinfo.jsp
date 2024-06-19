<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>豆类科普知识详情页</title>
    <!-- 引入 Bootstrap 美化界面 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!-- bootstrap-icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/fonts/bootstrap-icons.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/var.css"/>
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
                    <h5 align="center"><a class="nav-link" href="${pageContext.request.contextPath}/User/usmian">首页 </a>
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
                    <a class="nav-link active" type="button" data-toggle="dropdown">
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
<div class="knowbody">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row flex-column m-2">
                    <div class="col">
                        <div class="card px-1">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-right"></i>
                                <span class="h5 font-weight-bold"><a href="${pageContext.request.contextPath}/User/allknow"
                                                                     class="text-decoration-none">科普知识</a>
											<i class="bi bi-caret-right-fill"></i>
											<small><a href="${pageContext.request.contextPath}/User/allknow"
                                                      class="text-decoration-none">豆类科普</a></small>
										</span>
                            </div>
                            <div class="card-body">
                                <div class="row col-md-12 column">
                                    <div class="col-md-6">
                                        <div class="text-center">
                                            <p></p>
                                            <h2>${know.knname}</h2>
                                            <p></p>
                                            <span
                                                    class="font-weight-bold">学名</span>&nbsp;:&nbsp;<span>${know.knspell}</span>
                                            <p></p>
                                            <span
                                                    class="font-weight-bold">别名</span>&nbsp;:&nbsp;<span>${know.knalias}</span>
                                        </div>

                                    </div>
                                    <div class="col-md-6 ">
                                        <img src="${pageContext.request.contextPath}/image/${know.knimg}"
                                             class="rounded mx-auto d-block" width="320px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col mt-2">
                        <div class="card px-3">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-down-fill"></i>
                                <span class="h5 font-weight-bold text-info">基本介绍

										</span>
                            </div>
                            <div class="card-body">
                                <p class="text-justify">
                                    ${know.kninfo}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col mt-2">
                        <div class="card px-3">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-down-fill"></i>
                                <span class="h5 font-weight-bold text-info">形态特征

										</span>
                            </div>
                            <div class="card-body">
                                <p class="text-justify">
                                    ${know.kntrait}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col mt-2">
                        <div class="card px-3">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-down-fill"></i>
                                <span class="h5 font-weight-bold text-info">生长环境

										</span>
                            </div>
                            <div class="card-body">
                                <p class="text-justify">
                                    ${know.kngrow}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col mt-2">
                        <div class="card px-3">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-down-fill"></i>
                                <span class="h5 font-weight-bold text-info">分布范围

										</span>
                            </div>
                            <div class="card-body">
                                <p class="text-justify">
                                    ${know.knradius}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col mt-2">
                        <div class="card px-3">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-down-fill"></i>
                                <span class="h5 font-weight-bold text-info">栽培技术

										</span>
                            </div>
                            <div class="card-body">
                                <p class="text-justify">
                                    ${know.kncultivate}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col mt-2">
                        <div class="card px-3">
                            <div class="card-header bg-white text-cinerous">
                                <i class="bi bi-caret-down-fill"></i>
                                <span class="h5 font-weight-bold text-info">主要价值

										</span>
                            </div>
                            <div class="card-body">
                                <p class="text-justify">
                                    ${know.knvalue}
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row flex-column m-2 bg-dark">
                    <div class="m-3">
                        <span class="h6 text-white"><i class="bi bi-file-bar-graph-fill"></i>&nbsp;&nbsp;联系我们：0855-4367951</span>
                        <span class="col-3 h6 text-white"><a href="${pageContext.request.contextPath}/admin/tologins" style="text-decoration: none;color: white;"><i
                                class="bi bi-house-gear-fill"></i>&nbsp;&nbsp;系统管理</a></span>
                        <p class="text-white"><i class="bi bi-google-play"></i>&nbsp;&nbsp;Copyright 中国科学院植物研究所, All Rights Reserved.
                        </p>
                    </div>
                </div>
            </div>
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
