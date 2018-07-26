<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page isELIgnored="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Your</title>
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
                        <li><a href="index.action?p=index">公告栏</a></li>
                        <li><a href="manageannounce.action">公告管理</a></li>
                        <li><a href="table.action?p=table">工作交办</a></li>
                        <li><a href="tabs.action?p=tabs">规章制度</a></li>
                        <li><a href="gallery.action?p=gallery">我的文档</a></li>
                        <li><a href="typography.action?p=typo">教学计划安排</a></li>
                        <li><a href="calendar.action?p=calendar">日程安排</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="img/icons/menu/books.png" alt="" /> 学生档案</a>
                    <ul>
                        <li><a href="addfile.action">档案录入</a></li>
                        <li><a href="searchfile.action">档案查询</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="img/icons/menu/chart.png" alt="" /> 成绩管理</a>
                    <ul>
                        <li><a href="manageexam.action">考试信息设置</a></li>
                        <li><a href="addscore.action">成绩录入</a></li>
                        <li><a href="searchscore.action">成绩查询</a></li>
                        <li><a href="chart.action">成绩统计</a></li>
                    </ul>
                </li>
                <li class="current"><a href="#"><img src="img/icons/menu/inbox.png" alt="" />异动管理</a>
                    <ul>
                        <li><a href="changeclass.action">学生调班</a></li>
                        <li><a href="changeschool.action">学生转学</a></li>
                        <li><a href="reentryschool.action">学生复学</a></li>
                        <li><a href="suspendschool.action">学生休学</a></li>
                        <li><a href="leaveschool.action">学生退学</a></li>
                        <li class="current"><a href="searchchange.action">异动查询</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />部门设置</a>
                    <ul>
                        <li><a href="settingdepartment.action">部门设置</a></li>
                        <li><a href="settingpost.action">岗位设置</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />系统权限管理</a>
                    <ul>
                        <li><a href="settingroot.action">权限管理</a></li>
                        <li><a href="settinguser.action">用户管理</a></li>
                    </ul>
                </li>
            </ul>


        </div>
            
            
            
            
    <!--            
          CONTENT 
                    --> 
    <div id="content" class="white">
        <div style="width: 1000px height: 67px;">
        <h1 style="width: 200px;float:left;"><img src="img/icons/posts.png" alt="" /> 异动查询</h1>
        <div class="work">
        
            <form action="searchChange.action">
	            <div action="#" class="search-work">
	                <input type="text" value="" name="stuId" class="text"/>
	            </div>
	            <div action="#" class="workbutton">
	                <input type="submit" value="搜索">
	            </div>
	        </form>
	        
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
                        <th>姓名</th>
                        <th>学号</th>
                        <th>原班级</th>
                        <th>异动状态</th>
                        <th>异动时间</th>
                        <th>负责人</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">李茜</a></td>
                        <td>20131002264</td>
                        <td>111132</td>
                        <td>调班</td>
                        <td>000000</td>
						<td>管理员</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                   
                   <c:forEach items="${changeList}" var="item">
						<tr>
						    <td><input type="checkbox" /></td>
							<td>${item.stuName}</td>
							<td>${item.stuId}</td>
							<td>${item.stuClassid}</td>
							<td>${item.changeStatus}</td>
							<td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>管理员</td>
							<td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
            <div class="left input">
                <!--全局删除按钮！！！！！！！！-->

            </div>
            <div class="pagination">
                <a href="#" class="prev">«</a>
                <a href="#">1</a>
                <a href="#" class="current">2</a>
                ...
                <a href="#">21</a>
                <a href="#">22</a>
                <a href="#" class="next">»</a>
            </div>
        </div>   
    </div>
    </div>
    </div>
    
    ${msg }
</body>
</html>