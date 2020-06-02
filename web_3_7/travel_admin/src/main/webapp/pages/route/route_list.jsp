<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${ctx}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${ctx}/plugins/adminLTE/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${ctx}/plugins/adminLTE/css/skins/skin-blue.min.css">
    <script src="${ctx}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#checkAll').click(function () {
                var elements = document.getElementsByName('rid');
                for (var element of elements) {
                    $(element).prop("checked", $(this).prop("checked"));
                }
            });

            $('#delBatch').click(function () {
                if (confirm("确定要删除吗?")) {
                    $('#listForm').submit();
                }
            });
        });


    </script>
</head>
<body>
<div id="frameContent" class="content" style="margin-left:0px;padding-top: 0px;">
    <!-- 标题 -->
    <section class="content-header">
        <h1>
            线路查询
            <small>query route</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.html"><i class="fa fa-dashboard"></i>首页</a></li>
            <li class="active">线路管理</li>
        </ol>
    </section>

    <!-- 内容 -->
    <section class="content container-fluid">
        <div class="row">
            <div class="box box-info" style="padding-left: 0px;">
                <!--搜索-->
                <br>
                <form role="form" action="route/findRoutesByPage" method="post">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-md-6" style="padding-left: 0px;">
                                <input type="text" class="form-control" id="rname" name="rname" placeholder="请输入线路名字"
                                       value="${rname}">
                            </div>
                            <div class="col-md-1">
                                <button type="submit" class="btn btn-success" style="width:100px"><i
                                        class="ion-search"></i>查询
                                </button>
                            </div>
                            <div class="col-md-5">
                                <button type="button" id="delBatch" class="btn btn-danger" style="width:100px"><i
                                        class="fa fa-fw fa-remove"></i>批量删除
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </form>


                <!-- /.box-header -->
                <div class="box-body">
                    <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                        <div class="row">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6"></div>
                        </div>
                        <div class="row">
                            <form action="route/delRoute" method="post"
                                  id="listForm">
                                <table id="example2" class="table table-bordered table-hover dataTable"
                                       role="grid" aria-describedby="example2_info">
                                    <colgroup>
                                        <col width="5%">
                                        <col width="5%">
                                        <col width="10%">
                                        <col width="45%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                            colspan="1"
                                            aria-label="Rendering engine: activate to sort column ascending">
                                            <input type="checkbox" id="checkAll">勾选
                                        </th>
                                        <th class="sorting_asc" tabindex="0" aria-controls="example2"
                                            rowspan="1" colspan="1"
                                            aria-label="Browser: activate to sort column descending"
                                            aria-sort="ascending">编号
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                            colspan="1"
                                            aria-label="Platform(s): activate to sort column ascending">
                                            图片
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                            colspan="1"
                                            aria-label="Engine version: activate to sort column ascending">
                                            线路名称
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                            colspan="1"
                                            aria-label="CSS grade: activate to sort column ascending">线路价格
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                            colspan="1"
                                            aria-label="CSS grade: activate to sort column ascending">收藏数量
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1"
                                            colspan="1"
                                            aria-label="CSS grade: activate to sort column ascending">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${pageBean.data}" var="route" varStatus="row">
                                        <tr role="row">
                                            <td class=""><input type="checkbox" name="rid" value="${route.rid}"></td>
                                            <td class="sorting_1">${(pageBean.current-1)*pageBean.size + row.count}</td>
                                            <td><img
                                                    src="${ctx}/${route.rimage}"
                                                    width="99px"></td>
                                            <td>${route.rname}</td>
                                            <td>${route.price}</td>
                                            <td>${route.count}</td>
                                            <td>
                                                <a class="btn btn-primary"
                                                   href="${pageContext.request.contextPath}/route/findRouteByRid?rid=${route.rid}"
                                                   target="iframe"><i
                                                        class="fa fa-fw fa-edit"></i> 修改</a>
                                                <a class="btn btn-danger"
                                                   href="route/delRoute?rid=${route.rid}"><i
                                                        class="fa fa-fw fa-remove"></i> 删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <%--<tr role="row">
                                        <td class=""><input type="checkbox" name="rid"></td>
                                        <td class="sorting_1">1</td>
                                        <td><img
                                                src="${ctx}/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg"
                                                width="99px"></td>
                                        <td>【¥1099秒杀 约惠华东五市+乌镇+木渎+灵山大佛 双飞6天 无锡进上海出】升级2晚豪华酒店</td>
                                        <td>1099.0</td>
                                        <td>1000</td>
                                        <td>
                                            <a class="btn btn-primary" href="route_update.jsp" target="iframe"><i
                                                    class="fa fa-fw fa-edit"></i> 修改</a>
                                            <a class="btn btn-danger" href="javascript:delRoute(7)"><i
                                                    class="fa fa-fw fa-remove"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr role="row">
                                        <td class=""><input type="checkbox" name="rid"></td>
                                        <td class="sorting_1">2</td>
                                        <td><img
                                                src="${ctx}/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg"
                                                width="99px"></td>
                                        <td>【¥1099秒杀 约惠华东五市+乌镇+木渎+灵山大佛 双飞6天 无锡进上海出】升级2晚豪华酒店</td>
                                        <td>1099.0</td>
                                        <td>1000</td>
                                        <td>
                                            <a class="btn btn-primary" href="route_update.jsp"><span
                                                    class="fa fa-fw fa-edit"></span> 修改</a>
                                            <a class="btn btn-danger" href="javascript:delRoute(7)"><i
                                                    class="fa fa-fw fa-remove"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr role="row">
                                        <td class=""><input type="checkbox" name="rid"></td>
                                        <td class="sorting_1">3</td>
                                        <td><img
                                                src="${ctx}/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg"
                                                width="99px"></td>
                                        <td>【¥1099秒杀 约惠华东五市+乌镇+木渎+灵山大佛 双飞6天 无锡进上海出】升级2晚豪华酒店</td>
                                        <td>1099.0</td>
                                        <td>1000</td>
                                        <td>
                                            <a class="btn btn-primary" href="route_update.jsp"><i
                                                    class="fa fa-fw fa-edit"></i> 修改</a>
                                            <a class="btn btn-danger" href="javascript:delRoute(7)"><i
                                                    class="fa fa-fw fa-remove"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr role="row">
                                        <td class=""><input type="checkbox" name="rid"></td>
                                        <td class="sorting_1">4</td>
                                        <td><img
                                                src="${ctx}/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg"
                                                width="99px"></td>
                                        <td>【¥1099秒杀 约惠华东五市+乌镇+木渎+灵山大佛 双飞6天 无锡进上海出】升级2晚豪华酒店</td>
                                        <td>1099.0</td>
                                        <td>1000</td>
                                        <td>
                                            <a class="btn btn-primary" href="route_update.jsp"><span
                                                    class="fa fa-fw fa-edit"></span> 修改</a>
                                            <a class="btn btn-danger" href="javascript:delRoute(7)"><i
                                                    class="fa fa-fw fa-remove"></i> 删除</a>
                                        </td>
                                    </tr>
                                    <tr role="row">
                                        <td class=""><input type="checkbox" name="rid"></td>
                                        <td class="sorting_1">5</td>
                                        <td><img
                                                src="${ctx}/img/product/small/m35c17b5b73d618bbdd2abe231f1307838.jpg"
                                                width="99px"></td>
                                        <td>【¥1099秒杀 约惠华东五市+乌镇+木渎+灵山大佛 双飞6天 无锡进上海出】升级2晚豪华酒店</td>
                                        <td>1099.0</td>
                                        <td>1000</td>
                                        <td>
                                            <a class="btn btn-primary" href="route_update.jsp"><i
                                                    class="fa fa-fw fa-edit"></i> 修改</a>
                                            <a class="btn btn-danger" href="javascript:delRoute(7)"><i
                                                    class="fa fa-fw fa-remove"></i> 删除</a>
                                        </td>
                                    </tr>--%>
                                    </tbody>

                                </table>
                            </form>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="dataTables_info" id="example2_info" role="status"
                                     aria-live="polite">当前第${pageBean.current}页,共${pageBean.total}页，共${pageBean.count}条
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="dataTables_paginate paging_simple_numbers" id="example2_paginate">
                                    <ul class="pagination" style="margin: 0px">
                                        <li class="paginate_button previous" id="example2_firsts"><a
                                                href="route/findRoutesByPage?current=1&rname=${rname}"
                                                aria-controls="example2"
                                                data-dt-idx="0" tabindex="0">首页</a>
                                        </li>
                                        <li class="paginate_button previous" id="example2_previous"><a
                                                href="route/findRoutesByPage?current=${pageBean.previous}&rname=${rname}"
                                                aria-controls="example2" data-dt-idx="0" tabindex="0">上一页</a>
                                        </li>


                                        <c:forEach begin="${pageBean.begin}" end="${pageBean.end}" var="i">
                                            <li class="paginate_button ${pageBean.current == i ? 'active' : ''} ">
                                                <a href="route/findRoutesByPage?current=${i}&rname=${rname}"
                                                   aria-controls="example2"
                                                   data-dt-idx="${i}" tabindex="0">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <%--<li class="paginate_button active">
                                            <a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0">1</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="2" tabindex="0">2</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="3" tabindex="0">3</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="4" tabindex="0">4</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="5" tabindex="0">5</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="6" tabindex="0">6</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0">7</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="8" tabindex="0">8</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="9" tabindex="0">9</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="example2" data-dt-idx="10" tabindex="0">10</a>
                                        </li>--%>
                                        <li class="paginate_button next" id="example2_next">
                                            <a href="route/findRoutesByPage?current=${pageBean.next}&rname=${rname}"
                                               aria-controls="example2" data-dt-idx="7" tabindex="0">下一页</a>
                                        </li>
                                        <li class="paginate_button next" id="example2_last">
                                            <a href="route/findRoutesByPage?current=${pageBean.total}&rname=${rname}"
                                               aria-controls="example2" data-dt-idx="7" tabindex="0">尾页</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /内容 -->
</div>
<script src="${ctx}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${ctx}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/plugins/adminLTE/js/adminlte.js"></script>
<script src="${ctx}/plugins/common.js"></script>
</body>
</html>