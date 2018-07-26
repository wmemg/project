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
                <li class="current"><a href="#"><img src="img/icons/menu/home.png" alt="" /> 教育OA</a>
                    <ul>
                        <li><a href="index.action">公告栏</a></li>
                        <c:if test="${user.permission eq 2}"><li><a href="manageannounce.action">公告管理</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li class="current"><a href="table.action?p=table">工作交办</a></li></c:if>
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
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />部门设置</a>
                    <ul>
                        <li><a href="settingdepartment.action">部门设置</a></li>
                        <li><a href="settingpost.action">岗位设置</a></li>
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
        <h1 style="width: 200px;float:left;"><img src="img/icons/posts.png" alt="" /> 工作交办</h1>
        <div class="work">
            <div action="#" class="search-work">
                <input type="text" value="" name="q" class="text"/>
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/menu/search.png" alt="" />
            </div>
            <div action="#" class="workbutton">
                <a href="addwork.action"><img src="img/icons/add.png" alt="" /></a>
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/trash-shredder.png" alt="" />
            </div>
        </div>
        </div>
    <div class="bloc">
        <div class="title">
            进行中任务
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkall"/></th>
                        <th>文号/说明</th>
                        <th>步骤</th>
                        <th>起始时间</th>
                        <th>负责人</th>
                        <th>状态</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016001</a></td>
                        <td>第二步</td>
                        <td>2016.05.17</td>
                        <td>李茜, 王梦, 彭琪</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016004</a></td>
                        <td>第三步</td>
                        <td>2016.05.04</td>
                        <td>朱绿萍 , 王静涓</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016006</td>
                        <td>第二步</td>
                        <td>2016.04.28</td>
                        <td>吴高鹏，徐斌</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016009</a></td>
                        <td>第四步</td>
                        <td>2016.04.22</td>
                        <td>袁益娇</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016011</td>
                        <td>第三步</td>
                        <td>2016.04.18</td>
                        <td>翁钰靓</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016014</a></td>
                        <td>第四步</td>
                        <td>2016.04.11</td>
                        <td>计晨静，金涛</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016015</a></td>
                        <td>第五步</td>
                        <td>2016.04.05</td>
                        <td>褚静静</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016022</a></td>
                        <td>第四步</td>
                        <td>2016.04.01</td>
                        <td>徐王娟，邱盈婷, 马晓瑞</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>               
                                    
                </tbody>
            </table>
            <div class="left input">
                <select name="action" id="tableaction">
                    <option value="">Action</option>
                    <option value="delete">Delete</option>
                </select>
            </div>
                <div id="pageDiv" class="pagination">
					<a href="#">上一页</a>&nbsp;&nbsp;&nbsp;<a href="#">下一页</a>
				</div>
        </div>   
    </div>

    <div class="bloc">
        <div class="title">
            已完成任务
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkall"/></th>
                        <th>文号/说明</th>
                        <th>步骤</th>
                        <th>起始时间</th>
                        <th>负责人</th>
                        <th>状态</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016001</a></td>
                        <td>第二步</td>
                        <td>2016.05.17</td>
                        <td>李茜, 王梦, 彭琪</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016004</a></td>
                        <td>第三步</td>
                        <td>2016.05.04</td>
                        <td>朱绿萍 , 王静涓</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016006</td>
                        <td>第二步</td>
                        <td>2016.04.28</td>
                        <td>吴高鹏，徐斌</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016009</a></td>
                        <td>第四步</td>
                        <td>2016.04.22</td>
                        <td>袁益娇</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016011</td>
                        <td>第三步</td>
                        <td>2016.04.18</td>
                        <td>翁钰靓</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016014</a></td>
                        <td>第四步</td>
                        <td>2016.04.11</td>
                        <td>计晨静，金涛</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016015</a></td>
                        <td>第五步</td>
                        <td>2016.04.05</td>
                        <td>褚静静</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">2016022</a></td>
                        <td>第四步</td>
                        <td>2016.04.01</td>
                        <td>徐王娟，邱盈婷, 马晓瑞</td>
                        <td>进行中</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>               
                                    
                </tbody>
            </table>
            <div class="left input">
                <select name="action" id="tableaction">
                    <option value="">Action</option>
                    <option value="delete">Delete</option>
                </select>
            </div>
           </div>
               <div id="pageDiv" class="pagination">
					<a href="#">上一页</a>&nbsp;&nbsp;&nbsp;<a href="#">下一页</a>
			</div>
        </div>   
    </div>
    </div>
</body>
</html>