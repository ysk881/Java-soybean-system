<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <!-- 引入 Bootstrap 美化界面 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <!-- bootstrap-icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/fonts/bootstrap-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userma.css" />
    <!-- 页面样式 -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body >


<div class="usermain">
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
        <a class="col-2 navbar-brand" href="var.html"><img src="${pageContext.request.contextPath}/image/logo.png"
                                                           class="d-inline-block col-12" alt=""></a>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="col-4 nav-item">
                    <h5 align="center"><a class="nav-link active" href="var.html">首页 </a></h5>
                </li>
                <li class="col-3 nav-item">
                    <h5 align="center"><a class="nav-link" href="var.html">种质资源</a></h5>
                </li>
                <li class="col-4 nav-item">
                    <h5 align="center"><a class="nav-link" href="knowledge.html">科普知识</a></h5>
                </li>
                <li class="col-4 nav-item dropdown">
                    <a class="nav-link" href="phy.html" type="button" data-toggle="dropdown" aria-expanded="false">
                        <h5>农艺性状 &nbsp;<i class="bi bi-caret-down-fill"></i></h5>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="phy.html">植物学特征</a>
                        <a class="dropdown-item" href="phy.html">生物学特征</a>
                        <a class="dropdown-item" href="phy.html">品质性状</a>
                    </div>
                </li>
                <li class="col-4 nav-item">
                    <h5 align="center" class=""><a class="nav-link" href="${pageContext.request.contextPath}/User/tologin">
                        <i class="bi bi-bug"></i>登录&nbsp;/&nbsp;注册</a></h5>
                </li>

            </ul>
        </div>
    </nav>
</div>
<div class="userbody">
    <div class="containers">
        <div id="overlay">
            <div class="modal-content">
                <form action=""  class="form-inline">
                    <input type="text" class="col-8 form-control mb-8 mr-sm-8" id="" placeholder="请输入品种名称....">
                    <button type="submit" class="col-1 btn btn-success mb-8"><i class="bi bi-search"></i></button>
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

</body>



</html>

