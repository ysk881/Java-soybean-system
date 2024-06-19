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

    <script type="text/javascript">
        function dbio() {
            window.location.href = "${pageContext.request.contextPath}/manage/excelbio";
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
                    <div class="card-head p-3 border-top shadow-sm bg-transparent" data-toggle="collapse"
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
                <a href="#" class="navbar-brand "><img src="${pageContext.request.contextPath}/image/logo.png"
                                                      style="width: 180px;height: 55px;"/></a>
                <div class="navbar-collapse flex-grow-0">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle text-light"
                               data-toggle="dropdown">欢迎，${sessionScope.user.name}</a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a href="${pageContext.request.contextPath}/admin/outlogin" class="dropdown-item"><span style="margin-left: 35px;">退出&nbsp;&nbsp;&nbsp;<i
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
										<small>全部生物学特征管理</small>
										<i class="bi bi-forward"></i>
										<small class="text-danger">（完全删除品种农艺性状需从全部品种页进行操作！）★</small>
									</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manage/allbiology" method="post">
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
                                                    class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">品种株高</label>
                                            <div class="col-7"><input type="text" class="form-control" name="height"
                                                                      placeholder="请输入品种株高..."/>
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
                            <%-- <form action="${pageContext.request.contextPath}/agronomic/deleteBios" method="post">--%>
                            <div>
                                <button type="button" class="btn btn-danger" onclick="deleteBioAll()"><i
                                        class="bi bi-trash-fill"></i>批量删除
                                </button>
                                <a type="button" class="btn btn-success" onclick="dbio()">
                                    <i class="bi bi-cloud-arrow-up-fill"></i> 导出

                                </a>
                            </div>
                            <div class="table-responsive">

                                <table class="table small text-muted table-bordered mt-3">
                                    <tr>
                                        <th class="col-p-3"><input type="checkbox" id="all"
                                                                   onclick="allClick()"></th>
                                        <th class="col-p-5">品种名称</th>
                                        <th class="col-p-3">株高</th>
                                        <th class="col-p-4">主茎节数</th>
                                        <th class="col-p-4">主茎荚数</th>
                                        <th class="col-p-3">分枝数</th>
                                        <th class="col-p-3">倒伏性</th>
                                        <th class="col-p-5">地上部生物量</th>
                                        <th class="col-p-5">习性</th>
                                        <th class="col-p-8">操作</th>
                                    </tr>
                                    <c:forEach var="bio" items="${pageInfo.list}" varStatus="pages">
                                        <tr>
                                            <td><input type="checkbox" name="agids" value="${bio.agid}"></td>
                                            <td>${bio.name}</td>
                                            <td>${bio.height}</td>
                                            <td>${bio.pedicle}</td>
                                            <td>${bio.pod}</td>
                                            <td>${bio.branch}</td>
                                            <td>${bio.lodging}</td>
                                            <td>${bio.biomass}</td>
                                            <td>${bio.habit}</td>

                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-info btn-sm"
                                                            data-agid="${bio.agid}"
                                                            data-name="${bio.name}"
                                                            data-height="${bio.height}"
                                                            data-pedicle="${bio.pedicle}"
                                                            data-pod="${bio.pod}"
                                                            data-branch="${bio.branch}"
                                                            data-lodging="${bio.lodging}"
                                                            data-biomass="${bio.biomass}"
                                                            data-fertility="${bio.fertility}"
                                                            data-habit="${bio.habit}"
                                                            data-anthesis="${bio.anthesis}"
                                                            data-afterbirth="${bio.afterbirth}"
                                                            data-lifetime="${bio.lifetime}"
                                                            data-toggle="modal"
                                                            data-target="#selectBioModal">详情
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-warning btn-sm"
                                                            data-agid="${bio.agid}"
                                                            data-name="${bio.name}"
                                                            data-height="${bio.height}"
                                                            data-pedicle="${bio.pedicle}"
                                                            data-pod="${bio.pod}"
                                                            data-branch="${bio.branch}"
                                                            data-lodging="${bio.lodging}"
                                                            data-biomass="${bio.biomass}"
                                                            data-fertility="${bio.fertility}"
                                                            data-habit="${bio.habit}"
                                                            data-anthesis="${bio.anthesis}"
                                                            data-afterbirth="${bio.afterbirth}"
                                                            data-lifetime="${bio.lifetime}"
                                                            data-toggle="modal"
                                                            data-target="#updateBioModal">修改
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-agid="${bio.agid}"
                                                            data-name="${bio.name}"
                                                            data-toggle="modal"
                                                            data-target="#delBioModal">
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
                            <div class="modal fade" id="selectBioModal" tabindex="-1" aria-labelledby="infoModelLabel"
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
                                            <input type="hidden" name="agid" id="agid" value="${bio.agid}">
                                            <div class="row">
                                                <div class="col-md-12 column ">
                                                    <div class="page-header">
                                                        <h2>
                                                            品种：<input type="text" disabled="disabled" id="bioname"
                                                                      style="border: none;background-color:transparent;"/>
                                                        </h2>
                                                    </div>
                                                    <table class="table table-hover table-striped">
                                                        <tr>
                                                            <th>株高</th>
                                                            <td><input type="text" disabled="disabled" id="bioheight"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>主茎节数</th>
                                                            <td><input type="text" disabled="disabled" id="biopedicle"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>主茎荚数</th>
                                                            <td><input type="text" disabled="disabled" id="biopod"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>分枝数</th>
                                                            <td><input type="text" disabled="disabled" id="biobranch"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <th>倒伏性</th>
                                                            <td><input type="text" disabled="disabled" id="biolodging"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>

                                                            <th>地上部生物量/t/hm2</th>
                                                            <td><input type="text" disabled="disabled" id="biobiomass"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>生育日数/d</th>
                                                            <td><input type="text" disabled="disabled" id="biofertility"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>习性</th>
                                                            <td><input type="text" disabled="disabled" id="biohabit"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>初花期/d</th>
                                                            <td><input type="text" disabled="disabled" id="bioanthesis"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>生育后期/d</th>
                                                            <td><input type="text" disabled="disabled"
                                                                       id="bioafterbirth"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>全生育期/d</th>
                                                            <td><input type="text" disabled="disabled" id="biolifetime"
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
                            <form action="${pageContext.request.contextPath}/manage/updateBio"
                                  class="form-horizontal" method="post">
                                <div class="modal fade" id="updateBioModal" tabindex="-1"
                                     aria-labelledby="updateModelLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateModelLabel">修改植物学特征信息</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <%--出现的问题：我们提交了修改sql请求，但是修改失败，初次考虑，是事务问题，配置完毕事务，依旧失败！--%>
                                                <%--看一下sql语句，能否执行成功 sql执行失败，修改未完成--%>
                                                <%--前端传递隐藏域--%>
                                                <input type="hidden" name="agid" id="bagid" value="${bio.agid}">
                                                <div class="form-group row">
                                                    <label for="bname"
                                                           class="col-3 col-form-label">品种名称：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              name="name" readonly required
                                                                              id="bname"/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bheight"
                                                           class="col-3 col-form-label ">株高：</label>
                                                    <div class="col-7">
                                                        <input type="text" class="form-control"
                                                               name="height" value=""
                                                               id="bheight"/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bpedicle" class="col-3 col-form-label">主茎节数：</label>
                                                    <div class="col-7"><input type="text" name="pedicle"
                                                                              class="form-control"
                                                                              id="bpedicle" value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bpod" class="col-3 col-form-label">主茎荚数:</label>
                                                    <div class="col-7"><input type="text" name="pod"
                                                                              class="form-control" value=""
                                                                              id="bpod"/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bbranch"
                                                           class="col-3 col-form-label">分枝数:</label>
                                                    <div class="col-7"><input type="text" name="branch"
                                                                              class="form-control" id="bbranch"
                                                                              value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="blodging" class="col-3 col-form-label">倒伏性:</label>
                                                    <div class="col-7"><input type="text" name="lodging"
                                                                              class="form-control" id="blodging"
                                                                              value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bbiomass"
                                                           class="col-3 col-form-label ">地上部分生物量:</label>
                                                    <div class="col-7 mt-2"><input type="text" name="biomass"
                                                                                   class="form-control"
                                                                                   id="bbiomass" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bfertility"
                                                           class="col-3 col-form-label ">生育日数:</label>
                                                    <div class="col-7"><input type="text" name="fertility"
                                                                              class="form-control"
                                                                              id="bfertility" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bhabit"
                                                           class="col-3 col-form-label ">习性:</label>
                                                    <div class="col-7"><input type="text" name="habit"
                                                                              class="form-control"
                                                                              id="bhabit" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="banthesis"
                                                           class="col-3 col-form-label ">初花期:</label>
                                                    <div class="col-7"><input type="text" name="anthesis"
                                                                              class="form-control"
                                                                              id="banthesis" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="bafterbirth"
                                                           class="col-3 col-form-label ">生育后期:</label>
                                                    <div class="col-7"><input type="text" name="afterbirth"
                                                                              class="form-control"
                                                                              id="bafterbirth" value=""/>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="blifetime"
                                                           class="col-3 col-form-label ">全生育期:</label>
                                                    <div class="col-7"><input type="text" name="lifetime"
                                                                              class="form-control"
                                                                              id="blifetime" value=""/>
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
                            <form method="post" action="${pageContext.request.contextPath}/manage/delectBioId"
                                  class="form-horizontal">
                                <div class="modal fade" id="delBioModal" tabindex="-1"
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
                                                                    type="hidden" class="form-control" id="biagid"
                                                                    name="agid" placeholder="">
                                                            <input
                                                                    type="hidden" class="form-control" id="name"
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
                                            <a href="${pageContext.request.contextPath}/manage/allbiology?pn=1"
                                               class="page-link">首页</a>
                                        </li>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasPreviousPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allbiology?pn=${pageInfo.prePage==0?1:pageInfo.prePage}"
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
                                                        href="${pageContext.request.contextPath}/manage/allbiology?pn=${pageNum}"
                                                        class="page-link">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasNextPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allbiology?pn=${pageInfo.nextPage==pageInfo.pages?pageInfo.pages:pageInfo.nextPage}"
                                               class="page-link">下一页</a>
                                        </li>
                                        <li <c:if test="${pageInfo.isLastPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allbiology?pn=${pageInfo.pages}"
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
    $('#selectBioModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var agid = button.data('agid')
        var name = button.data('name')
        var height = button.data('height')
        var pedicle = button.data('pedicle')
        var pod = button.data('pod')
        var branch = button.data('branch')
        var lodging = button.data('lodging')
        var biomass = button.data('biomass')
        var fertility = button.data('fertility')
        var habit = button.data('habit')
        var anthesis = button.data('anthesis')
        var afterbirth = button.data('afterbirth')
        var lifetime = button.data('lifetime')
        var modal = $(this)

        modal.find('.modal-title').text('生物学特征详情页')
        modal.find('#agid').val(agid)
        modal.find('#bioname').val(name)
        modal.find('#bioheight').val(height)
        modal.find('#biopedicle').val(pedicle)
        modal.find('#biopod').val(pod)
        modal.find('#biobranch').val(branch)
        modal.find('#biolodging').val(lodging)
        modal.find('#biobiomass').val(biomass)
        modal.find('#biofertility').val(fertility)
        modal.find('#biohabit').val(habit)
        modal.find('#bioanthesis').val(anthesis)
        modal.find('#bioafterbirth').val(afterbirth)
        modal.find('#biolifetime').val(lifetime)
    });

    $('#updateBioModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var agid = button.data('agid')
        var name = button.data('name')
        var height = button.data('height')
        var pedicle = button.data('pedicle')
        var pod = button.data('pod')
        var branch = button.data('branch')
        var lodging = button.data('lodging')
        var biomass = button.data('biomass')
        var fertility = button.data('fertility')
        var habit = button.data('habit')
        var anthesis = button.data('anthesis')
        var afterbirth = button.data('afterbirth')
        var lifetime = button.data('lifetime')
        var modal = $(this)

        modal.find('.modal-title').text('添加/修改生物学特征信息')
        modal.find('#bagid').val(agid)
        modal.find('#bname').val(name)
        modal.find('#bheight').val(height)
        modal.find('#bpedicle').val(pedicle)
        modal.find('#bpod').val(pod)
        modal.find('#bbranch').val(branch)
        modal.find('#blodging').val(lodging)
        modal.find('#bbiomass').val(biomass)
        modal.find('#bfertility').val(fertility)
        modal.find('#bhabit').val(habit)
        modal.find('#banthesis').val(anthesis)
        modal.find('#bafterbirth').val(afterbirth)
        modal.find('#blifetime').val(lifetime)
    });

    $('#delBioModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var agid = button.data('agid')
        var name = button.data('name')
        var modal = $(this)
        modal.find('.modal-title').text('删除生物学特征信息')
        modal.find('#deleteLabel').text('是否删除' + name + '的生物学特征')
        modal.find('#biagid').val(agid)
        modal.find('#name').val(name)

    });
</script>
<script type="text/javascript">
    function deleteBioAll() {
        var checkNum = $("input[name='agids']:checked").length;
        if (checkNum == 0) {
            alert("请选择至少一项");
            return;
        }
        if (confirm("确定要删除吗？")) {
            var bioList = new Array();
            $("input[name='agids']:checked").each(function () {
                bioList.push($(this).val())
            });
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/manage/deleteBio",
            data: {bioList: bioList.toString()},
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
