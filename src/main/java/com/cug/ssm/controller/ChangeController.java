package com.cug.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cug.ssm.po.Change;
import com.cug.ssm.po.StudentBasicInfo;
import com.cug.ssm.services.ChangeService;
import com.cug.ssm.services.StudentBasicInfoService;

@Controller
public class ChangeController {
	@Autowired
	private ChangeService changeService;
	
	@Autowired
	private StudentBasicInfoService studentBasicInfoService;

	@RequestMapping("/searchChange")
	public String serachChange(HttpServletRequest request, Model model) throws Exception {
		String stuId=request.getParameter("stuId");
		List<Change> changeList = changeService.serachChange(stuId);
		model.addAttribute("changeList", changeList);
		return "search-change";
	}	
	
	@RequestMapping("/searchchange")//�춯��ѯ
	public String searchchange(Model model) {
		
		List<Change> changeListAll = changeService.serachChangeAll();
		model.addAttribute("changeListAll", changeListAll);
		return "search-change";
	}
	
	@RequestMapping("/changeclass")//ѧ������
	public String changeclass(Model model) {
		List<Change> changeClassListAll = changeService.serachChangeClassAll("0");
		model.addAttribute("changeClassListAll", changeClassListAll);
		return "change-class";
	}
	
	@RequestMapping("/changeClass")//������Ϣ����ѧ������
	public String changeClass(HttpServletRequest request, HttpServletResponse response,Model model) {
		String stuId=request.getParameter("stuId");
		if(stuId.equals("")){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('The stu_id can not be empty')</script>");
				out.print("<script>location.href='changeclass.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "change-class";
		}
		StudentBasicInfo studentBasicInfo=studentBasicInfoService.selectByPrimaryKey(stuId);//�Ȳ�ѯ����ѧ���ļ�¼
		if(studentBasicInfo==null){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('The stu_id is not exist!')</script>");
				out.print("<script>location.href='changeclass.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			String stuName=studentBasicInfo.getStuName();
		    String stuClassid=request.getParameter("stuClassid");
		    String changeStatus="0";
		    String changeDes=request.getParameter("changeDes");
		    String date1=request.getParameter("date");
		    Change change=new Change();
		    change.setStuId(stuId);
			change.setStuName(stuName);
			change.setStuClassid(stuClassid);
			change.setChangeStatus(changeStatus);
			change.setChangeDes(changeDes);
		    change.setDate(date1);
		    Change change1=changeService.selectByPrimaryKey(stuId);
		    if(change1==null){//�춯����û�и�ѧ����¼
		    	changeService.insert(change);
		    }else{
		    	changeService.deleteByPrimaryKey(stuId);
		    	changeService.insert(change);
		    }
		    if(request.getParameter("changeDes")!=null){
		    	studentBasicInfo.setStuClassid(request.getParameter("changeDes"));
				studentBasicInfoService.updateByPrimaryKey(studentBasicInfo);//�޸İ༶
		    }
			List<Change> changeClassListAllAddOne = changeService.serachChangeClassAll("0");
			model.addAttribute("changeClassListAllAddOne", changeClassListAllAddOne);
		}
		return "change-class";
	}
	
	@RequestMapping("/changeschool")//תѧ
	public String changeschool(HttpServletRequest request, Model model) {
		
		List<Change> changeSchoolListAll = changeService.serachChangeSchoolAll("1");
		model.addAttribute("changeSchoolListAll", changeSchoolListAll);
		return "change-school";
	}
	
	@RequestMapping("/changeSchool")//////תѧ��Ϣ�ύ
	public String changeSchool(HttpServletRequest request, HttpServletResponse response,Model model) {
		String stuId=request.getParameter("stuId");
		if(stuId.equals("")){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Input can not be empty!')</script>");
				out.print("<script>location.href='changeschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "change-school";
		}
		
		StudentBasicInfo studentBasicInfo=studentBasicInfoService.selectByPrimaryKey(stuId);
		if(studentBasicInfo==null){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('The stu_id is not exist!')</script>");
				out.print("<script>location.href='changeschool.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			Change record=new Change();
			record.setStuName(studentBasicInfo.getStuName());
			record.setStuId(request.getParameter("stuId"));
			record.setStuClassid(request.getParameter("stuClassid"));
			record.setChangeStatus("1");
			record.setChangeDes(request.getParameter("stuClassid"));
			record.setDate(request.getParameter("date"));
			Change change1=changeService.selectByPrimaryKey(stuId);
		    if(change1==null){//�춯����û�и�ѧ����¼
		    	changeService.insert(record);
		    }else{
		    	changeService.deleteByPrimaryKey(stuId);
		    	changeService.insert(record);
		    }
		}
		List<Change> changeSchoolListAll = changeService.serachChangeSchoolAll("1");
		model.addAttribute("changeSchoolListAll", changeSchoolListAll);
		return "change-school";
	}
	
	@RequestMapping("/reentryschool")//��ѧ
	public String reentryschool(HttpServletRequest request, Model model) {
		List<Change> reEntrySchoolListAll = changeService.reEntrySchoolAll("2");
		model.addAttribute("reEntrySchoolListAll", reEntrySchoolListAll);
		return "reentry-school";
	}

	////��ѧ��Ϣ�ύ
	@RequestMapping("/reEntrySchool")//��ѧ----------------ԭ��������ѧ״̬���жϣ����޸��춯��
	public String reEntrySchool(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		String stuId=request.getParameter("stuId");
		
		if(stuId.equals("")){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Input can not be empty!')</script>");
				out.print("<script>location.href='reentryschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "reentry-school";
		}
		
		Change change=changeService.selectByPrimaryKey(stuId);
		if(change!=null && change.getChangeStatus().equals("3")){
			change.setChangeStatus("2");
			changeService.updateByPrimaryKeySelective(change);
			List<Change> reEntrySchoolListAll = changeService.reEntrySchoolAll("2");
			model.addAttribute("reEntrySchoolListAll", reEntrySchoolListAll);
		}
		else{
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Failed! The student maybe not exist or the student are not in suspend status')</script>");
				out.print("<script>location.href='reentryschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "reentry-school";
	}

	
	@RequestMapping("/suspendschool")//��ѧ
	public String suspendschool(HttpServletRequest request, Model model) {
		List<Change> stopSchoolListAll = changeService.stopSchoolAll("3");
		model.addAttribute("stopSchoolListAll", stopSchoolListAll);
		return "suspend-school";
	}
  
	@RequestMapping("/suspendSchool")  //��ѧ��Ϣ�ύ------���Ҹ�ѧ���Ƿ����
	public String suspendSchool(HttpServletRequest request,HttpServletResponse response, Model model) {
		String stuId=request.getParameter("stuId");
		
		if(stuId.equals("")){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Input can not be empty!')</script>");
				out.print("<script>location.href='suspendschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "suspend-school";
		}
		
		
		StudentBasicInfo studentBasicInfo=studentBasicInfoService.selectByPrimaryKey(stuId);
		if(studentBasicInfo==null){
			
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('The student maybe not exist!')</script>");
				out.print("<script>location.href='suspendschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			Change record=new Change();
			record.setStuName(studentBasicInfo.getStuName());
			record.setStuId(request.getParameter("stuId"));
			record.setStuClassid(request.getParameter("stuClassid"));
			record.setChangeStatus("3");
			record.setChangeDes(request.getParameter("stuClassid"));
			record.setDate(request.getParameter("date"));
			Change change1=changeService.selectByPrimaryKey(stuId);
		    if(change1==null){//�춯����û�и�ѧ����¼
		    	changeService.insert(record);
		    }else{
		    	changeService.deleteByPrimaryKey(stuId);
		    	changeService.insert(record);
		    }
		}
		List<Change> stopSchoolListAll = changeService.stopSchoolAll("3");
		model.addAttribute("stopSchoolListAll", stopSchoolListAll);
		return "suspend-school";
	}
	
	@RequestMapping("/leaveschool")//��ѧ
	public String leaveschool(HttpServletRequest request, Model model) {
		List<Change> leaveSchoolListAll = changeService.leaveSchoolAll("4");
		model.addAttribute("leaveSchoolListAll", leaveSchoolListAll);
		return "leave-school";
	}
	
	@RequestMapping("/leaveSchool")//��ѧ��Ϣ�ύ,�жϸ�ѧ���Ƿ���ڣ��޸��춯��ɾ����ѧ���ļ�¼����ʱû��ʵ�֣�
	public String leaveSchool(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		String stuId=request.getParameter("stuId");
		
		if(stuId.equals("")){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('Input can not be empty!')</script>");
				out.print("<script>location.href='leaveschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "leave-school";
		}
		StudentBasicInfo studentBasicInfo=studentBasicInfoService.selectByPrimaryKey(stuId);
		if(studentBasicInfo==null){
			try {
				PrintWriter out=response.getWriter();
				out.print("<script>alert('The student maybe not exist!')</script>");
				out.print("<script>location.href='leaveschool.action'</script>");
				out.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			Change record=new Change();
			record.setStuName(studentBasicInfo.getStuName());
			record.setStuId(request.getParameter("stuId"));
			record.setStuClassid(request.getParameter("stuClassid"));
			record.setChangeStatus("4");
			record.setChangeDes(request.getParameter("stuClassid"));
			record.setDate(request.getParameter("date"));
			
			Change change1=changeService.selectByPrimaryKey(stuId);
		    if(change1==null){//�춯����û�и�ѧ����¼
		    	changeService.insert(record);
		    }else{
		    	changeService.deleteByPrimaryKey(stuId);
		    	changeService.insert(record);
		    }
		}
		List<Change> leaveSchoolListAll = changeService.leaveSchoolAll("4");
		model.addAttribute("leaveSchoolListAll", leaveSchoolListAll);
		return "leave-school";
	}
	
	
	
	
	
	
	@RequestMapping("/classDelete")//ѧ������ɾ����ť
	public String classDelete(HttpServletRequest request, Model model) {
		String stuId=request.getParameter("classDelete");
		changeService.deleteByPrimaryKey(stuId);
		List<Change> changeClassListAll = changeService.serachChangeClassAll("0");
		model.addAttribute("changeClassListAll", changeClassListAll);
		return "change-class";
	}
	
	@RequestMapping("/changeSchoolDelete")//ѧ��תѧɾ����ť
	public String changeSchoolDelete(HttpServletRequest request, Model model) {
		String stuId=request.getParameter("changeSchoolDelete");
		changeService.deleteByPrimaryKey(stuId);
		List<Change> changeSchoolListAll = changeService.serachChangeSchoolAll("1");
		model.addAttribute("changeSchoolListAll", changeSchoolListAll);
		return "change-school";
	}
	
	
	@RequestMapping("/reEntryschoolDelete")//ѧ����ѧɾ����ť
	public String reEntryschoolDelete(HttpServletRequest request, Model model) {
		String stuId=request.getParameter("reEntryschoolDelete");
		changeService.deleteByPrimaryKey(stuId);
		List<Change> changeSchoolListAll = changeService.serachChangeSchoolAll("2");
		model.addAttribute("changeSchoolListAll", changeSchoolListAll);
		return "change-school";
	}
	
	@RequestMapping("/suspendSchoolDelete")//ѧ����ѧɾ����ť
	public String suspendSchoolDelete(HttpServletRequest request, Model model) {
		String stuId=request.getParameter("suspendSchoolDelete");
		changeService.deleteByPrimaryKey(stuId);
		List<Change> stopSchoolListAll = changeService.stopSchoolAll("3");
		model.addAttribute("stopSchoolListAll", stopSchoolListAll);
		return "suspend-school";
	}
	
	@RequestMapping("/leaveSchoolDelete")//ѧ����ѧɾ����ť
	public String leaveSchoolDelete(HttpServletRequest request, Model model) {
		String stuId=request.getParameter("leaveSchoolDelete");
		changeService.deleteByPrimaryKey(stuId);
		List<Change> leaveSchoolListAll = changeService.leaveSchoolAll("4");
		model.addAttribute("leaveSchoolListAll", leaveSchoolListAll);
		return "leave-school";
	}
	
	@RequestMapping("/searchChangeDelete")//�춯��ѯɾ����ť
	public String searchChangeDelete(HttpServletRequest request, Model model) throws Exception {
		String stuId=request.getParameter("searchChangeDelete");
		changeService.deleteByPrimaryKey(stuId);
		List<Change> changeList = changeService.serachChange(stuId);
		model.addAttribute("changeList", changeList);
		return "search-change";
	}
	
	
}
