<!DOCTYPE html>
<html>
<head>
<#include "/templates/layout/meta.ftl">
<link href="/static/css/plugins/switchery/switchery.css" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <#include "/templates/layout/left.ftl">
    <div id="page-wrapper" class="gray-bg">
        <#include "/templates/layout/head.ftl">
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-9">
                <h2>学生名单</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="/main">首页</a>
                    </li>
                    <li class="active">
                        <strong>列表</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox ">
                        <div class="ibox-content">
                            <div class="bar search-bar">
                                <div class="form-inline">
                                    <input id="teacherName" type="text" class="form-control" placeholder="请输入姓名...">
                                    <select id="deleted" class="form-control" style="width: 100px;">
                                        <option value="0" selected>未删除</option>
                                        <option value="1">已删除</option>
                                    </select>
                                    <button class="btn btn-primary"onclick="StudentList.search();">搜索</button>
                                    <button class="btn btn-primary"onclick="StudentList.reset();">重置</button>
                                    <button class="btn btn-primary"onclick="StudentList.add();">增加</button>
                                    <button class="btn btn-success"onclick="StudentList.importExcel();">批量导入</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ibox">
                        <table id="grid-table"></table>
                        <div id="grid-pager"></div>
                    </div>
                </div>
            </div>
        </div>
        <#include "/templates/layout/foot.ftl">
    </div>
</div>
<#--新增弹框-->
<div class="modal fade" id="createModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalTitle">新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="create-form">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">权限</label>
                        <div class="col-sm-9">
                            <input type="checkbox" id="switch"  name="hiden" class="js-switch"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" onclick="StudentList.insert();">确定</button>
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<#--修改弹框-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalTitle">修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update-form">
                    <input type="hidden" name="id"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name">
                        </div>
                    </div>
                    <#--<div class="form-group">
                        <label class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="password">
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">权限</label>
                        <div class="col-sm-9">
                            <input type="checkbox" id="switch"  name="hiden" class="js-switch"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" onclick="StudentList.update();">确定</button>
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<#--导入弹框-->
<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalTitle">批量导入</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal" id="import-form">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">模板</label>
                        <div class="col-sm-6">
                            <button type="button" class="btn btn-primary" onclick="StudentList.downloadTemplate();">下载模板</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">文件</label>
                        <div class="col-sm-9">
                            <input id="fileinput" type="file">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">权限</label>
                        <div class="col-sm-9">
                            <input type="checkbox" id="switch" class="js-switch"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" onclick="StudentList.import();">确定</button>
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<#include "/templates/layout/commonjs.ftl">
<script src="/static/js/plugins/switchery/switchery.js"></script>
<script src="/static/modular/studentList/list.js"></script>
</body>
</html>
