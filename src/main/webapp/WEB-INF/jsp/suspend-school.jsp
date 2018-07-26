<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        <script type="text/javascript" src="js/table.js"></script>
        <script type="text/javascript">
			function reason(){
				var input=document.getElementById("changeDes");
				var value=input.value;
				//获取到你要输出数字的位置
				var get=document.getElementById("labelreason");
				get.innerHTML=value;
			}
	</script>
        
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
                <li class="current"><a href="#"><img src="img/icons/menu/inbox.png" alt="" />异动管理</a>
                    <ul>
                        <li><a href="changeclass.action">学生调班</a></li>
                        <li><a href="changeschool.action">学生转学</a></li>
                        <li><a href="reentryschool.action">学生复学</a></li>
                        <li class="current"><a href="suspendschool.action">学生休学</a></li>
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
            <h1><img src="img/icons/paper.png" alt="" /> 异动管理</h1>        

            <div class="bloc">
                <div class="title">学生休学</div>
                <div class="content">
                    <form action="suspendSchool.action" method="post">
                        <table class="inputfile">
                            <tr>
                                <td class="inputlabel"><label>姓    名：</label></td>
                                <td class="input-input"><input type="text"  name="stuName" /></td>
                                <td class="inputlabel"><label>学    号：</label></td>
                                <td><input type="text" name="stuId" /></td>
                            </tr>
                            <tr>
                                <td class="inputlabel"><label>原 班 级：</label></td>
                                <td><input type="text" name="stuClassid" /></td>
                                <td class="inputlabel"><label>休学原因：</label></td>
                                <td><input type="text" id="changeDes" value="不清楚" disabled="disabled"/></td>
                            </tr>
                            <tr>
                                <td class="inputlabel"><label>异动时间：</label></td>
                                <td><input type="text" name="date" placeholder="  xxxx-xx-xx" /></td>
                                <td class="inputlabel"><label>负 责 人：</label></td>
                                <td><input type="text" value="管理员" disabled="disabled" /></td>
                            </tr>
                        </table>
                   
                    <div class="submit" style="padding-left: 680px;padding-top: 5px;">
                    <span style="color:red">${error}</span>
                        <input type="reset" value="重  置" class="black" style="margin-right: 50px;" />
                        <input type="submit" value="提  交" class="white" onclick="reason()"/>
                    </div>
                </form>
                </div>
            </div>
            <div class="bloc">
        <div class="title">
            休学信息
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkall"/></th>
                        <th>姓名</th>
                        <th>学号</th>
                        <th>原班级</th>
                        <th>休学原因</th>
                        <th>异动时间</th>
                        <th>负责人</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach items="${stopSchoolListAll}" var="stopSchoolListAll">
							<tr>
								<td><input type="checkbox" /></td>
								<td>${stopSchoolListAll.stuName}</td>
								<td>${stopSchoolListAll.stuId}</td>
								<td>${stopSchoolListAll.stuClassid}</td>
								<td>不清楚</label></td>
								<td><fmt:formatDate value="${stopSchoolListAll.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>管理员</td>
								<td class="actions">
								<input name="" type="button" title="Edit this content" class="edittable" />
								<form action="suspendSchoolDelete.action" method="post" class="deletetable">
									<input type="hidden"  name="suspendSchoolDelete" value="${stopSchoolListAll.stuId}" >
									<input type="image" src="img/icons/actions/delete.png"/>
							    </form>
							    </td>
							</tr>
					</c:forEach>
                    
                      
                                    
                </tbody>
            </table>
            <div class="left input">
                <select name="action" id="tableaction">
                    <option value="">Action</option>
                    <option value="delete">Delete</option>
                </select>
            </div>
            <div id="pageDiv" class="pagination">
					<a href="suspendschool.action?pageNo=${page.pageNo-1 }">上一页</a>&nbsp;&nbsp;&nbsp;<a
						href="suspendschool.action?pageNo=${page.pageNo+1}">下一页</a>
				</div>
        </div>   
    </div>
        </div>
    </body>
</html>