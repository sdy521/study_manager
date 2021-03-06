<nav class="navbar-default navbar-static-side" role="navigation">
    <input type="hidden" id="websocketUserId" value="${websocketUserId}">
    <input type="hidden" id="websocketUrl" value="${websocketUrl}">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span>
                        <a href="javascript:;" onclick="upImage();">
                            <#if userImg??>
                                <img alt="image" class="img-circle" src="/imgPath/${userImg}" width="80px;"/>
                                <#else >
                                <img alt="image" class="img-circle" src="/static/img/5.jpg" width="80px;"/>
                            </#if>
                        </a>
                     </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">${leftname}<b class="caret"></b></strong>
                             </span></span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="javascripty:;" onclick="leftModel();"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout"><i class="fa fa-sign-out"></i>&nbsp;退出</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    <#--<small>学生管理</small>-->
                        <i class="fa fa-paper-plane" aria-hidden="true" style="font-size: 35px;"></i>
                </div>
            </li>
            <#list menus as menu>
                <#assign children = menu.children />
                <#if children??&&(children?size>0)>
                    <li class="${menu.active?string('active','')}">
                        <a><i class="${menu.icon!"fa fa-th-large"}"></i> <span class="nav-label">${menu.name}</span> <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse ${menu.active?string('in', '')}">
                            <#list children as child>
                                <li class="${child.active?string('active','')}"><a href="${child.url}"><i class="${child.icon}"></i>${child.name}</a></li>
                            </#list>
                        </ul>
                    </li>
                <#else >
                    <li class="${menu.active?string('active', '')}">
                        <a href="${menu.url}"><i class="${menu.icon!"fa fa-th-large"}"></i> <span class="nav-label">${menu.name}</span></a>
                    </li>
                </#if>
            </#list>
        </ul>

    </div>
</nav>
<#--修改弹框-->
<div class="modal fade" id="leftModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalTitle">修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="left-form">
                    <#--<input type="hidden" name="userid" value="${userid}"/>-->
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-primary" onclick="update();">确定</button>
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<#--上传图片-->
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modalTitle">上传头像</h4>
            </div>
            <div class="modal-body">
               <form enctype="multipart/form-data">
                   <div class="file-loading">
                       <input id="uploadfile" type="file" multiple>
                   </div>
               </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" onclick="destroyDropZone();">关闭</button>
            </div>
        </div>
    </div>
</div>