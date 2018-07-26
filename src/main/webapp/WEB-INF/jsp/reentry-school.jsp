<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Your Admin Panel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<!-- jQuery AND jQueryUI -->
<script type="text/javascript" src="js/libs/jquery/1.6/jquery.min.js"></script>
<script type="text/javascript"
	src="js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/table.js"></script>

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
				<a href="url(css/img/bg.action" class="backgroundChanger active"
					title="White"></a> <a href="url(css/img/dark-bg.action"
					class="backgroundChanger dark" title="Dark"></a> <a
					href="url(css/img/wood.action" class="backgroundChanger dark"
					title="Wood"></a> <a href="url(css/img/altbg/smoothwall.action"
					class="backgroundChanger" title="Smoothwall"></a> <a
					href="url(css/img/altbg/black_denim.action"
					class="backgroundChanger dark" title="black_denim"></a> <a
					href="url(css/img/altbg/carbon.action"
					class="backgroundChanger dark" title="Carbon"></a> <a
					href="url(css/img/altbg/double_lined.action"
					class="backgroundChanger" title="Double lined"></a>
				<div class="clear"></div>
			</div>
			<div class="grid3">
				<div class="titre">Bloc style</div>
				<a href="black.action" class="blocChanger" title="Black"
					style="background: url(css/img/bloctitle.png);"></a> <a
					href="white.action" class="blocChanger active" title="White"
					style="background: url(css/img/white-title.png);"></a> <a
					href="wood.action" class="blocChanger" title="Wood"
					style="background: url(css/img/wood-title.jpg);"></a>
				<div class="clear"></div>
			</div>
			<div class="grid3">
				<div class="titre">Sidebar style</div>
				<a href="grey.action" class="sidebarChanger active" title="Grey"
					style="background: #494949"></a> <a href="black.action"
					class="sidebarChanger" title="Black" style="background: #262626"></a>
				<a href="white.action" class="sidebarChanger" title="White"
					style="background: #EEEEEE"></a>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
		<a class="settingbutton" href="#"> </a>
	</div>
	<!--              
                HEAD
                        -->
	<div id="head">
		<div class="left">
			<a href="#" class="button profile"><img
				src="img/icons/top/huser.png" alt="" /></a> Hi, <a href="persionsetting.action">${user.username}</a>
                |
                <a href="logout.action">Logout</a>
		</div>
		<div class="right">
			<form action="#" id="search" class="search placeholder">
				<label>Looking for something ?</label> <input type="text" value=""
					name="q" class="text" /> <input type="submit" value="rechercher"
					class="submit" />
			</form>
		</div>
	</div>


	<!--            
                SIDEBAR
                         -->
	<div id="sidebar">
		<ul>
			<li><a href="index.action"> <img
					src="img/icons/menu/clipboard.png" alt="" /> ������
			</a></li>
			<li><a href="#"><img src="img/icons/menu/home.png" alt="" />
					����OA</a>
				<ul>
					<li><a href="index.action">������</a></li>
					<c:if test="${user.permission eq 2}">
						<li><a href="manageannounce.action">�������</a></li>
					</c:if>
					<c:if test="${user.permission ne 0}">
						<li><a href="table.action?p=table">��������</a></li>
					</c:if>
					<li><a href="tabs.action?p=tabs">�����ƶ�</a></li>
					<c:if test="${user.permission ne 0}">
						<li><a href="gallery.action?p=gallery">�ҵ��ĵ�</a></li>
					</c:if>
					<li><a href="typography.action?p=typo">��ѧ�ƻ�����</a></li>
					<li><a href="calendar.action?p=calendar">�ճ̰���</a></li>
				</ul></li>

			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/books.png" alt="" />
						ѧ������</a>
					<ul>
						<li><a href="addfile.action">����¼��</a></li>
						<li><a href="searchfile.action">������ѯ</a></li>
					</ul></li>
			</c:if>



			<li><a href="#"><img src="img/icons/menu/chart.png" alt="" />
					�ɼ�����</a>
				<ul>
					<c:if test="${user.permission eq 2}">
						<li><a href="manageexam.action">������Ϣ����</a></li>
					</c:if>
					<c:if test="${user.permission ne 0}">
						<li><a href="addscore.action">�ɼ�¼��</a></li>
					</c:if>
					<li><a href="searchscore.action">�ɼ���ѯ</a></li>
					<c:if test="${user.permission ne 0}">
						<li><a href="chart.action">�ɼ�ͳ��</a></li>
					</c:if>
				</ul></li>



			<c:if test="${user.permission eq 2}">
				<li class="current"><a href="#"><img
						src="img/icons/menu/inbox.png" alt="" />�춯����</a>
					<ul>
						<li><a href="changeclass.action">ѧ������</a></li>
						<li><a href="changeschool.action">ѧ��תѧ</a></li>
						<li class="current"><a href="reentryschool.action">ѧ����ѧ</a></li>
						<li><a href="suspendschool.action">ѧ����ѧ</a></li>
						<li><a href="leaveschool.action">ѧ����ѧ</a></li>
						<li><a href="searchchange.action">�춯��ѯ</a></li>
					</ul></li>
			</c:if>




			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/settings.png"
						alt="" />��������</a>
					<ul>
						<li><a href="settingdepartment.action">��������</a></li>
						<li><a href="settingpost.action">��λ����</a></li>
					</ul></li>
			</c:if>


			<c:if test="${user.permission eq 2}">
				<li><a href="#"><img src="img/icons/menu/settings.png"
						alt="" />ϵͳȨ�޹���</a>
					<ul>
						<li><a href="settingroot.action">Ȩ�޹���</a></li>
						<li><a href="settinguser.action">�û�����</a></li>
					</ul></li>
			</c:if>
		</ul>


	</div>




	<!--            
              CONTENT 
                        -->
	<div id="content" class="white">
		<h1>
			<img src="img/icons/paper.png" alt="" /> �춯����
		</h1>

		<div class="bloc">
			<div class="title">ѧ����ѧ</div>
			<div class="content">
				<form action="reEntrySchool.action" method="post">
					<table class="inputfile">
						<tr>
							<td class="inputlabel"><label>�� ����</label></td>
							<td class="input-input"><input type="text" name="stuName" /></td>
							<td class="inputlabel"><label>ѧ �ţ�</label></td>
							<td><input type="text" name="stuId" /></td>
						</tr>
						<tr>
							<td class="inputlabel"><label>ԭ �� ����</label></td>
							<td><input type="text" name="stuClassid" /></td>
							<td class="inputlabel"><label>�����༶��</label></td>
							<td><input type="text" name="changeDes" /></td>
						</tr>
						<tr>
							<td class="inputlabel"><label>�춯ʱ�䣺</label></td>
							<td><input type="text" name="date" placeholder="  xxxx-xx-xx" /></td>
							<td class="inputlabel"><label>�� �� �ˣ�</label></td>
							<td><input type="text" value="����Ա" disabled="disabled" /></td>
						</tr>
					</table>
					<div class="submit" style="padding-left: 680px; padding-top: 5px;">
					<span style="color:red">${error}</span>
						<input type="reset" value="��  ��" class="black"
							style="margin-right: 50px;" /> <input type="submit" value="��  ��"
								class="white" />
					</div>
				</form>
			</div>
		</div>
		<div class="bloc">
		
		
		
			<div class="title">��ѧ��Ϣ
			
			
			</div>
			<div class="content">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" class="checkall" /></th>
							<th>����</th>
							<th>ѧ��</th>
							<th>ԭ�༶</th>
							<th>�����༶</th>
							<th>�춯ʱ��</th>
							<th>������</th>
							<th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reEntrySchoolListAll}"
							var="reEntrySchoolListAll">
							<tr>
								<td><input type="checkbox" /></td>
								<td>${reEntrySchoolListAll.stuName}</td>
								<td>${reEntrySchoolListAll.stuId}</td>
								<td>${reEntrySchoolListAll.stuClassid}</td>
								<td>${reEntrySchoolListAll.changeDes}</td>
								<td><fmt:formatDate value="${reEntrySchoolListAll.date}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>����Ա</td>
								<td class="actions">
									<input name="" type="button" title="Edit this content" class="edittable" />
									<form action="reEntryschoolDelete.action" method="post" class="deletetable">
									    <input type="hidden"  name="reEntryschoolDelete" value="${reEntrySchoolListAll.stuId}" >
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
					<a href="reentryschool.action?pageNo=${page.pageNo-1 }">��һҳ</a>&nbsp;&nbsp;&nbsp;<a
						href="reentryschool.action?pageNo=${page.pageNo+1}">��һҳ</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>