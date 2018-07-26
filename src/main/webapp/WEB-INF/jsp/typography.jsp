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
                        ������
                    </a>
                </li>
                <li class="current"><a href="#"><img src="img/icons/menu/home.png" alt="" /> ����OA</a>
                    <ul>
                        <li><a href="index.action">������</a></li>
                        <c:if test="${user.permission eq 2}"><li><a href="manageannounce.action">�������</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="table.action?p=table">��������</a></li></c:if>
                        <li><a href="tabs.action?p=tabs">�����ƶ�</a></li>
                       	<c:if test="${user.permission ne 0}"><li><a href="gallery.action?p=gallery">�ҵ��ĵ�</a></li></c:if>
                        <li class="current"><a href="typography.action?p=typo">��ѧ�ƻ�����</a></li>
                        <li><a href="calendar.action?p=calendar">�ճ̰���</a></li>
                    </ul>
                </li>
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/books.png" alt="" /> ѧ������</a>
                    <ul>
                        <li><a href="addfile.action">����¼��</a></li>
                        <li><a href="searchfile.action">������ѯ</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                <li><a href="#"><img src="img/icons/menu/chart.png" alt="" /> �ɼ�����</a>
                    <ul>
                    	<c:if test="${user.permission eq 2}"><li><a href="manageexam.action">������Ϣ����</a></li></c:if>
                        <c:if test="${user.permission ne 0}"><li><a href="addscore.action">�ɼ�¼��</a></li></c:if>
                        <li><a href="searchscore.action">�ɼ���ѯ</a></li>
                        <c:if test="${user.permission ne 0}"><li><a href="chart.action">�ɼ�ͳ��</a></li></c:if>
                    </ul>
                </li>
                
                
                
                <c:if test="${user.permission eq 2}">	
                <li><a href="#"><img src="img/icons/menu/inbox.png" alt="" />�춯����</a>
                    <ul>
                        <li><a href="changeclass.action">ѧ������</a></li>
                        <li><a href="changeschool.action">ѧ��תѧ</a></li>
                        <li><a href="reentryschool.action">ѧ����ѧ</a></li>
                        <li><a href="suspendschool.action">ѧ����ѧ</a></li>
                        <li><a href="leaveschool.action">ѧ����ѧ</a></li>
                        <li><a href="searchchange.action">�춯��ѯ</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />��������</a>
                    <ul>
                        <li><a href="settingdepartment.action">��������</a></li>
                        <li><a href="settingpost.action">��λ����</a></li>
                    </ul>
                </li>
                </c:if>
                
                
                <c:if test="${user.permission eq 2}">
                <li><a href="#"><img src="img/icons/menu/settings.png" alt="" />ϵͳȨ�޹���</a>
                    <ul>
                        <li><a href="settingroot.action">Ȩ�޹���</a></li>
                        <li><a href="settinguser.action">�û�����</a></li>
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
        <h1 style="width: 280px;float:left;"><img src="img/icons/posts.png" alt="" /> ��ѧ�ƻ�����</h1>
        <div class="work">
            <div action="#" class="search-work">
                <input type="text" value="" name="q" class="text"/>
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/menu/search.png" alt="" />
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/add.png" alt="" />
            </div>
            <div action="#" class="workbutton">
                <img src="img/icons/trash-shredder.png" alt="" />
            </div>
        </div>
        </div>
    <div class="bloc">
        <div class="title">
            ��ѧ�ƻ�
        </div>
        <div class="content">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" class="checkall"/></th>
                        <th>�γ̺�</th>
                        <th>�γ���</th>
                        <th>�ڿ���ʦ</th>
                        <th>ѧ��</th>
                        <th>�ڿ�ѧ��</th>
                        <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp����</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121001</a></td>
                        <td>���������</td>
                        <td>������</td>
                        <td>2.5</td>
                        <td>��һѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121002</a></td>
                        <td>�ߵ���ѧ</td>
                        <td>�߼���</td>
                        <td>5.5</td>
                        <td>��һѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121003</a></td>
                        <td>���������</td>
                        <td>�����</td>
                        <td>3.5</td>
                        <td>��һѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121004</a></td>
                        <td>������</td>
                        <td>����</td>
                        <td>1</td>
                        <td>��һѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121005</a></td>
                        <td>���Դ���</td>
                        <td>���ΰ</td>
                        <td>2.5</td>
                        <td>��һѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121006</a></td>
                        <td>���������</td>
                        <td>������</td>
                        <td>4</td>
                        <td>�ڶ�ѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121007</a></td>
                        <td>�����ͼ��ѧ</td>
                        <td>������</td>
                        <td>2.5</td>
                        <td>�ڶ�ѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>               
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121008</a></td>
                        <td>JAVA</td>
                        <td>��֮��</td>
                        <td>2.5</td>
                        <td>�ڶ�ѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z121009</a></td>
                        <td>���ݽṹ</td>
                        <td>�Ž���</td>
                        <td>4</td>
                        <td>�ڶ�ѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z1210010</a></td>
                        <td>�㷨</td>
                        <td>����</td>
                        <td>2.5</td>
                        <td>����ѧ��</td>
                        <td class="actions"><a href="#" title="Edit this content"><img src="img/icons/actions/edit.png" alt="" /></a><a href="#" title="Delete this content"><img src="img/icons/actions/delete.png" alt="" /></a></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><a href="#">Z1210011</a></td>
                        <td>web�������</td>
                        <td>��һʯ</td>
                        <td>2.5</td>
                        <td>����ѧ��</td>
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
					<a href="#">��һҳ</a>&nbsp;&nbsp;&nbsp;<a href="#">��һҳ</a>
				</div>
        </div>   
    </div>

    
</body>
</html>