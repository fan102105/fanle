<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../base.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>线路修改</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

</head>
<body>
<!-- 内容区域 -->
<div id="frameContent" class="content" style="margin-left:0px;padding-top: 0px;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            线路修改
            <small>itheima route modify</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="active">线路管理</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">请修改线路信息</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- 线路修改表单 -->
                    <form id="updateForm" action="route/updateRoute" method="post" class="form-horizontal">
                        <div class="box-body">
                            <input type="text" name="rid" hidden="hidden" value="${route.rid}">
                            <div class="form-group">
                                <label for="rname" class="col-sm-2 control-label">线路名字 <span
                                        style="color: red;font-weight: bold">*</span></label>

                                <div class="col-sm-10">
                                    <textarea id="rname" name="rname" class="form-control" rows="2"
                                              placeholder="请输入线路名字">${route.rname}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="price" class="col-sm-2 control-label">价格 <span
                                        style="color: red;font-weight: bold">*</span></label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="price" name="price"
                                           value="${route.price}" placeholder="请输入价格">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="routeIntroduce" class="col-sm-2 control-label">介绍 <span
                                        style="color: red;font-weight: bold">*</span></label>

                                <div class="col-sm-10">
                                    <textarea id="routeIntroduce" name="routeIntroduce" class="form-control" rows="2"
                                              placeholder="请输入线路介绍">${route.routeIntroduce}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否上架&nbsp;<span
                                        style="color: red;font-weight: bold">*</span></label>
                                <div class="col-sm-10">

                                    <c:if test="${route.rflag == '1'}">
                                        <label class="control-label">
                                            <input type="radio" name="rflag" value="1" checked="checked">是
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="control-label">
                                            <input type="radio" name="rflag" value="0">否
                                        </label>
                                    </c:if>
                                    <c:if test="${route.rflag == '0'}">
                                        <label class="control-label">
                                            <input type="radio" name="rflag" value="1">是
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <label class="control-label">
                                            <input type="radio" name="rflag" value="0" checked="checked">否
                                        </label>
                                    </c:if>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">图片&nbsp;<span
                                        style="color: red;font-weight: bold">*</span></label>
                                <div class="col-sm-10">
                                    <img id="rimagePreView" data-src="holder.js/299x169" alt="299x169"
                                         style="width: 299px; height: 169px;"
                                         src="${route.rimage}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cid" class="col-sm-2 control-label">线路类别 <span
                                        style="color: red;font-weight: bold">*</span></label>

                                <div class="col-sm-10">
                                    <select class="form-control select2" style="width: 100%;"
                                            tabindex="-1" aria-hidden="true" id="cid" name="cid">
                                        <option value="" selected="selected" disabled="disabled">请选择</option>
                                        <c:forEach items="${categories}" var="category">
                                            <option value="${category.cid}" selected=${route.cid == category.cid ? "selected" : ""}>${category.cname}</option>
                                        </c:forEach>
                                        <%--<option value="1" selected=${route.cid == 1 ? "selected" : ""}>车票</option>
                                        <option value="2" selected=${route.cid == 2 ? "selected" : ""}>国内游</option>--%>
                                    </select>
                                    <span class="select2 select2-container select2-container--default select2-container--below select2-container--focus"
                                          dir="ltr" style="width: 100%;">
                                  <span class="dropdown-wrapper" aria-hidden="true"></span>
                                </span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sid" class="col-sm-2 control-label">所属商家 <span
                                        style="color: red;font-weight: bold">*</span></label>

                                <div class="col-sm-10">
                                    <select class="form-control select2" style="width: 100%;"
                                            tabindex="-1" aria-hidden="true" id="sid" name="sid">
                                        <option value="" selected="selected" disabled="disabled">请选择</option>
                                        <c:forEach items="${sellers}" var="seller">
                                            <option value="${seller.sid}" selected=${route.sid == seller.sid ? "selected" : ""}>${seller.sname}</option>
                                        </c:forEach>
                                        <%--<option value="1">车票</option>
                                        <option value="2">国内游</option>--%>
                                    </select>
                                    <span class="select2 select2-container select2-container--default select2-container--below select2-container--focus"
                                          dir="ltr" style="width: 100%;">
                                  <span class="dropdown-wrapper" aria-hidden="true"></span>
                                </span>
                                </div>
                            </div>


                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="button" onclick="history.back();" class="btn btn-default">撤销返回</button>
                            <button type="submit" class="btn btn-info pull-right">线路修改</button>
                        </div>
                        <!-- /.box-footer -->
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /内容区域结束 -->
</body>
</html>