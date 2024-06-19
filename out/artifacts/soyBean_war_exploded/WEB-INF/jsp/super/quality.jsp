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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/ajaxfileupload.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript">
        function upqua() {
            window.location.href = "${pageContext.request.contextPath}/agronomic/excelqua";
        }
    </script>

    <script type="text/javascript">
        /* 全选复选框功能实现 */
        function allClick() {
            /* 获取当前点击后全选按钮的状态 */
            var flag = $("#all").prop("checked");
            $("input[name='agids']").each(function () {
                this.checked = flag;
            })
        }

        /* 单个复选框点击改变全选复选框功能实现 */
        function ckClick() {
            /* 得到下面复选框的个数 */
            var fiveLength = $("input[name='agids']").length;
            /* 得到下方复选框选中的个数 */
            var checkedLength = $("input[name='agids']:checked").length;
            /* 进行对比，改变全选复选框状态 */
            if (fiveLength == checkedLength) {
                $("#all").prop("checked", true);
            } else {
                $("#all").prop("checked", false);
            }
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
                    <div class="card-body p-0 collapse show  bg-transparent" id="b2" data-parent="#cardList">
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
                    <div class="card-body p-0 collapse bg-transparent" id="b5" data-parent="#cardList">
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
                               data-toggle="dropdown">欢迎，${sessionScope.admin.name}</a>
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
                    <div class="card px-1">
                        <div class="card-header bg-white text-cinerous">
									<span class="h5 font-weight-bold">农艺性状
										<i class="bi bi-caret-right"></i>
										<small>全部品质性状管理</small>
										<i class="bi bi-forward"></i>
										<small class="text-danger">（完全删除品种农艺性状需从全部品种页进行操作！）★</small>
									</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/agronomic/allqualitys" method="post">
                                <div class="row ml-2">
                                    <div class="col">
                                        <div class="form-group row">
                                            <label
                                                    class="col-form-label col-form-label-sm font-weight-bold text-right   text-secondary">品种名称</label>
                                            <div class="col-7">
                                                <input type="text" class="form-control" name="name"
                                                       placeholder="请输入要查询的品种名"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label
                                                    class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">品种粒重</label>
                                            <div class="col-7"><input type="text" class="form-control" name="grain"
                                                                      placeholder="请输入查询的百粒重..."/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group row">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-info"><i class="bi bi-search"></i>&nbsp;&nbsp;搜&nbsp;&nbsp;索
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="col mt-2">
                    <div class="card px-3">
                        <div class="card-body">
                            <%--<form action="${pageContext.request.contextPath}/agronomic/deleteQuas" method="post">--%>
                            <div>
                                <button type="button" class="btn btn-danger" onclick="deleteQuaAll()"><i
                                        class="bi bi-trash-fill"></i>批量删除
                                </button>
                                <a type="button" class="btn btn-success" onclick="upqua()">
                                    <i class="bi bi-cloud-arrow-up-fill"></i> 导出

                                </a>
                            </div>
                            <div class="table-responsive">

                                <table class="table small text-muted table-bordered mt-3">
                                    <tr>
                                        <th class="col-p-3"><input type="checkbox" id="all"
                                                                   onclick="allClick()"></th>
                                        <th class="col-p-4">品种名称</th>
                                        <th class="col-p-3">百粒重</th>
                                        <th class="col-p-4">油脂含量</th>
                                        <th class="col-p-4">脂肪含量</th>
                                        <th class="col-p-5">蛋白质含量</th>
                                        <th class="col-p-4">蛋脂总量</th>
                                        <th class="col-p-5">耐盐性指数</th>
                                        <th class="col-p-5">耐碱性指数</th>

                                        <th class="col-p-8">操作</th>
                                    </tr>
                                    <c:forEach var="qua" items="${pageInfo.list}" varStatus="pages">
                                        <tr>
                                            <td><input type="checkbox" name="agids" value="${qua.agid}"></td>
                                            <td>${qua.name}</td>
                                            <td>${qua.grain}</td>
                                            <td>${qua.grease}</td>
                                            <td>${qua.fat}</td>
                                            <td>${qua.protein}</td>
                                            <td>${qua.lipid}</td>
                                            <td>${qua.salt}</td>
                                            <td>${qua.alkali}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-info btn-sm"
                                                            data-agid="${qua.agid}"
                                                            data-name="${qua.name}"
                                                            data-grain="${qua.grain}"
                                                            data-grease="${qua.grease}"
                                                            data-fat="${qua.fat}"
                                                            data-protein="${qua.protein}"
                                                            data-lipid="${qua.lipid}"
                                                            data-salt="${qua.salt}"
                                                            data-alkali="${qua.alkali}"
                                                            data-cystine="${qua.cystine}"
                                                            data-methionine="${qua.methionine}"
                                                            data-hard="${qua.hard}"
                                                            data-soft="${qua.soft}"
                                                            data-oil="${qua.oil}"
                                                            data-toggle="modal"
                                                            data-target="#selectQuModal">详情
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-warning btn-sm"
                                                            data-agid="${qua.agid}"
                                                            data-name="${qua.name}"
                                                            data-grain="${qua.grain}"
                                                            data-grease="${qua.grease}"
                                                            data-fat="${qua.fat}"
                                                            data-protein="${qua.protein}"
                                                            data-lipid="${qua.lipid}"
                                                            data-salt="${qua.salt}"
                                                            data-alkali="${qua.alkali}"
                                                            data-cystine="${qua.cystine}"
                                                            data-methionine="${qua.methionine}"
                                                            data-hard="${qua.hard}"
                                                            data-soft="${qua.soft}"
                                                            data-oil="${qua.oil}"
                                                            data-toggle="modal"
                                                            data-target="#updateQuaModal">修改
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-agid="${qua.agid}"
                                                            data-name="${qua.name}"
                                                            data-toggle="modal"
                                                            data-target="#delQuaModal">
                                                        <i class="fa fa-user-times"></i>删除
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <%--</form>--%>
                            <!-- 品种详情模态框 Model -->
                            <div class="modal fade" id="selectQuModal" tabindex="-1" aria-labelledby="infoModelLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="infoModelLabel">生物学特征详情页</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- 品种 -->
                                            <input type="hidden" name="agid" id="agid" value="${qua.agid}">
                                            <div class="row">
                                                <div class="col-md-12 column ">
                                                    <div class="page-header">
                                                        <h2>
                                                            品种：<input type="text" disabled="disabled" id="quaname"
                                                                      style="border: none;background-color:transparent;"/>
                                                        </h2>
                                                    </div>
                                                    <table class="table table-hover table-striped">
                                                        <tr>
                                                            <th>百粒重/g</th>
                                                            <td><input type="text" disabled="disabled" id="quagrain"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>油脂含量/%</th>
                                                            <td><input type="text" disabled="disabled" id="quagrease"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>脂肪含量/%</th>
                                                            <td><input type="text" disabled="disabled" id="quafat"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>蛋白质含量/%</th>
                                                            <td><input type="text" disabled="disabled" id="quaprotein"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <th>蛋脂含量/%</th>
                                                            <td><input type="text" disabled="disabled" id="qualipid"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>

                                                            <th>耐盐性指数</th>
                                                            <td><input type="text" disabled="disabled" id="quasalt"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>耐碱性指数</th>
                                                            <td><input type="text" disabled="disabled" id="quaalkali"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>胱氨酸</th>
                                                            <td><input type="text" disabled="disabled" id="quacystine"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>蛋氨酸</th>
                                                            <td><input type="text" disabled="disabled"
                                                                       id="quamethionine"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>硬脂酸</th>
                                                            <td><input type="text" disabled="disabled"
                                                                       id="quahard"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>软脂酸</th>
                                                            <td><input type="text" disabled="disabled" id="quasoft"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>油酸</th>
                                                            <td><input type="text" disabled="disabled" id="quaoil"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭
                                            </button>
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">确认
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 修改模态框 Model -->
                            <form action="${pageContext.request.contextPath}/agronomic/updateQua"
                                  class="form-horizontal" method="post">
                                <div class="modal fade" id="updateQuaModal" tabindex="-1"
                                     aria-labelledby="updateModelLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateModelLabel">修改品质性状信息</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <%--出现的问题：我们提交了修改sql请求，但是修改失败，初次考虑，是事务问题，配置完毕事务，依旧失败！--%>
                                                <%--看一下sql语句，能否执行成功 sql执行失败，修改未完成--%>
                                                <%--前端传递隐藏域--%>
                                                <input type="hidden" name="agid" id="qagid" value="${qua.agid}">
                                                <div class="form-group row">
                                                    <label for="qname"
                                                           class="col-3 col-form-label">品种名称：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              name="name" readonly required
                                                                              id="qname"/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qgrain"
                                                           class="col-3 col-form-label ">百粒重：</label>
                                                    <div class="col-7">
                                                        <input type="text" class="form-control"
                                                               name="grain" value=""
                                                               id="qgrain"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qgrease" class="col-3 col-form-label">油脂含量：</label>
                                                    <div class="col-7"><input type="text" name="grease"
                                                                              class="form-control"
                                                                              id="qgrease" value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qfat" class="col-3 col-form-label">脂肪含量:</label>
                                                    <div class="col-7"><input type="text" name="fat"
                                                                              class="form-control" value=""
                                                                              id="qfat"/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qprotein"
                                                           class="col-3 col-form-label">蛋白质含量:</label>
                                                    <div class="col-7"><input type="text" name="protein"
                                                                              class="form-control" id="qprotein"
                                                                              value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qlipid" class="col-3 col-form-label">蛋脂总量:</label>
                                                    <div class="col-7"><input type="text" name="lipid"
                                                                              class="form-control" id="qlipid"
                                                                              value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qsalt"
                                                           class="col-3 col-form-label ">耐盐性指数:</label>
                                                    <div class="col-7 mt-2"><input type="text" name="salt"
                                                                                   class="form-control"
                                                                                   id="qsalt" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qalkali"
                                                           class="col-3 col-form-label ">耐碱性指数:</label>
                                                    <div class="col-7"><input type="text" name="alkali"
                                                                              class="form-control"
                                                                              id="qalkali" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qcystine"
                                                           class="col-3 col-form-label ">胱氨酸:</label>
                                                    <div class="col-7"><input type="text" name="cystine"
                                                                              class="form-control"
                                                                              id="qcystine" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qmethionine"
                                                           class="col-3 col-form-label ">蛋氨酸:</label>
                                                    <div class="col-7"><input type="text" name="methionine"
                                                                              class="form-control"
                                                                              id="qmethionine" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qhard"
                                                           class="col-3 col-form-label ">硬脂酸:</label>
                                                    <div class="col-7"><input type="text" name="hard"
                                                                              class="form-control"
                                                                              id="qhard" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qsoft"
                                                           class="col-3 col-form-label ">软脂酸:</label>
                                                    <div class="col-7"><input type="text" name="soft"
                                                                              class="form-control"
                                                                              id="qsoft" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="qoil"
                                                           class="col-3 col-form-label ">油酸:</label>
                                                    <div class="col-7"><input type="text" name="oil"
                                                                              class="form-control"
                                                                              id="qoil" value=""/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭
                                                </button>
                                                <button type="submit" class="btn btn-primary" id="update_info">确认修改
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- 删除模态框示例（Modal） -->
                            <form method="post" action="${pageContext.request.contextPath}/agronomic/delectQuaId"
                                  class="form-horizontal">
                                <div class="modal fade" id="delQuaModal" tabindex="-1"
                                     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel">植物学特征信息</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">×
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <div class="col-sm-9">
                                                            <h5 class="col-sm-18 control-label" id="deleteLabel">
                                                                删除信息</h5>
                                                            <input type="hidden" class="form-control" id="tab"
                                                                   name="tab" placeholder="" value="dor_bio">
                                                            <input
                                                                    type="hidden" class="form-control" id="quagid"
                                                                    name="agid" placeholder="">
                                                            <input
                                                                    type="hidden" class="form-control" id="quname"
                                                                    name="name" placeholder="">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    取消
                                                </button>
                                                <button type="submit" class="btn btn-danger">删除</button>
                                                <span id="tip"> </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>


                            <!-- 分页导航 -->
                            <div class="d-flex align-items-center justify-content-between">
                                <small class="text-muted">当前是第${pageInfo.pageNum}页，共${pageInfo.pages}页，每页${pageInfo.pageSize}条，共${pageInfo.total}条记录</small>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-end m-0">
                                        <li <c:if test="${pageInfo.isFirstPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/agronomic/allqualitys?pn=1"
                                               class="page-link">首页</a>
                                        </li>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasPreviousPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/agronomic/allqualitys?pn=${pageInfo.prePage==0?1:pageInfo.prePage}"
                                               class="page-link">上一页</a>
                                        </li>
                                        <c:forEach begin="0" items="${pageInfo.navigatepageNums}"
                                                   end="${pageInfo.pages}" var="pageNum">
                                            <c:if test="${pageNum == pageInfo.pageNum }">
                                                <li class="page-item active"><a href="#"
                                                                                class="page-link">${pageNum }</a></li>
                                            </c:if>
                                            <c:if test="${pageNum != pageInfo.pageNum }">
                                                <li class="page-item"><a
                                                        href="${pageContext.request.contextPath}/agronomic/allqualitys?pn=${pageNum}"
                                                        class="page-link">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasNextPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/agronomic/allqualitys?pn=${pageInfo.nextPage==pageInfo.pages?pageInfo.pages:pageInfo.nextPage}"
                                               class="page-link">下一页</a>
                                        </li>
                                        <li <c:if test="${pageInfo.isLastPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/agronomic/allqualitys?pn=${pageInfo.pages}"
                                               class="page-link">尾页</a>
                                        </li>
                                    </ul>
                                </nav>
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

<script type="text/javascript">
    $('#selectQuModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var agid = button.data('agid')
        var name = button.data('name')
        var grain = button.data('grain')
        var grease = button.data('grease')
        var fat = button.data('fat')
        var protein = button.data('protein')
        var lipid = button.data('lipid')
        var salt = button.data('salt')
        var alkali = button.data('alkali')
        var cystine = button.data('cystine')
        var methionine = button.data('methionine')
        var hard = button.data('hard')
        var soft = button.data('soft')
        var oil = button.data('oil')
        var modal = $(this)

        modal.find('.modal-title').text('品质性状详情页')
        modal.find('#agid').val(agid)
        modal.find('#quaname').val(name)
        modal.find('#quagrain').val(grain)
        modal.find('#quagrease').val(grease)
        modal.find('#quafat').val(fat)
        modal.find('#quaprotein').val(protein)
        modal.find('#qualipid').val(lipid)
        modal.find('#quasalt').val(salt)
        modal.find('#quaalkali').val(alkali)
        modal.find('#quacystine').val(cystine)
        modal.find('#quamethionine').val(methionine)
        modal.find('#quahard').val(hard)
        modal.find('#quasoft').val(soft)
        modal.find('#quaoil').val(oil)
    });

    $('#updateQuaModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var agid = button.data('agid')
        var name = button.data('name')
        var grain = button.data('grain')
        var grease = button.data('grease')
        var fat = button.data('fat')
        var protein = button.data('protein')
        var lipid = button.data('lipid')
        var salt = button.data('salt')
        var alkali = button.data('alkali')
        var cystine = button.data('cystine')
        var methionine = button.data('methionine')
        var hard = button.data('hard')
        var soft = button.data('soft')
        var oil = button.data('oil')
        var modal = $(this)

        modal.find('.modal-title').text('添加/修改品质性状信息')
        modal.find('#qagid').val(agid)
        modal.find('#qname').val(name)
        modal.find('#qgrain').val(grain)
        modal.find('#qgrease').val(grease)
        modal.find('#qfat').val(fat)
        modal.find('#qprotein').val(protein)
        modal.find('#qlipid').val(lipid)
        modal.find('#qsalt').val(salt)
        modal.find('#qalkali').val(alkali)
        modal.find('#qcystine').val(cystine)
        modal.find('#qmethionine').val(methionine)
        modal.find('#qhard').val(hard)
        modal.find('#qsoft').val(soft)
        modal.find('#qoil').val(oil)
    });

    $('#delQuaModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var agid = button.data('agid')
        var name = button.data('name')
        var modal = $(this)
        modal.find('.modal-title').text('删除品质性状信息')
        modal.find('#deleteLabel').text('是否删除' + name + '的品质性状')
        modal.find('#quagid').val(agid)
        modal.find('#quname').val(name)

    });
</script>
<script type="text/javascript">
    function deleteQuaAll() {
        var checkNum = $("input[name='agids']:checked").length;
        if (checkNum == 0) {
            alert("请选择至少一项");
            return;
        }
        if (confirm("确定要删除吗？")) {
            var quaList = new Array();
            $("input[name='agids']:checked").each(function () {
                quaList.push($(this).val())
            });
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/agronomic/deleteQua",
            data: {quaList: quaList.toString()},
            success: function () {
                alert("删除成功！");
                location.reload();
            },
            error: function () {
                alert("删除失败！");
            },
        })
    }
</script>
</html>
