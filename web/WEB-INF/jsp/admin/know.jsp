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
        function knowChange() {
            //注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性
            $.ajaxFileUpload({
                url: '${pageContext.request.contextPath}/manage/ajaxImage',//用于文件上传的服务器端请求地址
                secureuri: false,//一般设置为false
                //文件上传控件的id属性  <input type="file" id="pimage" name="pimage" />
                fileElementId: 'knimage',
                dataType: 'json',//返回值类型 一般设置为json
                success: function (obj) //服务器成功响应处理函数
                {
                    alert(obj + "图片上传成功");
                    $("#imageDiv").empty();/*清空原有数据*/
                    //创建img 标签对象
                    var imgObj = $("<img>");
                    //给img标签对象追加属性
                    imgObj.attr("src", "${pageContext.request.contextPath}/image/" + obj.imgurl);//设置图片路径
                    imgObj.attr("width", "180px");//设置宽
                    imgObj.attr("height", "180px");//设置高
                    //将图片img标签追加到imgDiv末尾
                    $("#imageDiv").append(imgObj);
                    //将图片的名称（从服务端返回的JSON中取得）赋值给文件本框
                    $("#knimgName").html(data.imgName);
                },
                error: function (e)//服务器响应失败处理函数
                {
                    alert(e.message);
                }
            });
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
                    <div class="card-head p-3 border-top  shadow-sm bg-transparent" data-toggle="collapse"
                         data-target="#b3">
                        <i class="bi bi-person-fill-gear mr-2"></i>
                        <span>科普知识管理</span>
                        <i class="bi bi-chevron-double-down float-right"></i>
                    </div>
                    <div class="card-body p-0 collapse show bg-transparent" id="b3" data-parent="#cardList">
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
									<span class="h5 font-weight-bold">科普知识
										<i class="bi bi-caret-right"></i>
										<small>科普管理</small>
										<i class="bi bi-forward"></i>
										<small>可以通过搜索科普名进行修改、删除等管理操作。★</small>
									</span>
                        </div>
                        <div class="card-body">
                            <form action="${pageContext.request.contextPath}/manage/allknow" method="post">
                                <div class="row ml-2">
                                    <div class="col">
                                        <div class="form-group row">
                                            <label for=""
                                                   class="col-form-label col-form-label-sm font-weight-bold text-right   text-secondary">科普名：</label>
                                            <div class="col-4">
                                                <input type="text" class="form-control" name="knname" id=""
                                                       value=""/>
                                            </div>
                                            <div class="form-group">
                                                <button type="submit"
                                                        class="btn btn-info"><i
                                                        class="bi bi-search"></i>&nbsp;搜&nbsp;&nbsp;索
                                                </button>
                                            </div>
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
                                    <a href="${pageContext.request.contextPath}/manage/toAddknow"
                                       class="btn btn-success" data-toggle="modal"
                                       data-target="#addModel">新增科普信息</a>
                                    <button type="button" class="btn btn-danger" onclick="deleteKnAll()"><i
                                            class="bi bi-trash-fill"></i>批量删除
                                    </button>
                                </div>
                            <div class="table-responsive">

                                <table class="table small text-muted table-bordered mt-3">
                                    <tr>
                                        <th class="col-p-3"><input type="checkbox" id="all"
                                                                   onclick="allknClick()" ></th>
                                        <th class="col-p-3">科普名</th>
                                        <th class="col-p-3">学名</th>
                                        <th class="col-p-3">种类</th>
                                        <th class="col-p-5">科普图片</th>
                                        <th class="col-p-10">科普内容</th>
                                        <th class="col-p-5">操作</th>
                                    </tr>
                                    <c:forEach var="know" items="${pageInfo.list}" varStatus="pages">
                                        <tr>
                                            <td style="padding-top: 40px"><input type="checkbox" name="knids" id="knids"
                                                                                 value="${know.knid}"
                                                                                 onclick="knClick()"></td>
                                            <td style="padding-top: 35px">${know.knname}</td>
                                            <td style="padding-top: 35px">${know.knspell}</td>
                                            <td style="padding-top: 35px">${know.knsort}</td>
                                            <td><img src="${pageContext.request.contextPath}/image/${know.knimg}"
                                                     style="width: 89px;height: 89px;">
                                            </td>
                                            <td style="padding-top: 35px;white-space: nowrap;
                                            overflow: hidden;text-overflow: ellipsis;
                                            max-width: 100px;">${know.kninfo}</td>

                                            <td>
                                                <div class="btn-group mt-4">
                                                    <button type="button" class="btn btn-info btn-sm"
                                                            data-knid="${know.knid}"
                                                            data-knname="${know.knname}"
                                                            data-knspell="${know.knspell}"
                                                            data-knalias="${know.knalias}"
                                                            data-kninfo="${know.kninfo}"
                                                            data-knimg="${know.knimg}"
                                                            data-kntrait="${know.kntrait}"
                                                            data-kngrow="${know.kngrow}"
                                                            data-knradius="${know.knradius}"
                                                            data-kncultivate="${know.kncultivate}"
                                                            data-knvalue="${know.knvalue}"
                                                            data-toggle="modal"
                                                            data-target="#selknModal">详情
                                                    </button>&nbsp;&nbsp;
                                                    <button type="button" class="btn btn-danger btn-sm"
                                                            data-knid="${know.knid}"
                                                            data-knname="${know.knname}"
                                                            data-toggle="modal"
                                                            data-target="#delKnModal">
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
                                <form action="${pageContext.request.contextPath}/manage/addknow" method="post"
                                      class="form-horizontal">
                                    <!-- 添加模态框 Model -->
                                    <div class="modal fade" id="addModel" tabindex="-1" aria-labelledby="AddLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="AddLabel">添加科普信息</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body ">
                                                    <form class="form-horizontal" action="">
                                                        <div class="form-group row ">
                                                            <label
                                                                    class="col-3 col-form-label">科普种类：</label>
                                                            <div class="col-7"><select name="knsort" class="form-control">
                                                                <option value="豆类">豆类</option>
                                                                <option value="农作物">农作物</option>
                                                            </select>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row ">
                                                            <label
                                                                    class="col-3 col-form-label">科普名：</label>
                                                            <div class="col-7"><input type="text"
                                                                                      class="form-control"
                                                                                      name="knname"
                                                                                      value="" placeholder="请输入科普名...."/>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row ">
                                                            <label
                                                                    class="col-3 col-form-label">学名：</label>
                                                            <div class="col-7"><input type="text"
                                                                                      class="form-control"
                                                                                      name="knspell"
                                                                                      value="" placeholder="请输入学名...."/>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row ">
                                                            <label
                                                                    class="col-3 col-form-label">别名：</label>
                                                            <div class="col-7"><input type="text"
                                                                                      class="form-control"
                                                                                      name="knalias"
                                                                                      value="" placeholder="请输入别名、化名...."/>
                                                            </div>

                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-sm-3 control-label">图片展示:</label>
                                                            <div id="imageDiv"
                                                                 style="display:block; width: 200px; height: 200px;">
                                                                <img class="img-thumbnail" src=""/></div>
                                                            <br>
                                                            <input style="margin-left: 18px;" type="file" name="knimg"
                                                                   id="knimage"
                                                                   onchange="knowChange()"><br>
                                                            <span id="knimgName"></span>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-3 col-form-label ">科普内容:</label>
                                                            <div class="col-8"><textarea class="form-control"
                                                                                         name="kninfo"
                                                                                         placeholder="请输入基本介绍...."></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-3 col-form-label ">形态特征:</label>
                                                            <div class="col-8"><textarea class="form-control"
                                                                                         name="kntrait"
                                                                                         placeholder="请输入形态特征...."></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-3 col-form-label ">生长环境:</label>
                                                            <div class="col-8"><textarea class="form-control"
                                                                                         name="kngrow"
                                                                                         placeholder="请输入生长环境...."></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-3 col-form-label ">分布范围:</label>
                                                            <div class="col-8"><textarea class="form-control"
                                                                                         name="knradius"
                                                                                         placeholder="请输入分布范围...."></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-3 col-form-label ">栽培技术:</label>
                                                            <div class="col-8"><textarea class="form-control"
                                                                                         name="kncultivate"
                                                                                         placeholder="请输入栽培技术...."></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label
                                                                    class="col-3 col-form-label ">主要价值:</label>
                                                            <div class="col-8"><textarea class="form-control"
                                                                                         name="knvalue"
                                                                                         placeholder="请输入主要价值...."></textarea>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">关闭
                                                    </button>
                                                    <button type="submit" class="btn btn-primary">添加</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                                <!-- 详情模态框 Model -->
                                <div class="modal fade" id="selknModal" tabindex="-1" aria-labelledby="infoModelLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="infoModelLabel">科普知识内容详情</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="knowbody">
                                                    <div class="container">
                                                        <div class="row clearfix">
                                                            <div class="col-md-12 column">
                                                                <div class="row flex-column m-2">
                                                                    <div class="col">
                                                                        <div class="card px-1">
                                                                            <div class="card-header bg-white text-cinerous">
                                                                                <i class="bi bi-caret-right"></i>
                                                                                <span class="h5 font-weight-bold"><a href=""
                                                                                                                     class="text-decoration-none">科普知识</a>

														</span>
                                                                            </div>
                                                                            <div class="card-body">

                                                                                <div class="row col-md-12 column">
                                                                                    <div class="col-md-6">
                                                                                        <div class="text-center">
                                                                                            <p></p>
                                                                                            <h2 class="text-center"><input
                                                                                                    type="text"
                                                                                                    style="border: none; width: 180px;"
                                                                                                    name="knname"
                                                                                                    id="knowname" value=""/>
                                                                                            </h2>
                                                                                            <p></p>
                                                                                            <span
                                                                                                    class="font-weight-bold">学名</span>&nbsp;:&nbsp;<span><input
                                                                                                type="text" name="knspell"
                                                                                                id="knowspell"
                                                                                                style="border: none;"
                                                                                                value=""/></span>
                                                                                            <p></p>
                                                                                            <span
                                                                                                    class="font-weight-bold">别名</span>&nbsp;:&nbsp;
                                                                                            <textarea rows="1" cols="50"
                                                                                                      disabled="disabled"
                                                                                                      id="knowalias"
                                                                                                      name="knalias"
                                                                                                      class="text-justify"
                                                                                                      style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;"
                                                                                                      value=""></textarea>
                                                                                        </div>

                                                                                    </div>
                                                                                    <div class="col-md-6 ">
                                                                                        <img src=""
                                                                                             class="rounded mx-auto d-block"
                                                                                             id="knowimg" width="320px;">
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

														<textarea rows="8" cols="130" class="text-break "
                                                                  disabled="disabled" id="knowinfo" name="kninfo"
                                                                  style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;"></textarea>


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
														<textarea rows="8" cols="130" class="text-break "
                                                                  disabled="disabled" id="knowtrait" name="kntrait"
                                                                  style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;"></textarea>
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
														<textarea rows="8" cols="130" class="text-break "
                                                                  disabled="disabled" id="knowgrow" name="kngrow"
                                                                  style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;"></textarea>
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
														<textarea rows="8" cols="130" class="text-break "
                                                                  disabled="disabled" id="knowradius" name="knradius"
                                                                  style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;"></textarea>
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
														<textarea rows="8" cols="130" class="text-break "
                                                                  disabled="disabled" id="knowcultivate"
                                                                  name="kncultivate"
                                                                  style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;">
															</textarea>

                                                                            </div>
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
													<textarea rows="8" cols="130" class="text-break "
                                                              disabled="disabled" id="knowvalue" name="knvalue"
                                                              style="border: 0;background-color:rgba(0, 0, 0, 0); outline: none;">
														</textarea>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭
                                                </button>
                                                <button type="button" class="btn btn-primary" data-dismiss="modal">确定
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- 删除模态框示例（Modal） -->
                                <form method="post" action="${pageContext.request.contextPath}/manage/delKnow"
                                      class="form-horizontal">
                                    <div class="modal fade" id="delKnModal" tabindex="-1"
                                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel">科普编号</h4>
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
                                                                       name="tab" placeholder="" value="know_var">
                                                                <input
                                                                        type="hidden" class="form-control" id="knoid"
                                                                        name="knid" placeholder="">
                                                                <input
                                                                        type="hidden" class="form-control" id="knoname"
                                                                        name="knname" placeholder="">
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
                                            <a href="${pageContext.request.contextPath}/manage/allknow?pn=1"
                                               class="page-link">首页</a>
                                        </li>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasPreviousPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allknow?pn=${pageInfo.prePage==0?1:pageInfo.prePage}"
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
                                                        href="${pageContext.request.contextPath}/manage/allknow?pn=${pageNum}"
                                                        class="page-link">${pageNum}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <%--跳到下一页 判断是否有下一页 则不可点击后跳 class="disabled" --%>
                                        <li <c:if test="${!pageInfo.hasNextPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allknow?pn=${pageInfo.nextPage==pageInfo.pages?pageInfo.pages:pageInfo.nextPage}"
                                               class="page-link">下一页</a>
                                        </li>
                                        <li <c:if test="${pageInfo.isLastPage}">class="page-item disabled"</c:if>>
                                            <a href="${pageContext.request.contextPath}/manage/allknow?pn=${pageInfo.pages}"
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

    $('#selknModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var knid = button.data('knid')
        var knname = button.data('knname')
        var knspell = button.data('knspell')
        var knalias = button.data('knalias')
        var knimg = button.data('knimg')
        var kninfo = button.data('kninfo')
        var kntrait = button.data('kntrait')
        var kngrow = button.data('kngrow')
        var knradius = button.data('knradius')
        var kncultivate = button.data('kncultivate')
        var knvalue = button.data('knvalue')
        var modal = $(this)

        modal.find('.modal-title').text('详情信息')
        modal.find('#knowid').val(knid)
        modal.find('#knowname').val(knname)
        modal.find('#knowspell').val(knspell)
        modal.find('#knowalias').val(knalias)
        modal.find('#knowtrait').val(kntrait)
        modal.find('#knowinfo').val(kninfo)
        modal.find('#knowgrow').val(kngrow)
        modal.find('#knowradius').val(knradius)
        modal.find('#knowcultivate').val(kncultivate)
        modal.find('#knowvalue').val(knvalue)

        /*modal.find('#image').val(image)*/
        var imgModel = document.getElementById("knowimg");
        imgModel.src = "${pageContext.request.contextPath}/image/" + knimg;
    });


    $('#delKnModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var knid = button.data('knid')
        var knname = button.data('knname')
        var modal = $(this)
        modal.find('.modal-title').text('删除信息')
        modal.find('#deleteLabel').text('是否删除：' + knname + '的科普内容')
        modal.find('#knoid').val(knid)
        modal.find('#knoname').val(knname)

    });
</script>
<script type="text/javascript">
    function deleteKnAll() {
        var checkNum = $("input[name='knids']:checked").length;
        if (checkNum == 0) {
            alert("请选择至少一项");
            return;
        }
        if (confirm("确定要删除吗？")) {
            var knowList = new Array();
            $("input[name='knids']:checked").each(function () {
                knowList.push($(this).val())
            });
        }
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/manage/delKnows",
            data: {knowList: knowList.toString()},
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
    /* 全选复选框功能实现 */
    function allknClick() {
        /* 获取当前点击后全选按钮的状态 */
        var flag = $("#all").prop("checked");
        $("input[name='knids']").each(function () {
            this.checked = flag;
        })
    }

    /* 单个复选框点击改变全选复选框功能实现 */
    function knClick() {
        /* 得到下面复选框的个数 */
        var fiveLength = $("input[name='knids']").length;
        /* 得到下方复选框选中的个数 */
        var checkedLength = $("input[name='knids']:checked").length;
        /* 进行对比，改变全选复选框状态 */
        if (fiveLength == checkedLength) {
            $("#all").prop("checked", true);
        } else {
            $("#all").prop("checked", false);
        }
    }

</script>

</html>

