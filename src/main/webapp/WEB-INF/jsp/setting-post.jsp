<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Your Admin Panel</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    
    <!-- jQuery AND jQueryUI -->
    <script type="text/javascript" src="js/libs/jquery/1.6/jquery.min.js"></script>
    <script type="text/javascript" src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
    
    <!-- Compressed Version
    <link type="text/css" rel="stylesheet" href="min/b=CoreAdmin&f=css/reset.css,css/style.css,css/jqueryui/jqueryui.css,js/jwysiwyg/jquery.wysiwyg.old-school.css,js/zoombox/zoombox.css" />
    <script type="text/javascript" src="min/b=CoreAdmin/js&f=cookie/jquery.cookie.js,jwysiwyg/jquery.wysiwyg.js,tooltipsy.min.js,iphone-style-checkboxes.js,excanvas.js,zoombox/zoombox.js,visualize.jQuery.js,jquery.uniform.min.js,main.js"></script>
    -->
    <link rel="stylesheet" href="css/min.css" />
    <script type="text/javascript" src="js/min.js"></script>
        
</head>
<body>
        
    <script type="text/javascript" src="content/settings/main.js"></script>
    <link rel="stylesheet" href="content/settings/style.css" />


    <div class="settings" id="settings">
    <div class="wrapper">
        <div class="grid3">
            <div class="titre">Backgrounds</div>
            <a href="url(css/img/bg.html" class="backgroundChanger active" title="White"></a>
            <a href="url(css/img/dark-bg.html" class="backgroundChanger dark" title="Dark"></a>
            <a href="url(css/img/wood.html" class="backgroundChanger dark" title="Wood"></a>
            <a href="url(css/img/altbg/smoothwall.html" class="backgroundChanger" title="Smoothwall"></a>
            <a href="url(css/img/altbg/black_denim.html" class="backgroundChanger dark" title="black_denim"></a>
            <a href="url(css/img/altbg/carbon.html" class="backgroundChanger dark" title="Carbon"></a>
            <a href="url(css/img/altbg/double_lined.html" class="backgroundChanger" title="Double lined"></a>
            <div class="clear"></div>
        </div>
        <div class="grid3">
            <div class="titre">Bloc style</div>
            <a href="black.html" class="blocChanger" title="Black" style="background:url(css/img/bloctitle.png);"></a>
            <a href="white.html" class="blocChanger active" title="White" style="background:url(css/img/white-title.png);"></a>
            <a href="wood.html" class="blocChanger" title="Wood" style="background:url(css/img/wood-title.jpg);"></a>
            <div class="clear"></div>
        </div>
        <div class="grid3">
            <div class="titre">Sidebar style</div>
            <a href="grey.html" class="sidebarChanger active" title="Grey" style="background:#494949"></a>
            <a href="black.html" class="sidebarChanger" title="Black" style="background:#262626"></a>
            <a href="white.html" class="sidebarChanger" title="White" style="background:#EEEEEE"></a>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
    <a class="settingbutton" href="#">

    </a>
    </div>        
    <!--              
            HEAD
                    --> 
    <div id="head">
        <div class="left">
            <a href="#" class="button profile"><img src="img/icons/top/huser.png" alt="" /></a>
            Hi, 
            <a href="persionsetting.action">${user.username}</a>
                |
                <a href="logout.action">Logout</a>
        </div>
        <div class="right">
            <form action="#" id="search" class="search placeholder">
                <label>Looking for something ?</label>
                <input type="text" value="" name="q" class="text"/>
                <input type="submit" value="rechercher" class="submit"/>
            </form>
        </div>
    </div>
            
            
    <!--            
            SIDEBAR
                     --> 
    <div id="sidebar">
            <ul>
                <li>
                    <a href="index.action">
                        <img src="img/icons/menu/clipboard.png" alt="" />
                        公告栏
                    </a>
                </li>
                <li><a href="#"><img src="img/icons/menu/home.png" alt="" /> 教育OA</a>
                    <ul>
                        <li><a href="index.action">公告栏</a></li>
                        <c:if test="${user.permission eq 2}"><li><a href="manageannounce.action">公告管理</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="table.action?p=table">工作交办</a></li></c:if>
                        <li><a href="tabs.action?p=tabs">规章制度</a></li>
                       	<c:if test="${user.permission ne 0}"><li><a href="gallery.action?p=gallery">我的文档</a></li></c:if>
                        <li><a href="typography.action?p=typo">教学计划安排</a></li>
                        <li><a href="calendar.action?p=calendar">日程安排</a></li>
                    </ul>
                </li>
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/books.png" alt="" /> 学生档案</a>
                    <ul>
                        <li><a href="addfile.action">档案录入</a></li>
                        <li><a href="searchfile.action">档案查询</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                <li><a href="#"><img src="img/icons/menu/chart.png" alt="" /> 成绩管理</a>
                    <ul>
                    	<c:if test="${user.permission eq 2}"><li><a href="manageexam.action">考试信息设置</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="addscore.action">成绩录入</a></li></c:if>
                        <li><a href="searchscore.action">成绩查询</a></li>
                        <c:if test="${user.permission ne 0}"><li><a href="chart.action">成绩统计</a></li></c:if>
                    </ul>
                </li>
                
                
                
                <c:if test="${user.permission eq 2}">	
                <li><a href="#"><img src="img/icons/menu/inbox.png" alt="" />异动管理</a>
                    <ul>
                        <li><a href="changeclass.action">学生调班</a></li>
                        <li><a href="changeschool.action">学生转学</a></li>
                        <li><a href="reentryschool.action">学生复学</a></li>
                        <li><a href="suspendschool.action">学生休学</a></li>
                        <li><a href="leaveschool.action">学生退学</a></li>
                        <li><a href="searchchange.action">异动查询</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                
                <c:if test="${user.permission eq 2}">
                <li class="current"><a href="#"><img src="img/icons/menu/settings.png" alt="" />部门设置</a>
                    <ul>
                        <li><a href="settingdepartment.action">部门设置</a></li>
                        <li class="current"><a href="settingpost.action">岗位设置</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />系统权限管理</a>
                    <ul>
                        <li><a href="settingroot.action">权限管理</a></li>
                        <li><a href="settinguser.action">用户管理</a></li>
                    </ul>
                </li>
                </c:if>
            </ul>


        </div>
            
            
            
            
    <!--            
          CONTENT 
                    --> 
    <div id="content" class="white">
        <div style="width: 1000px height: 67px;">
        <h1 style="width: 200px;float:left;"><img src="img/icons/posts.png" alt="" /> 岗位设置</h1>
        <div class="work">
            <div action="#" class="search-work">
                <input type="text" value="" name="q" class="text"/>
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/menu/search.png" alt="" />
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/trash-shredder.png" alt="" />
            </div>
        </div>
        </div>
        <div class="bloc">
    <div class="title">批量岗位管理</div>
    <div class="content">
        <div class="input">
            <label for="file">选择导入文件</label>
            <input type="file" id="file" />
        </div>
        <div class="submit">
            <input type="submit" value="导入并覆盖" />
            <input type="reset" value="导入并保留" class="black"/>
            <input type="reset" value="导入并删除" class="white"/>
        </div>
    </div>
</div>        

<div class="bloc">
    <div class="title">新增岗位</div>
    <div class="content">
        <form enctype="multipart/form-data" action="ashx/login.ashx" method="post">
            <table class="inputfile">
                <tr>
                    <td class="inputlabel"><label>岗位名称：</label></td>
                    <td class="input-input"><input type="text" /></td>
                    <td class="inputlabel"><label>隶属部门：</label></td>
                    <td>
                        <select>
                        <option value="1">信工学院</option>
                        <option value="2">校团委</option>
                        <option value="3">工程学院</option>
                        <option value="3">资源学院</option>
                        <option value="3">珠宝学院</option>
                        <option value="3">地质学院</option>
                        <option value="3">环境学院</option>
                        <option value="3">体育学院</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>负 责 人：</label></td>
                    <td><input type="text" /></td>
                    <td class="inputlabel"><label>成立时间：</label></td>
                    <td><input type="text" /></td>
                </tr>
                <tr>
                    <td class="inputlabel"><label>人    员：</label></td>
                    <td><input type="text" /></td>
                    <td class="inputlabel"><label>岗位编号：</label></td>
                    <td><input type="text" /></td>
                </tr>
            </table>
        </form>
        <div class="submit" style="padding-left: 680px;padding-top: 5px;">
            <input type="reset" value="重  置" class="black" style="margin-right: 50px;" />
            <input type="reset" value="提  交" class="white"/>
        </div>      
    </div>
    </div>
    <div class="bloc">
        <div class="title">
            学生档案
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkall"/></th>
                        <th>岗位名称</th>
                        <th>岗位编号</th>
                        <th>隶属部门</th>
                        <th>负责人</th>
                        <th>人员</th>
                        <th>成立时间</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>             
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">财务</a></td>
                        <td>007</td>
                        <td>信息工程学院</td>
                        <td>李茜</td>
                        <td>王梦 彭琪</td>
                        <td>2016.05.03</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                                    
                </tbody>
            </table>
            <div class="left input">
                <!--全局删除按钮！！！！！！！！-->

            </div>
            <div id="pageDiv" class="pagination">
					<a href="#">上一页</a>&nbsp;&nbsp;&nbsp;<a href="#">下一页</a>
				</div>
        </div>   
    </div>
    </div>
    </div>
</body>
</html>