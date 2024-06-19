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
        function upadmin(){
            window.location.href="${pageContext.request.contextPath}/admin/excelAdmin";
        }
    </script>

    <script type="text/javascript">
        /* 全选复选框功能实现 */
        function alladminClick() {
            /* 获取当前点击后全选按钮的状态 */
            var flag = $("#allAdmin").prop("checked");
            $("input[name='usids']").each(function () {
                this.checked = flag;
            })
        }

        /* 单个复选框点击改变全选复选框功能实现 */
        function ckadminClick() {
            /* 得到下面复选框的个数 */
            var fiveLength = $("input[name='usids']").length;
            /* 得到下方复选框选中的个数 */
            var checkedLength = $("input[name='usids']:checked").length;
            /* 进行对比，改变全选复选框状态 */
            if (fiveLength == checkedLength) {
                $("#allAdmin").prop("checked", true);
            } else {
                $("#allAdmin").prop("checked", false);
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
                    <div class="card-head p-3 border-top  shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b4">
                        <i class="bi bi-person-vcard-fill mr-2"></i>
                        <span>用户管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse show bg-transparent" id="b4" data-parent="#cardList">
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
									<span class="h5 font-weight-bold">普通管理员管理
										<i class="bi bi-caret-right"></i>
										<small>全部普通管理员管理</small>
										<i class="bi bi-forward"></i>
										<small>可以通过搜索相应的账号或者相应用户名对其信息进行修改、删除等管理操作。★</small>
									</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/admin/allAdmin" method="post">
                                <div class="row ml-2">
                                    <div class="col">
                                        <div class="form-group row">
                                            <label
                                                    class="col-form-label col-form-label-sm font-weight-bold text-right   text-secondary">用户账号</label>
                                            <div class="col-7">
                                                <input type="text" class="form-control" name="account"
                                                       placeholder="请输入要查询的账号..."/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label
                                                    class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">用户名称</label>
                                            <div class="col-7"><input type="text" class="form-control" name="name"
                                                                      placeholder="请输入需要查询的用户名..."/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group row">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-info"><i class="bi bi-search"></i>&nbsp;&nbsp;搜&nbsp;&nbsp;索</button>
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
                            <%--<form action="${pageContext.request.contextPath}/admin/delectAdmin" method="post">--%>
                                <div>
                                    <a href="${pageContext.request.contextPath}/admin/toAddUser"
                                       class="btn btn-success" data-toggle="modal"
                                       data-target="#addAdminModel"><i class="bi bi-person-fill-add"></i>添加普通管理员</a>
                                    <button type="buuton" class="btn btn-danger" onclick="deleteAdminAll()"><i class="bi bi-trash-fill"></i>批量删除</button>
                                    <a type="button" class="btn btn-success" onclick="upadmin()">
                                        <i class="bi bi-cloud-arrow-up-fill"></i> 导出

                                    </a>
                                </div>
                                <div class="table-responsive">

                                    <table class="table small text-muted table-bordered mt-3">
                                        <tr>
                                            <th class="col-p-3"><input type="checkbox" id="allAdmin"
                                                                       onclick="alladminClick()"></th>
                                            <th class="col-p-3">账号</th>
                                            <th class="col-p-5">密码</th>
                                            <th class="col-p-5">用户名称</th>
                                            <th class="col-p-5">性别</th>
                                            <th class="col-p-5">电子邮件</th>
                                            <th class="col-p-5">联系电话</th>
                                            <th class="col-p-5">权限</th>
                                            <th class="col-p-8">操作</th>
                                        </tr>
                                        <c:forEach var="user" items="${pageInfo.list}" varStatus="pages">
                                            <tr>
                                                <td><input type="checkbox" name="usids" id="usids" value="${user.usid}"
                                                           onclick="ckadminClick()"></td>
                                                <td>${user.username}</td>
                                                <td>${user.password}</td>
                                                <td>${user.name}</td>
                                                <td>${user.sex}</td>
                                                <td>${user.email}</td>
                                                <td>${user.phone}</td>
                                                <td>${user.permission}</td>
                                                <td>
                                                    <div class="btn-group">

                                                            <button type="button" class="btn btn-warning btn-sm"
                                                                    data-usid="${user.usid}"
                                                                    data-username="${user.username}"
                                                                    data-password="${user.password}"
                                                                    data-name="${user.name}"
                                                                    data-sex="${user.sex}"
                                                                    data-email="${user.email}"
                                                                    data-phone="${user.phone}"
                                                                    data-toggle="modal"
                                                                    data-target="#updateAdminModal">修改</button>&nbsp;&nbsp;
                                                            <button type="button" class="btn btn-danger btn-sm"
                                                                    data-usid="${user.usid}"
                                                                    data-username="${user.username}"
                                                                    data-toggle="modal"
                                                                    data-target="#delAdminModal">
                                                                <i class="fa fa-user-times"></i>删除</button>

                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                           <%-- </form>--%>

                            <!-- 添加模态框 Model -->
                            <form method="post"
                                  class="form-horizontal" action="${pageContext.request.contextPath}/admin/addAdmin" >
                                <div class="modal fade" id="addAdminModel" tabindex="-1" aria-labelledby="AddAdmin"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="AddAdmin">添加普通管理员信息</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <div class="form-group row ">
                                                    <label for="username"
                                                           class="col-3 col-form-label">用户账号：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="username" name="username" required
                                                                              placeholder="请输入所注册的账号...." /></div>
                                                    <span id="pwdInfo" class="col-md-8 ml-auto "></span>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="name"
                                                           class="col-3 col-form-label ">用户名：</label>
                                                    <div class="col-7"><input type="text"  class="form-control"
                                                                              id="name"
                                                                              name="name"
                                                                              placeholder="请输入注册用户昵称...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="password"
                                                           class="col-3 col-form-label">账号密码：</label>
                                                    <div class="col-7"><input type="password" class="form-control"
                                                                              id="password"
                                                                              name="password" required
                                                                              placeholder="请输入注册登录密码...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="email"
                                                           class="col-3 col-form-label">电子邮箱:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="email"
                                                                              name="email"
                                                                              placeholder="请输入邮箱账号...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="phone"
                                                           class="col-3 col-form-label">联系电话:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="phone"
                                                                              name="phone"
                                                                              placeholder="请输入联系电话...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <%--@declare id="sex"--%><label for="sex"
                                                                                    class="col-3 col-form-label">性别:</label>
                                                    <div class="col-7">
                                                        <div class="mt-2">
                                                        <input type="radio" checked value="男" class="sex"
                                                               name="sex"> 男
                                                        &nbsp;&nbsp;&nbsp;<input type="radio" value="女" class="sex"
                                                                                 name="sex"> 女
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <%--@declare id="permission"--%><label for="permission"
                                                                                           class="col-3 col-form-label ">账户权限:</label>
                                                    <div class="col-8">
                                                        <select name="permission" class="form-control">
                                                            <option value="普通管理员">普通管理员</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">关闭</button>
                                                <button type="submit" class="btn btn-primary">添加</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- 修改模态框 Model -->
                            <form method="post"
                                  class="form-horizontal" action="${pageContext.request.contextPath}/admin/updateAdmin" >
                                <div class="modal fade" id="updateAdminModal" tabindex="-1" aria-labelledby="UPdateAdmin"
                                     aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="UPdateAdmin">修改管理员信息</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <input type="hidden" name="usid" id="usid" value="">
                                                <div class="form-group row ">
                                                    <label for="adusername"
                                                           class="col-3 col-form-label">用户账号：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="adusername" name="username"
                                                                              value="" required
                                                                              placeholder="请输入账号...." /></div>
                                                    <span id="pwdInfo" class="col-md-8 ml-auto "></span>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="adname"
                                                           class="col-3 col-form-label ">用户名：</label>
                                                    <div class="col-7"><input type="text"  class="form-control"
                                                                              id="adname"
                                                                              name="name"
                                                                              value="" required
                                                                              placeholder="请输入用户昵称...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="adpassword"
                                                           class="col-3 col-form-label">账号密码：</label>
                                                    <div class="col-7"><input type="password" class="form-control"
                                                                              id="adpassword"
                                                                              name="password"
                                                                              value="" required
                                                                              placeholder="请输入登录密码...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="ademail"
                                                           class="col-3 col-form-label">电子邮箱:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="ademail"
                                                                              name="email"
                                                                              value="" required
                                                                              placeholder="请输入邮箱账号...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="adphone"
                                                           class="col-3 col-form-label">联系电话:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="adphone"
                                                                              name="phone"
                                                                              value="" required
                                                                              placeholder="请输入联系电话...." />
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <%--@declare id="sex"--%><label for="sex"
                                                                                    class="col-3 col-form-label">性别:</label>
                                                    <div class="col-7">
                                                        <div class="mt-2">
                                                        <input type="radio" checked class="sex"  name="sex" id="sex"
                                                               value="男"/>男
                                                        <input type="radio" class="sex" name="sex" id="sex"
                                                               value="女"/>女
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <%--@declare id="permission"--%><label for="permission"
                                                                                           class="col-3 col-form-label ">账户权限:</label>
                                                    <div class="col-8">
                                                        <select name="permission" class="form-control" style="pointer-events: none;">
                                                            <option value="普通管理员">普通管理员</option>
                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">关闭</button>
                                                <button type="submit" class="btn btn-primary">修改</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- 删除模态框示例（Modal） -->
                            <form method="post" action="${pageContext.request.contextPath}/admin/delectAdById"
                                  class="form-horizontal">
                                <div class="modal fade" id="delAdminModal" tabindex="-1"
                                     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel">管理员信息</h4>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-hidden="true">×</button>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal" role="form">
                                                    <div class="form-group">
                                                        <div class="col-sm-9">
                                                            <h5 class="col-sm-18 control-label" id="deleteLabel">删除信息</h5>
                                                            <input type="hidden" class="form-control" id="tab"
                                                                   name="tab" placeholder="" value="dor_admin">
                                                            <input
                                                                    type="hidden" class="form-control" id="admusid"
                                                                    name="usid"  placeholder="">
                                                            <input
                                                                    type="hidden" class="form-control" id="admusername"
                                                                    name="account" placeholder="">
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
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
                                            <a href="${pageContext.request.contextPath}/admin/allAdmin?pn=1"
                                               class="page-link">首页</a>
                                        </li>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasPreviousPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/allAdmin?pn=${pageInfo.prePage==0?1:pageInfo.prePage}"
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
                                                        href="${pageContext.request.contextPath}/admin/allAdmin?pn=${pageNum}"
                                                        class="page-link">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasNextPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/allAdmin?pn=${pageInfo.nextPage==pageInfo.pages?pageInfo.pages:pageInfo.nextPage}"
                                               class="page-link">下一页</a>
                                        </li>
                                        <li <c:if test="${pageInfo.isLastPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/admin/allAdmin?pn=${pageInfo.pages}"
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
    $(document).ready(function () {
        $("#username").blur(function () {
            document.get
            var acc =  $(this).val();
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/admin/findAccount",
                data:"username="+acc,
                success:function (msg) {
                    if (msg === true){
                        alert("账号名已存在"+msg);
                        $("#pwdInfo").css("color","red");
                        $("#pwdInfo").html("账号名已存在不可用");
                    }else {
                        $("#pwdInfo").css("color","green");
                        $("#pwdInfo").html("账号名不存在可用");
                    }
                }
            })
        });
    });

    $('#updateAdminModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var usid = button.data('usid')
        var username = button.data('username')
        var password = button.data('password')
        var name = button.data('name')
        var sex = button.data('sex')
        var email = button.data('email')
        var phone = button.data('phone')
        var modal = $(this)

        modal.find('.modal-title').text('修改管理员信息')
        modal.find('#usid').val(usid)
        modal.find('#adusername').val(username)
        modal.find('#adpassword').val(password)
        modal.find('#adname').val(name)
        /*modal.find('#sex').val(sex)*/
        var list =  modal.find('.sex')
        for(var i=0;i<list.length;i++){
            if(sex === $(list.get(i)).val()){
                $(list.get(i)).prop('checked',true)
            }
        }
        modal.find('#ademail').val(email)
        modal.find('#adphone').val(phone)
    });

    $('#delAdminModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var usid = button.data('usid')
        var username = button.data('username')
        var modal = $(this)
        modal.find('.modal-title').text('删除管理员信息')
        modal.find('#deleteLabel').text('是否删除' + username + '的账号信息')
        modal.find('#admusid').val(usid)
        modal.find('#admusername').val(username)

    });
</script>
<script type="text/javascript">
    function deleteAdminAll() {
        var checkNum = $("input[name='usids']:checked").length;
        if (checkNum == 0) {
            alert("请选择至少一项");
            return;
        }
        if (confirm("确定要删除吗？")) {
            var userList = new Array();
            $("input[name='usids']:checked").each(function () {
                userList.push($(this).val())
            });
        }
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/delectAdmin",
            data:{userList:userList.toString()},
            success:function () {
                alert("删除成功！");
                location.reload();
            },
            error:function () {
                alert("删除失败！");
            },
        })
    }
</script>
</html>
