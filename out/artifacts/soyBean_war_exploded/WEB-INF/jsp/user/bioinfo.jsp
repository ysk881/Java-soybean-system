<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>生物学特征详情</title>
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
<!-- 导航栏 -->
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
                    <a class="nav-link active" type="button" data-toggle="dropdown">
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

<!-- 主体 -->
<div class="container">
    <div class="row">
        <div class="col-md-12 column">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page"><a href="${pageContext.request.contextPath}/User/allVar">种质资源</a></li>
                    <li class="breadcrumb-item">农艺性状</li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="${pageContext.request.contextPath}/User/allbio">生物学特征</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="table-responsive">
        <!-- 品种 -->
        <div class="row">
            <div class="col-md-12 column">
                <div class="col-4 float-right ">
                    <img class="img-rounded" style="width: 360px;height: 330px; margin-left: 40px;" src="${pageContext.request.contextPath}/image/${bi.image}" id="vimg">
                </div>
                <div class="col-8 row">
                    <div class="page-header">
                        <h4>
                            ${bi.name}
                        </h4>
                    </div>
                    <table class="table table-bordered">
                        <tr>
                            <th>产量（kg/hm2）</th>
                            <td>${bi.yield}<span>kg/hm2</span></td>
                            <th>播种月份</th>
                            <td>${bi.month}</td>
                        </tr>
                        <tr>
                            <th>播量/kg</th>
                            <td>${bi.rate}<span>kg</span></td>
                            <th>保苗/万株/hm²</th>
                            <td>${bi.protect}<span>（万株）</span></td>
                        </tr>
                        <tr>
                            <th>适宜区域</th>
                            <td colspan="4">${bi.area}</td>
                        </tr>
                        <tr>
                            <th>品种来源</th>
                            <td colspan="4">${bi.source}</td>
                        </tr>
                        <tr>
                            <th>抗病性</th>
                            <td colspan="4">${bi.illness}</td>
                        </tr>

                    </table>

                </div>

            </div>
        </div>
        <!-- 植物学特征 -->
        <div class="row m-2">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h4>
                        植物学特征
                    </h4>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>花色</th>
                        <td>${bi.phytology.flower}<span>色</span></td>
                        <th>叶形状</th>
                        <td>${bi.phytology.leaf}<span>叶</span></td>
                        <th>种子形状</th>
                        <td>${bi.phytology.seed}<span>形</span></td>
                    </tr>
                    <tr>
                        <th>种皮颜色</th>
                        <td>${bi.phytology.testa}</td>
                        <th>种脐颜色</th>
                        <td>${bi.phytology.hilum}<span>色</span></td>
                        <th>茸毛色</th>
                        <td>${bi.phytology.fuzz}<span>色</span></td>
                    </tr>
                    <tr>
                        <th>子叶色</th>
                        <td>${bi.phytology.contyledon}<span>色</span></td>

                    </tr>

                </table>
            </div>
        </div>
        <!-- 生物学特征 -->
        <div class="row m-2">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h2>
                        <mark>生物学特征</mark>
                    </h2>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>株高/cm</th>
                        <td>${bi.biology.height}<span>cm</span></td>
                        <th>主茎节数</th>
                        <td>${bi.biology.pedicle}</td>
                        <th>主茎荚数</th>
                        <td>${bi.biology.pod}</td>
                        <th>分枝数</th>
                        <td>${bi.biology.branch}</td>
                    </tr>
                    <tr>
                        <th>倒伏性</th>
                        <td>${bi.biology.lodging}</td>
                        <th>地上部生物量/t/hm2</th>
                        <td>${bi.biology.biomass}</td>
                        <th>生育日数/d</th>
                        <td>${bi.biology.fertility} <span>天</span></td>
                        <th>习性</th>
                        <td>${bi.biology.habit}</td>
                    </tr>
                    <tr>
                        <th>初花期/d</th>
                        <td>${bi.biology.anthesis} <span>天</span></td>
                        <th>生育后期/d</th>
                        <td>${bi.biology.afterbirth} <span>天</span></td>
                        <th>全生育期/d</th>
                        <td>${bi.biology.lifetime} <span>天</span></td>
                    </tr>
                </table>
            </div>
        </div>

        <!--品质性状-->
        <div class="row m-2">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h4>
                        品质性状
                    </h4>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>百粒重/g</th>
                        <td>${bi.quality.grain}<span>g</span></td>
                        <th>油脂含量/%</th>
                        <td>${bi.quality.grease}<span>%</span></td>
                        <th>脂肪含量/%</th>
                        <td>${bi.quality.fat}<span>%</span></td>
                        <th>蛋白质含量/%</th>
                        <td>${bi.quality.protein}<span>%</span></td>
                    </tr>
                    <tr>
                        <th>蛋脂含量/%</th>
                        <td>${bi.quality.lipid}<span>%</span></td>
                        <th>耐盐性指数</th>
                        <td>${bi.quality.salt}</td>
                        <th>耐碱性指数</th>
                        <td>${bi.quality.alkali}</td>
                        <th>胱氨酸</th>
                        <td>${bi.quality.cystine}</td>
                    </tr>
                    <tr>
                        <th>蛋氨酸</th>
                        <td>${bi.quality.methionine}</td>
                        <th>硬脂酸</th>
                        <td>${bi.quality.hard}</td>
                        <th>软脂酸</th>
                        <td>${bi.quality.soft}</td>
                        <th>油酸</th>
                        <td>${bi.quality.oil}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!--  -->
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

<form method="post" action="${pageContext.request.contextPath}/User/upinfo" class="form-horizontal">
    <!-- 修改登录密码Modal -->
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
                            <input type="text" class="form-control" readonly name="username"
                                   id="name"
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
<div class="modal fade" id="uInfoModel" tabindex="-1"
     aria-labelledby="infoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
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
