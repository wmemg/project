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
                        <c:if test="${user.permission ne 0}"><li><a href="table.action?p=table">工作交办</a></li></c:if>
                        <li class="current"><a href="tabs.action?p=tabs">规章制度</a></li>
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
            
            <h1><img src="img/icons/bookmarks.png" alt="" />&nbsp&nbsp规章制度</h1>

            <div class="bloc left">
                <div class="title">
                    Text
                    <div class="tabs" id="tabs1">
                        <a href="#tab11">总则</a>
                        <a href="#tab12">治理结构</a>
                        <a href="#tab13">学生</a>
                        <a href="#tab14">教职工</a>
                    </div>
                </div>
                <div class="content">
                    <div id="tab11">
                        <p>第一条　为保障学校依法自主办学，建设现代大学制度，依据《中华人民共和国教育法》《中华人民共和国高等教育法》等法律法规，立足学校实际，结合改革发展需要，制定本章程。</p>
                        <p>第二条　学校中文名称为：中国地质大学（武汉），简称：地大，英文名称为：China　University　of　Geosciences；缩写：CUG。学校网址为:http://www.cug.edu.cn/new/index.html</p>
                        <p>第三条　学校法定住所地为：湖北省武汉市洪山区鲁磨路388号。学校根据事业发展需要，经举办者或主管部门同意，可新建或者调整校区。</p>
                        <p>第四条　学校是国家举办、国务院教育行政部门主管的具有独立法人资格的非营利性事业单位，由国务院教育行政部门与国土资源部门、湖北省人民政府依据合作协议共同建设。</p>
                        <p>第五条　举办者和主管部门对学校进行宏观指导、依法监督，为学校提供办学经费，保障学校办学的基本条件，任免学校负责人，支持学校依照法律法规和学校章程自主办学，保护学校的合法权益；确定学校的分立、合并与终止。</p>
                        <p>第六条　学校坚持社会主义办学方向，全面贯彻国家教育方针，以立德树人作为办学的根本任务，以人才培养、学术研究、社会服务、文化传承与创新为基本职能，根据法律法规及本章程的规定制定学校事业发展战略、专项发展规划和规章制度，自主管理，推动学校各项事业协调发展，主动接受社会监督和评价。</p>
                        <p>第七条　学校围绕学科前沿和经济社会发展的需求，不断优化资源配置，努力构建以地球科学为主导，多学科相互支撑、协调发展的学科生态系统。</p>
                        <p>第八条　学校以实施普通高等教育为主，稳步发展继续教育，积极拓展中外合作办学，努力培养“品德高尚、基础厚实、专业精深、知行合一”的高素质人才。</p>
                        <p>第九条　学校的校训是“艰苦朴素，求真务实”。</p>
                    </div>
                    <div id="tab12">
                        <p>第一节　领导体制</p>
						<p>第十条　学校依法实行中国共产党中国地质大学（武汉）委员会（以下简称学校党委）领导下的校长负责制。</p>
						<p>第十一条　学校党委是事业发展的领导核心，统一领导学校工作，支持校长依法独立行使职权并开展工作。</p>
						<p>第十二条　学校党委由党员代表大会选举产生，党委常委由党委全委会选举产生，每届任期5年。</p>
						<p>第十三条　学校党委依法履行下列职责：</p>
						<p>（一）宣传和执行党的路线方针政策，以及上级组织和本级组织的决议，依靠全校师生员工推进学校科学发展，培养德智体美全面发展的社会主义事业建设者和接班人；</p>
						<p>（二）审议确定学校基本管理制度，讨论决定学校改革发展稳定以及教学、科研和行政管理中的重大事项；</p>
						<p>（三）讨论决定学校中层组织机构设置及其负责人人选，按照干部管理权限，负责干部的选拔、教育、培养、考核和监督，负责领导班子建设、干部队伍建设和人才队伍建设；</p>
						<p>（四）领导学校的思想政治工作和德育工作，促进和谐校园建设；</p>
						<p>（五）领导学校的工会、共青团、学生会等群众组织和教职工代表大会；</p>
						<p>（六）做好统一战线工作；</p>
						<p>（七）法律和党内法规规定的其他职责。</p>
						<p>第十四条　党委书记、副书记根据法规和党内规定产生。党委书记主持学校党委的全面工作，党委副书记协助党委书记工作。</p>
						<p>第十五条　校长是学校的法定代表人，由符合法定任职条件的中国公民担任，按照国家有关规定产生，由国务院教育行政部门任命。</p>
						<p>第十六条　校长全面负责学校的教学、科学研究和行政管理工作，依法行使下列职权：</p>
						<p>（一）拟订发展规划，制定具体规章制度和年度工作计划并组织实施；</p>
						<p>（二）组织开展学科建设、教学活动、科学研究、社会服务、文化传承创新、人才队伍建设、思想品德教育、国际交流与合作等活动；</p>
						<p>（三）拟订学校组织机构的设置方案，按有关规定推荐副校长人选，按干部管理权限任免学校组织机构负责人；</p>
						<p>（四）依照法律法规和学校规定聘任与解聘教职工，对学生进行学籍管理，实施奖励或者处分；</p>
						<p>（五）拟订和执行年度经费预算方案，保护和管理学校资产，筹措办学经费，维护学校的合法权益；</p>
						<p>（六）行使学校教育教学和行政管理等其他相关职权。</p>
						<p>第十七条　学校按国家有关规定和程序设副校长若干人，协助校长行使职权。根据办学需要可设校长助理若干人。</p>
                    </div>
                    
                    <div id="tab13">
                    	<p>第一节　招生与学籍</p>
						<p>第八十条　学生是指按照国家招生政策被学校依法录取、取得入学资格、有学籍的受教育者。</p>
						<p>第八十一条　学校根据社会需求、办学条件和国家核定的办学规模，制订招生方案，自主调节系科招生比例。</p>
						<p>第八十二条　学校设立招生委员会，制定招生制度，规范招生程序，监督招生过程，审核年度招生方案，按照公开、公平、公正原则，依法依规招收各类学生。</p>
						<p>第八十三条　学生按规定办理注册，取得学籍。学校依照规定为学生办理休学、转专业、转学、退学、毕业等手续。</p>
						<p>第二节　权利与义务</p>
						<p>第八十四条　学生在校期间享有下列权利：</p>
						<p>（一）平等接受学校教育，利用学校公共教育资源，参加教育教学活动；</p>
						<p>（二）公正获得学业及思想品德评价，获得满足学业条件相应的学历学位证书；</p>
						<p>（三）获得在国内外深造学习和参加学术文化交流活动的机会；</p>
						<p>（四）获得荣誉和奖学金、助学金、助学贷款等资助的机会；</p>
						<p>（五）依照法律规定参加社会服务、勤工助学，发起成立、参加学生团体；</p>
						<p>（六）参与学校民主管理和教职工评价，对学校教育教学、改革发展等提出意见和建议；</p>
						<p>（七）对涉及自身利益的相关决定表达意见和提出申诉；</p>
						<p>（八）法律法规规定的其他权利。</p>
						<p>第八十五条　学生在校期间应履行下列义务：</p>
						<p>（一）遵守学校的各项规章制度；</p>
						<p>（二）参加学校教育教学活动，完成规定学业；</p>
						<p>（三）遵守行为规范、学术规范，恪守学术道德；</p>
						<p>（四）尊敬师长，养成良好的思想品德和行为习惯；</p>
						<p>（五）按规定缴纳相关费用，履行获得奖励资助约定的义务；</p>
						<p>（六）爱护学校提供的设备和设施；</p>
						<p>（七）珍惜学校声誉，维护学校利益；</p>
						<p>（八）法律法规规定的其他义务。</p>
						<p>第三节　管理与服务</p>
						<p>第八十六条　学校坚持以学生为本，建立健全学生服务体系，为学生学习、生活提供必需的条件保障，并根据办学能力不断改善学习生活环境。</p>
						<p>第八十七条　学校按照相关规定，支持学生成立学生组织和社团。学生组织和社团依法依规开展活动。</p>
						<p>第八十八条　学校支持学生开展有益身心健康的学术、科技、文艺、体育等活动，并提供相关条件。</p>
						<p>第八十九条　学校建立科学的学生评价机制，对在思想道德、学业成绩、科学研究、体育锻炼、创新创业、服务社会等方面表现优异的学生集体和个人给予表彰奖励，对违法违纪的学生集体和个人依法依规给予处分、处理。</p>
						<p>第九十条　学校在学生学业、就业、创新创业、职业发展、心理健康等方面提供指导和服务，为家庭经济困难学生提供适当帮助。</p>
						<p>第四节　权益保障</p>
						<p>第九十一条　学校建立学生权益保障机制，设立学生申诉处理机构，维护学生正当权益。</p>
						<p>第九十二条　学生对学校的处理或处分决定有异议，有权向学校申诉机构进行申诉，学校按照申诉程序受理学生申诉。</p>
                    </div>
                    <div id="tab14">
						<p>第一节　遴选与聘任</p>
						<p>第九十三条　教职工是指教师、其他专业技术人员、管理服务人员、工勤技能人员。</p></p>
						<p>第九十四条　学校按照“科学设岗、总量控制、按岗聘用、规范管理”的原则，实行岗位设置管理制度；依据岗位职责、任职条件和程序公开招聘、自主聘任（聘用）各类人员。</p>
						<p>第九十五条　学校成立教师岗位聘任委员会、专业技术岗位聘任委员会、管理岗位聘任委员会、工勤技能岗位聘任委员会，组织实施岗位聘任工作。</p>
						<p>第二节　权利与义务</p>
						<p>第九十六条　教职工享有以下权利：</p>
						<p>（一）教师依法自由选择学术方向，按照岗位要求和任务，自主开展教学和科学研究；</p>
						<p>（二）根据工作职责和贡献，依法获得相应薪酬、医疗、休假、保险等待遇，使用学校的公共资源，公平获得自身发展所需的机会和条件；</p>
						<p>（三）公正获得评价，公平获得各级各类奖励及各种荣誉称号；</p>
						<p>（四）　知悉学校改革、建设和发展以及关系切身利益的重大事项，参与民主管理和监督，对学校工作提出意见和建议；</p>
						<p>（五）对岗位聘任（聘用）、待遇、评优评奖、纪律处分等涉及切身利益的相关决定，有权表达异议，提出申诉，并请求处理；</p>
						<p>（六）法律法规规定及聘用合同约定的其他权利。</p>
						<p>第九十七条　教职工应履行下列义务：</p>
						<p>（一）遵守学校规章制度和教师职业道德规范；</p>
						<p>（二）贯彻国家教育方针，掌握本岗位工作技能，认真履行岗位职责，不断提高教学质量、科研水平、管理能力、服务质量；</p>
						<p>（三）尊重和爱护学生，为人师表，坚持教书育人、管理育人、服务育人；</p>
						<p>（四）制止有害于学生的行为或者其他侵犯学生合法权益的行为，批评和抵制有害于学生健康成长的现象；</p>
						<p>（五）珍惜学校荣誉，维护学校利益；</p>
						<p>（六）法律法规规定及聘用合同约定的其他义务。</p>
						<p>第九十八条　教职工符合国家规定的退休（退职）条件的应当退休（退职），退休（退职）后享受政策规定的待遇。</p>
						<p>第三节　管理与服务</p>
						<p>第九十九条　学校坚持人才强校战略,注重培养和引进高层次人才,建设高水平师资队伍。</p>
						<p>第一百条　学校建立健全符合现代大学制度要求的人事管理制度。实行教职工分类管理，明确岗位职责，实行年度考核和聘期考核，考核结果作为聘任、晋升和奖惩的依据。</p>
						<p>第一百零一条　学校建立与学校发展水平相适应的教职工薪酬福利制度。</p>
						<p>第一百零二条　学校建立健全教职工发展促进制度，完善教职工职业生涯发展支持体系。</p>
						<p>第一百零三条　学校建立奖惩制度。对在办学活动中作出突出成绩与贡献的教职工给予表彰和奖励；对违反法律法规、规章制度和聘任（聘用）合同规定的教职工，依法依规进行处理。</p>
						<p>第一百零四条　学校依据法律和双方约定的协议等，对讲座教授、兼职教授、名誉教授、客座教授、在站博士后、进修教师等其他非学校正式教职工进行管理，提供服务。</p>
                    </div>
                </div>
            </div>

            <div class="bloc right">
                <div class="title">
                    <div class="tabs" id="tabs2">
                        <a href="#tab21">校友与国内外合作</a>
                        <a href="#tab22">基础条件与保障体系</a>
                        <a href="#tab23">办学活动</a>
                        <a href="#tab24">附则</a>
                    </div>
                </div>
                <div class="content">
                    <div id="tab21">
                       <p>第一节　校友及校友会</p>
						<p>第一百零七条　学校校友是指1952年建校以来在校学习过的各种层次、各种类型的学生和学员，学校授予的名誉博士，学校聘请的讲座教授、客座教授、名誉教授、兼职教授和在校工作过的教职工。</p>
						<p>第一百零八条　学校加强与校友的联系与交流，支持校友事业发展，鼓励校友参与学校建设。</p>
						<p>第一百零九条　学校设立校友会。校友会依据国家有关规定及其章程开展活动。</p>
						<p>第二节　教育发展基金会</p>
						<p>第一百一十条　学校设立教育发展基金会。教育发展基金会是具有独立法人资格的非营利性组织，是学校接受社会捐赠的主体。</p>
						<p>第一百一十一条　教育发展基金会加强与境内外企事业单位、社会团体和个人的联系与合作，接受社会各界的捐赠，依法管理基金，接受监督。</p>
						<p>第三节　国内外交流与合作</p>
						<p>第一百一十二条　学校积极利用、整合行业与社会资源，广泛参与和推动政产学研用合作。</p>
						<p>第一百一十三条　学校加强与地方和企业的合作，促进学校与区域经济社会的协同发展。</p>
						<p>第一百一十四条　学校与国内高水平大学和科研机构开展深度合作，推动协同育人和科教资源共享。</p>
						<p>第一百一十五条　学校坚持国际化办学，加强与国际高水平大学和科研机构、企业的合作与交流，提高师资队伍国际化水平，提升科技创新能力和人才培养质量。加强对外汉语教学与师资队伍建设，推进孔子学院建设。</p>
                    </div>
                    <div id="tab22">
                        <p>第一节　校园规划与建设</p>
						<p>第一百一十六条　学校依法依规编制、修订校园规划与建设方案。校园规划与建设方案未经规定程序不得修改。</p>
						<p>第一百一十七条　学校校园建设坚持以人为本、保护环境、科学布局、统筹规划的原则，合理利用校园资源，加强基础设施建设，积极构建智慧校园、生态校园和人文校园。</p>
						<p>第二节　财务管理</p>
						<p>第一百一十八条　学校经费来源主要包括财政补助收入、事业收入、上级补助收入、附属单位上缴收入、经营收入和其他收入。</p>
						<p>第一百一十九条　学校积极拓展办学经费来源，构建以财政拨款为主、多渠道筹措办学经费为辅的工作机制。</p>
						<p>第一百二十条　学校建立健全各项财务管理制度，实行预决算管理，强化财务运行管理，提高资金使用效益。</p>
						<p>第一百二十一条　学校依法依规建立审计监督和经济责任制等内部控制制度，做好财务信息公开工作，接受有关部门和社会各界的监督。</p>
						<p>第三节　资产管理</p>
						<p>第一百二十二条　学校国有资产是指学校占有、使用的，在法律上确认为国家所有、能以货币计量的各种经济资源的总称，其表现形式为流动资产、固定资产、在建工程、无形资产和对外投资等。</p>
						<p>第一百二十三条　学校实行“统一领导、归口管理、分级负责、责任到人”的国有资产管理体制，依法使用和管理国有资产。</p>
						<p>第一百二十四条　学校建立健全国有资产管理制度，合理配置、有效使用和规范处置国有资产，推行绩效评价和成本分担机制，提高国有资产使用效益。</p>
						<p>第一百二十五条　学校依法保护和利用专利权、商标权、著作权、土地使用权、非专利技术、校誉等无形资产。</p>
						<p>第一百二十六条　学校对利用国有资产对外投资等形式形成的国有资产依法合理经营，实现国有资产的保值增值。</p>
						<p>第四节　馆藏资源及信息化建设</p>
						<p>第一百二十七条　图书馆、博物馆、档案馆、校史馆作为学校的馆藏资源中心，为学校事业发展提供支撑服务，为社会提供公共服务。</p>
						<p>第一百二十八条　学校加强对各类馆藏资源的收集、管理与利用，运用信息化手段实现各类馆藏资源的共知、共建和共享。</p>
						<p>第一百二十九条　学校大力建设教育教学、科学研究与管理服务信息化保障体系，提升信息技术服务学校发展的能力。</p>
						<p>第五节　后勤保障</p>
						<p>第一百三十条　后勤保障以服务学校中心工作为根本任务，强化服务意识和成本意识，科学管理，不断提高服务水平。</p>
						<p>第一百三十一条　学校加强对医疗、学前与基础教育、饮食、房产等公共资源的合理配置与利用，为教学、科研及师生员工生活提供公共服务。</p>
                    </div>
                    <div id="tab23">
                    	<p>第一节　人才培养</p>
						<p>第五十八条　学校的基本教育形式为全日制本科生教育和研究生教育，兼顾继续教育。</p>
						<p>学校依照国家法规和政策，制订学历、学位授予标准与办法，对符合条件的申请者授予相应的学历、学位证书。</p>
						<p>学校根据法律法规、社会需求和办学条件，自主调整办学规模、结构和学科专业设置，确定和调整学历教育修业年限</p>
						<p>第五十九条　学校建立学科专业动态调整机制，优化学科专业结构，持续提高学科专业水平。</p>
						<p>第六十条　人才培养方案制定、调整需在充分调研社会、行业需求以及学科发展的基础上，由学校统一组织，各系具体论证，学术分委员会与专门委员会审议，学术委员会或学位评定委员会审定。</p>
						<p>第六十一条　学校建立毕业生培养质量社会反馈机制和教育教学质量保障体系。校、院、系三级教学管理组织按照各自的权限和职责实施质量监督。</p>
						<p>第六十二条　学校积极开展教学改革与实践。不断优化教学内容和课程体系，完善教学评价标准，创新教学模式，优化教学活动的反馈及改进机制。</p>
						<p>第六十三条　学校加强教学实验室与校内外实习（实践）基地建设，推动第一课堂与第二课堂、教学与科研、理论与实践紧密结合，培养学生的实践能力和创新能力。</p>
						<p>第六十四条　学校充分借鉴国际先进教育理念，利用国外优质教育资源，积极推动与国外高水平大学学分互认、学生互换和联合培养，着力培养具有国际视野和竞争力的高素质人才。</p>
						<p>第六十五条　学校根据经济社会需求和人才成长规律，通过基地班、实验班、科教结合协同育人等举措，形成以提高创新能力为导向的“学术型”人才培养模式；通过“卓越工程师计划”、校地、校企联合培养等举措形成以提高实践能力为导向的“应用型”人才培养模式，努力提高本科生培养质量。</p>
						<p>第六十六条　学校建立并完善以提升创新能力为目标的学术学位研究生培养模式和以提升实践与创业能力为导向的专业学位研究生培养模式，提高研究生教育教学水平。</p>
						<p>第六十七条　学校积极发展国际学生教育，培养知华、友华的高素质国际学生。</p>
						<p>第六十八条　学校完善包括现代远程教育、成人教育、高等教育自学考试和非学历培训在内的继续教育体系。</p>
						<p>第二节　学术研究</p>
						<p>第六十九条　学校坚持科技兴校，追求学术卓越，围绕学科前沿和经济社会发展的重要需求，凝练学术方向，汇聚学术资源，推动学术创新。</p>
						<p>第七十条　学校制定学术发展战略，注重基础研究和应用研究，强化学科特色，加强原始创新，提升科技创新能力，促进各学科协调发展。</p>
						<p>第七十一条　学校建立健全学术管理体制和以绩效考核为主线的多元学术评价体系，为学术创新人才、团队成长创造良好的条件。</p>
						<p>第七十二条　学校强化学术创新基地建设，建立开放共享、布局合理、保障有力、高效运行的学术创新平台体系。</p>
						<p>第七十三条　学校弘扬科学精神，倡导学术自由和学术民主，加强学术规范和学术道德建设，杜绝学术不端行为。</p>
						<p>第三节　社会服务</p>
						<p>第七十四条　学校坚持协同创新，努力在地质勘探、防灾减灾、环境保护、信息、材料等领域为行业进步和经济社会发展提供科技和人才支撑，并致力于发挥智库作用。</p>
						<p>第七十五条　学校采用项目合作、资源共享、技术转移等多种方式，大力推进科技成果的转化与应用。</p>
						<p>第四节　文化传承与创新</p>
						<p>第七十六条　学校积极培育和践行社会主义核心价值观，把“谋求人与自然和谐发展”的理念融入办学活动全过程，把培育科学精神和人文素养等作为大学文化建设的重要任务，积极引领社会风尚，推动社会主义先进文化的传承创新。</p>
						<p>第七十七条　学校充分发挥文化育人功能，构筑特色鲜明的大学文化体系，促进师生的全面发展。</p>
						<p>第七十八条　学校深入开展可持续发展、生态文明等理论的创新研究，积极参与国家文化事业发展，向社会公众传播人与自然和谐发展理念、地球科学科普等知识。</p>
						<p>第七十九条　学校积极传播中华民族优秀传统文化，加强国际理解教育，推动跨文化交流。</p>
					</div>
					<div id="tab24">
                    	<p>第一百三十七条　章程草案经学校教职工代表大会审议、校务会通过、党委全委会审定，报国务院教育行政部门核准后，由学校予以发布。</p>
						<p>第一百三十八条　章程如需修订，由学校教职工代表大会1/5以上代表或校务会提议，党委常委会同意后修订。
						章程修订案的审核程序依据第一百三十七条的规定执行。</p>
						<p>第一百三十九条　章程是学校依法自主办学、实施管理和履行公共职能的基本准则。学校各单位、全体师生员工都必须以章程为根本活动准则，并且负有维护章程尊严、保证章程实施的职责，接受社会监督。</p>
						<p>第一百四十条　本章程由学校党委负责解释。</p>
						<p>第一百四十一条　本章程经国务院教育行政部门核准，自发布之日起实施。</p>
					</div>
                </div>
            </div>        
        </div>
        
        
    </body>
</html>