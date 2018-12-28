<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" src="/static/img/a1.jpg" width="80px;"/>
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">管理员<b class="caret"></b></strong>
                             </span></span> </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="mailbox.html">修改</a></li>
                        <li class="divider"></li>
                        <li><a href="login.ftl">退出</a></li>
                    </ul>
                </div>
                <div class="logo-element">
                    <#--<small>学生管理</small>-->
                        <i class="fa fa-paper-plane" aria-hidden="true" style="font-size: 35px;"></i>
                </div>
            </li>
            <li class="active">
                <a><i class="fa fa-th-large"></i> <span class="nav-label">教师管理</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="/teacher_nameList/list">教师名单</a></li>
                    <#--<li class="active"><a href="dashboard_2.html">操作2</a></li>
                    <li><a href="dashboard_3.html">操作3</a></li>
                    <li><a href="dashboard_4_1.html">操作4</a></li>
                    <li><a href="dashboard_5.html">操作5 </a></li>-->
                </ul>
            </li>
            <li>
                <a><i class="fa fa-sun-o"></i> <span class="nav-label">系统设置</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="/menu/list">菜单设置</a></li>
                </ul>
            </li>
        </ul>

    </div>
</nav>