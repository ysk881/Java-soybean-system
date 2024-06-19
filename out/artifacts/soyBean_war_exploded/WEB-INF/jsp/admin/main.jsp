<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>大豆种质资源管理数据库</title>
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
        function fileChange() {
            //注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性
            $.ajaxFileUpload({
                url: '${pageContext.request.contextPath}/manage/ajaxImg',//用于文件上传的服务器端请求地址
                secureuri: false,//一般设置为false
                //文件上传控件的id属性  <input type="file" id="pimage" name="pimage" />
                fileElementId: 'soyimage',
                dataType: 'json',//返回值类型 一般设置为json
                success: function (obj) //服务器成功响应处理函数
                {
                    alert(obj + "图片上传成功");
                    $("#imgDiv").empty();/*清空原有数据*/
                    //创建img 标签对象
                    var imgObj = $("<img>");
                    //给img标签对象追加属性
                    imgObj.attr("src", "${pageContext.request.contextPath}/image/" + obj.imgurl);//设置图片路径
                    imgObj.attr("width", "180px");//设置宽
                    imgObj.attr("height", "180px");//设置高
                    //将图片img标签追加到imgDiv末尾
                    $("#imgDiv").append(imgObj);
                    //将图片的名称（从服务端返回的JSON中取得）赋值给文件本框
                    $("#imgName").html(data.imgName);
                },
                error: function (e)//服务器响应失败处理函数
                {
                    alert(e.message);
                }
            });
        }
    </script>
    <script type="text/javascript">
        function fileUpChange() {
            //注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性
            $.ajaxFileUpload({
                url: '${pageContext.request.contextPath}/manage/ajaxImg',//用于文件上传的服务器端请求地址
                secureuri: false,//一般设置为false
                //文件上传控件的id属性  <input type="file" id="pimage" name="pimage" />
                fileElementId: 'image',
                dataType: 'json',//返回值类型 一般设置为json
                success: function (obj) //服务器成功响应处理函数
                {
                    alert(obj + "图片上传成功");
                    $("#ImgDiv").empty();/*清空原有数据*/
                    //创建img 标签对象
                    var imgObj = $("<img>");
                    //给img标签对象追加属性
                    imgObj.attr("src", "${pageContext.request.contextPath}/image/" + obj.imgurl);//设置图片路径
                    imgObj.attr("width", "180px");//设置宽
                    imgObj.attr("height", "180px");//设置高
                    //将图片img标签追加到imgDiv末尾
                    $("#ImgDiv").append(imgObj);
                    //将图片的名称（从服务端返回的JSON中取得）赋值给文件本框
                    $("#imgName").html(data.imgName);
                },
                error: function (e)//服务器响应失败处理函数
                {
                    alert(e.message);
                }
            });
        }
    </script>
    <script type="text/javascript">
        function d() {
            window.location.href = "${pageContext.request.contextPath}/manage/excel";
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#soyname").blur(function () {
                document.get
                var na = $(this).val();
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/manage/findname",
                    data: "name=" + na,
                    success: function (msg) {
                        if (msg === true) {
                            alert("此品种已存在" + msg);
                            $("#varietyinfo").css("color", "red");
                            $("#varietyinfo").html("该品种已存在");
                        } else {
                            $("#varietyinfo").css("color", "green");
                            $("#varietyinfo").html("该品种尚未存在,可以添加");
                        }
                    }
                })
            });
        });
    </script>
    <script type="text/javascript">
        /* 全选复选框功能实现 */
        function allClick() {
            /* 获取当前点击后全选按钮的状态 */
            var flag = $("#all").prop("checked");
            $("input[name='ids']").each(function () {
                this.checked = flag;
            })
        }

        /* 单个复选框点击改变全选复选框功能实现 */
        function ckClick() {
            /* 得到下面复选框的个数 */
            var fiveLength = $("input[name='ids']").length;
            /* 得到下方复选框选中的个数 */
            var checkedLength = $("input[name='ids']:checked").length;
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
                    <div class="card-body p-0 collapse show bg-transparent" id="b1" data-parent="#cardList">
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
                    <div class="card-body p-0 collapse  bg-transparent" id="b2" data-parent="#cardList">
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
									<span class="h5 font-weight-bold">全部品种
										<i class="bi bi-caret-right"></i>
										<small>全部种质资源管理</small>
										<i class="bi bi-forward"></i>
										<small>可以通过搜索相应的种质名称或抗病性对其信息进管理操作。★</small><small class="text-danger">（删除品种即可删除对应农艺性状！）</small>
									</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manage/allVariety" method="post">
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
                                                    class="col-form-label col-form-label-sm font-weight-bold text-right  text-secondary">抗病性状</label>
                                            <div class="col-7"><input type="text" class="form-control" name="illness"
                                                                      placeholder="请输入抗病性状..."/>
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
                <div class="col mt-2 ">
                    <div class="card px-3 ">
                        <div class="card-body">
                            <%--<form action="${pageContext.request.contextPath}/variety/deleteVarietys" method="post">--%>
                            <div>
                                <a href="${pageContext.request.contextPath}/manage/toAddVariety"
                                   class="btn btn-success" data-toggle="modal"
                                   data-target="#addModel">新增品种</a>
                                <button type="button" class="btn btn-danger" onclick="deleteVarAll()"><i
                                        class="bi bi-trash-fill"></i>批量删除
                                </button>
                                <a type="button" class="btn btn-success" onclick="d()">
                                    <i class="bi bi-cloud-arrow-up-fill"></i> 导出

                                </a>
                            </div>
                            <div class="table-responsive">

                                <table class="table small text-muted table-bordered mt-3">
                                    <tr>
                                        <th class="col-p-3"><input type="checkbox" id="all"
                                                                   onclick="allClick()"></th>
                                        <th class="col-p-4">品种名称</th>
                                        <th class="col-p-3">品种图片</th>
                                        <th class="col-p-8">适宜区域</th>
                                        <th class="col-p-8">品种来源</th>
                                        <th class="col-p-5">操作</th>
                                    </tr>
                                    <c:forEach var="var" items="${pageInfo.list}" varStatus="pages">
                                        <tr>
                                            <td style="padding-top: 40px"><input type="checkbox" name="ids" id="ids"
                                                                                 value="${var.id}"
                                                                                 onclick="ckClick()"></td>
                                            <td style="padding-top: 35px">${var.name}</td>
                                            <td><img src="${pageContext.request.contextPath}/image/${var.image}"
                                                     style="width: 89px;height: 89px;">
                                            </td>
                                            <td style="padding-top: 35px">${var.area}</td>
                                            <td style="padding-top: 35px">${var.source}</td>

                                            <td>
                                                <div class="btn-group mt-4">
                                                    <button type="button" class="btn btn-info btn-sm"
                                                            data-id="${var.id}"
                                                            data-name="${var.name}"
                                                            data-source="${var.source}"
                                                            data-yield="${var.yield}"
                                                            data-month="${var.month}"
                                                            data-rate="${var.rate}"
                                                            data-protect="${var.protect}"
                                                            data-area="${var.area}"
                                                            data-illness="${var.illness}"
                                                            data-image="${var.image}"
                                                            data-toggle="modal"
                                                            data-target="#selectVarModal">详情
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-warning btn-sm"
                                                            data-id="${var.id}"
                                                            data-name="${var.name}"
                                                            data-source="${var.source}"
                                                            data-yield="${var.yield}"
                                                            data-month="${var.month}"
                                                            data-rate="${var.rate}"
                                                            data-protect="${var.protect}"
                                                            data-area="${var.area}"
                                                            data-illness="${var.illness}"
                                                            data-image="${var.image}"
                                                            data-toggle="modal"
                                                            data-target="#updateVarModal">修改
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-primary btn-sm"
                                                            data-id="${var.id}"
                                                            data-name="${var.name}"
                                                            data-image="${var.image}"
                                                            data-toggle="modal"
                                                            data-target="#updateImgModal">改图
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-id="${var.id}"
                                                            data-name="${var.name}"
                                                            data-toggle="modal"
                                                            data-target="#delVarModal">
                                                        <i class="fa fa-user-times"></i>删除
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                            <%--  </form>--%>

                            <!-- 添加模态框 Model -->
                            <form action="${pageContext.request.contextPath}/manage/save" method="post"
                                  class="form-horizontal">
                                <div class="modal fade" id="addModel" tabindex="-1" aria-labelledby="AddLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="AddLabel">添加品种信息</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <div class="form-group row">
                                                    <label for="name"
                                                           class="col-3 col-form-label">品种名称：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="soyname"
                                                                              name="name"
                                                                              placeholder="请输入品种名称...."/></div>
                                                    <span id="varietyinfo" class="col-md-8 ml-auto "></span>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="source"
                                                           class="col-3 col-form-label ">品种来源：</label>
                                                    <div class="col-8"><textarea class="form-control" id="soysource"
                                                                                 name="source"
                                                                                 placeholder="请输入品种来源...."></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="yield" class="col-form-label">产量(kg/hm2)：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="soyyield"
                                                                              name="yield"
                                                                              placeholder="请输入产量(kg/hm2)...."/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="month" class="col-3 col-form-label">播种月份:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="soymonth"
                                                                              name="month"
                                                                              placeholder="请输入播种月份...."/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="rate"
                                                           class="col-3 col-form-label">播量/kg:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="soyrate"
                                                                              name="rate"
                                                                              placeholder="请输入播量/kg...."/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="protect" class="col-form-label">保苗/万株/hm²:</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              id="soyprotect"
                                                                              name="protect"
                                                                              placeholder="请输入保苗/万株/hm²...."/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="area"
                                                           class="col-3 col-form-label ">适宜区域:</label>
                                                    <div class="col-8"><textarea class="form-control" id="soyarea"
                                                                                 name="area"
                                                                                 placeholder="请输入适宜区域...."></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="illness"
                                                           class="col-3 col-form-label ">抗病毒性:</label>
                                                    <div class="col-8"><textarea class="form-control" id="soyillness"
                                                                                 name="illness"
                                                                                 placeholder="请输入抗病毒性...."></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="soyimage" class="col-sm-3 control-label">图片展示:</label>
                                                    <div id="imgDiv" class="img-thumbnail"
                                                         style="display:block; width: 200px; height: 200px;"></div>
                                                    <br>
                                                    <input style="margin-left: 18px;" type="file" name="image" id="soyimage"
                                                           onchange="fileChange()"><br>
                                                    <span id="imgNames"></span>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭
                                                </button>
                                                <button type="submit" class="btn btn-primary">添加品种</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- 修改品种模态框 Model -->
                            <form action="${pageContext.request.contextPath}/manage/updateVar"
                                  class="form-horizontal" method="post">
                                <div class="modal fade" id="updateVarModal" tabindex="-1"
                                     aria-labelledby="updateModelLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateModelLabel">修改品种信息</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <%--出现的问题：我们提交了修改sql请求，但是修改失败，初次考虑，是事务问题，配置完毕事务，依旧失败！--%>
                                                <%--看一下sql语句，能否执行成功 sql执行失败，修改未完成--%>
                                                <%--前端传递隐藏域--%>
                                                <input type="hidden" name="id" id="id" value="">
                                                <input type="hidden" value="" name="image" id="vvimage">
                                                <div class="form-group row">
                                                    <label for="name"
                                                           class="col-3 col-form-label">品种名称：</label>
                                                    <div class="col-7"><input type="text" class="form-control"
                                                                              name="name" required
                                                                              id="name" value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="source"
                                                           class="col-3 col-form-label ">品种来源：</label>
                                                    <div class="col-8"><textarea class="form-control" name="source"
                                                                                 id="source"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="yield" class="col-form-label">产量(kg/hm2)：</label>
                                                    <div class="col-7"><input type="text" name="yield"
                                                                              class="form-control"
                                                                              id="yield"/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="month" class="col-3 col-form-label">播种月份:</label>
                                                    <div class="col-7"><input type="text" name="month"
                                                                              class="form-control"
                                                                              id="month"/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="rate"
                                                           class="col-3 col-form-label">播量/kg:</label>
                                                    <div class="col-7"><input type="text" name="rate"
                                                                              class="form-control" id="rate"
                                                                              value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="protect" class="col-form-label">保苗/万株/hm²:</label>
                                                    <div class="col-7"><input type="text" name="protect"
                                                                              class="form-control" id="protect"
                                                                              value=""/></div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="area"
                                                           class="col-3 col-form-label ">适宜区域:</label>
                                                    <div class="col-8"><textarea name="area" class="form-control"
                                                                                 id="area"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="illness"
                                                           class="col-3 col-form-label ">抗病毒性:</label>
                                                    <div class="col-8"><textarea name="illness" class="form-control"
                                                                                 id="illness"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="image" class="col-sm-3 control-label">图片展示:</label>
                                                    <%--     <div id="ImgDiv"
                                                              style="display:block; width: 200px; height: 200px;">
                                                             <img
                                                                 style="display:block; width: 180px; height: 180px;"
                                                                 src=""  id="vaimage">
                                                         </div>--%>
                                                    <img
                                                            style="display:block; width: 180px; height: 180px;"
                                                            src="" id="vaimage">
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
                            <!-- 修改图片模态框 Model -->
                            <form action="${pageContext.request.contextPath}/manage/updateImg"
                                  class="form-horizontal" method="post">
                                <div class="modal fade" id="updateImgModal" tabindex="-1"
                                     aria-labelledby="updateModel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="updateModel">修改品种图片</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body ">
                                                <%--出现的问题：我们提交了修改sql请求，但是修改失败，初次考虑，是事务问题，配置完毕事务，依旧失败！--%>
                                                <%--看一下sql语句，能否执行成功 sql执行失败，修改未完成--%>
                                                <%--前端传递隐藏域--%>
                                                <input type="hidden" name="id" id="imageid" value="">
                                                <input type="hidden" value="" name="image" id="vimage">
                                                <div class="form-group row">
                                                    <label for="name"
                                                           class="col-3 col-form-label">品种名称：</label>
                                                    <div class="col-7">
                                                        <input type="text" class="form-control" disabled="disabled"
                                                               id="imagename"
                                                               style="border: none;background-color:transparent;"/>

                                                    </div>
                                                </div>

                                                <div class="form-group row">
                                                    <label for="image" class="col-sm-3 control-label">图片展示:</label>
                                                    <div id="ImgDiv"
                                                         style="display:block; width: 200px; height: 200px;">
                                                        <img
                                                                style="display:block; width: 180px; height: 180px;"
                                                                src="" id="imgimage">
                                                    </div>
                                                    <br>
                                                    <input type="file" name="image" id="image"
                                                           onchange="fileUpChange()"><br>
                                                    <span id="imgName"></span>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭
                                                </button>
                                                <button type="submit" class="btn btn-primary" id="updateinfo">确认修改
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- 品种详情模态框 Model -->
                            <div class="modal fade" id="selectVarModal" tabindex="-1" aria-labelledby="infoModelLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="infoModelLabel">品种详情页</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- 品种 -->
                                            <input type="hidden" name="id" id="vid" value="">
                                            <div class="row">
                                                <div class="col-md-8 column ">
                                                    <div class="page-header">
                                                        <h2>
                                                            品种：<input type="text" disabled="disabled" id="vname"
                                                                      style="border: none;background-color:transparent;"/>
                                                        </h2>
                                                    </div>
                                                    <table class="table table-hover table-striped">
                                                        <tr>
                                                            <th>产量（kg/hm2）</th>
                                                            <td><input type="text" disabled="disabled" id="vyield"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>播种月份</th>
                                                            <td><input type="text" disabled="disabled" id="vmonth"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <th>播量/kg</th>
                                                            <td><input type="text" disabled="disabled" id="vrate"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                            <th>保苗/万株/hm²</th>
                                                            <td><input type="text" disabled="disabled" id="vprotect"
                                                                       style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>适宜区域</th>
                                                            <td colspan="4"><input type="text" disabled="disabled"
                                                                                   id="varea" class="form-control"
                                                                                   style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>品种来源</th>
                                                            <td colspan="4"><input type="text" disabled="disabled"
                                                                                   id="vsource" class="form-control"
                                                                                   style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>抗病性</th>
                                                            <td colspan="4"><input type="text" name="illness"
                                                                                   class="form-control" id="villness"
                                                                                   value=""
                                                                                   style="border: none;background-color:transparent;"/>
                                                            </td>
                                                        </tr>

                                                    </table>
                                                </div>
                                                <div class=" col-md-4  bg-light">
                                                    <img class="img-rounded" style="width: 320px;height: 320px;"
                                                         src="" id="vimg">
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

                            <!-- 删除模态框示例（Modal） -->
                            <form method="post" action="${pageContext.request.contextPath}/manage/delectVarId"
                                  class="form-horizontal">
                                <div class="modal fade" id="delVarModal" tabindex="-1"
                                     role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="myModalLabel">品种信息</h4>
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
                                                                   name="tab" placeholder="" value="dor_var">
                                                            <input
                                                                    type="hidden" class="form-control" id="did"
                                                                    name="id" placeholder="">
                                                            <input
                                                                    type="hidden" class="form-control" id="dname"
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
                                            <a href="${pageContext.request.contextPath}/manage/allVariety?pn=1"
                                               class="page-link">首页</a>
                                        </li>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasPreviousPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allVariety?pn=${pageInfo.prePage==0?1:pageInfo.prePage}"
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
                                                        href="${pageContext.request.contextPath}/manage/allVariety?pn=${pageNum}"
                                                        class="page-link">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasNextPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allVariety?pn=${pageInfo.nextPage==pageInfo.pages?pageInfo.pages:pageInfo.nextPage}"
                                               class="page-link">下一页</a>
                                        </li>
                                        <li <c:if test="${pageInfo.isLastPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allVariety?pn=${pageInfo.pages}"
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

    $('#selectVarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var name = button.data('name')
        var source = button.data('source')
        var yield = button.data('yield')
        var month = button.data('month')
        var rate = button.data('rate')
        var protect = button.data('protect')
        var area = button.data('area')
        var illness = button.data('illness')
        var image = button.data('image')
        var modal = $(this)

        modal.find('.modal-title').text('品种详情信息')
        modal.find('#vid').val(id)
        modal.find('#vname').val(name)
        modal.find('#vsource').val(source)
        modal.find('#vyield').val(yield)
        modal.find('#vmonth').val(month)
        modal.find('#vrate').val(rate)
        modal.find('#vprotect').val(protect)
        modal.find('#varea').val(area)
        modal.find('#villness').val(illness)
        /*modal.find('#image').val(image)*/
        var imgModel = document.getElementById("vimg");
        imgModel.src = "${pageContext.request.contextPath}/image/" + image;
    });


    $('#updateVarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var name = button.data('name')
        var source = button.data('source')
        var yield = button.data('yield')
        var month = button.data('month')
        var rate = button.data('rate')
        var protect = button.data('protect')
        var area = button.data('area')
        var illness = button.data('illness')
        var image = button.data('image')
        var modal = $(this)

        modal.find('.modal-title').text('修改品种信息')
        modal.find('#id').val(id)
        modal.find('#name').val(name)
        modal.find('#source').val(source)
        modal.find('#yield').val(yield)
        modal.find('#month').val(month)
        modal.find('#rate').val(rate)
        modal.find('#protect').val(protect)
        modal.find('#area').val(area)
        modal.find('#illness').val(illness)
        modal.find('#vvimage').val(image)
        var imgModel = document.getElementById("vaimage");
        imgModel.src = "${pageContext.request.contextPath}/image/" + image;
    });

    $('#updateImgModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var name = button.data('name')
        var image = button.data('image')
        var modal = $(this)

        modal.find('.modal-title').text('修改品种图片')
        modal.find('#imageid').val(id)
        modal.find('#imagename').val(name)
        modal.find('#vimage').val(image)
        var imgModel = document.getElementById("imgimage");
        imgModel.src = "${pageContext.request.contextPath}/image/" + image;
    });

    $('#delVarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var name = button.data('name')
        var modal = $(this)
        modal.find('.modal-title').text('删除品种信息')
        modal.find('#deleteLabel').text('是否删除品种：' + name)
        modal.find('#did').val(id)
        modal.find('#dname').val(name)

    });
</script>
<script type="text/javascript">
    function deleteVarAll() {
        var checkNum = $("input[name='ids']:checked").length;
        if (checkNum == 0) {
            alert("请选择至少一项");
            return;
        }
        if (confirm("确定要删除吗？")) {
            var varList = new Array();
            $("input[name='ids']:checked").each(function () {
                varList.push($(this).val())
            });
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/manage/deleteVar",
            data: {varList: varList.toString()},
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
<script type="text/javascript">
    $('#vimage').attr('src', '${pageContext.request.contextPath}/image/'); // 设置新的图片路径
</script>
</html>

