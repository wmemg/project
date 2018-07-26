package com.cug.ssm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.Course;
import com.cug.ssm.po.Grade;
import com.cug.ssm.po.GradeKey;
import com.cug.ssm.po.StudentBasicInfo;
import com.cug.ssm.po.User;
import com.cug.ssm.services.CourseService;
import com.cug.ssm.services.GradeService;
import com.cug.ssm.services.StudentBasicInfoService;
import com.cug.ssm.services.UserService;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

@Controller
public class GradeContrller {
	@Autowired
	private UserService userService;

	@Autowired
	private GradeService gradeService;
	
	@Autowired
	private StudentBasicInfoService studentBasicInfoService;
	
	@Autowired
	private CourseService courseService;
	

	@RequestMapping("/searchscore") // 分页查询
	public String searchscore(HttpServletRequest request, Model model, Page page) {
		User user = (User) request.getSession().getAttribute("user");
		String permission = user.getPermission();

		if (permission.equals("0")) {// 学生
			List<Grade> gradeList = gradeService.selectGradeListByID(user.getUsername());
			model.addAttribute("gradeList", gradeList);
			model.addAttribute("bianhao", "课程号");
		} else {// 老师和管理员

			int total = 0;
			int zongshu = gradeService.getGradetTotal();
			if (zongshu % 10 == 0) {
				total = zongshu / 10;
			} else {
				total = zongshu / 10 + 1;
			}
			if (page.getStartRow() == 0 && page.getPageNo() == 0) {
				page.setStartRow(0);
				page.setEndRow(10);
				page.setPageNo(1);
				request.getSession().setAttribute("page", page);
			} else {
				if (page.getPageNo() > total) {
					page.setPageNo(total);
				}
				if (page.getPageNo() == 0) {
					page.setPageNo(1);
				}
				page.setStartRow((page.getPageNo() - 1) * 10);
				page.setEndRow(10);
			}
			List<Grade> gradeList = gradeService.selectGradeList(page);
			model.addAttribute("gradeList", gradeList);
			model.addAttribute("bianhao", "班号");
		}
		return "search-score";
	}

	@RequestMapping("/searchScore") // 输入查询成绩
	public String searchScore(HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = (User) request.getSession().getAttribute("user");
		String permission = user.getPermission();
		String number = request.getParameter("ID");

		if (number.equals("")) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Score can not be empty!')</script>");
				out.print("<script>location.href='searchScore.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			if (permission.equals("0")) {// 学生 根据课程号查询
				GradeKey gradeKey = new GradeKey();
				gradeKey.setStuId(user.getUsername());
				gradeKey.setCourseId(number);
				Grade grade = gradeService.selectByPrimaryKey(gradeKey);
				List<Grade> gradeList = new ArrayList<Grade>();
				gradeList.add(grade);
				model.addAttribute("gradeList", gradeList);
			} else {// 老师和管理员根据班级号进行查询
				List<Grade> gradeList = gradeService.selectGradeListByClass(number);
				model.addAttribute("gradeList", gradeList);
			}
		}
		return "search-score";
	}

	@RequestMapping("/searchScoreDelete")//管理员/老师删除成绩
	public String searchScoreDelete(HttpServletRequest request, Model model, Page page) {// 先删除，再显示
		String stuId = request.getParameter("searchScoreDeleteStuId");
		String courseId=request.getParameter("searchScoreDeleteCourseId");
		GradeKey gradeKey=new GradeKey();
		gradeKey.setStuId(stuId);
		gradeKey.setCourseId(courseId);
		gradeService.deleteByPrimaryKey(gradeKey);
		int total = 0;
		int zongshu = gradeService.getGradetTotal();
		if (zongshu % 10 == 0) {
			total = zongshu / 10;
		} else {
			total = zongshu / 10 + 1;
		}
		if (page.getStartRow() == 0 && page.getPageNo() == 0) {
			page.setStartRow(0);
			page.setEndRow(10);
			page.setPageNo(1);
			request.getSession().setAttribute("page", page);
		} else {
			if (page.getPageNo() > total) {
				page.setPageNo(total);
			}
			if (page.getPageNo() == 0) {
				page.setPageNo(1);
			}
			page.setStartRow((page.getPageNo() - 1) * 10);
			page.setEndRow(10);
		}
		List<Grade> gradeList = gradeService.selectGradeList(page);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("bianhao", "ClassID");
		return "search-score";
	}
	
	@RequestMapping("/addscore")
	public String addscore(HttpServletRequest request, Model model) {
		return "add-score";
	}
	
	
	@RequestMapping("/addScore")
	public String addScore(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		try {
			request.setCharacterEncoding("gb2312");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuClassid = request.getParameter("stuClassid");
		String courseId = request.getParameter("courseId");

		Float grade;
		if (request.getParameter("grade").equals("")) {
			// model.addAttribute("msg", message);
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Score can not be empty!')</script>");
				out.print("<script>location.href='addscore.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "add-score";
		} else {
			grade = Float.parseFloat(request.getParameter("grade"));
			
			if(grade<0 || grade>100){
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Score are not between 0 and 100')</script>");
					out.print("<script>location.href='addscore.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return "add-score";
			}
		}
		if (stuId.equals("") || stuName.equals("") || stuClassid.equals("") || courseId.equals("") || grade.equals("")) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Input can not be empty!')</script>");
				out.print("<script>location.href='addscore.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "add-score";
		} else {
			Grade grade1 = new Grade();
			grade1.setStuId(stuId);
			grade1.setStuName(stuName);
			grade1.setStuClassid(stuClassid);
			grade1.setCourseId(courseId);
			grade1.setGrade(grade);
			StudentBasicInfo studentBasicInfo = studentBasicInfoService.selectByPrimaryKey(stuId);// 从学生基本信息表中查询是否有该学生
			
			GradeKey gradeKey=new GradeKey();
			gradeKey.setStuId(stuId);
			gradeKey.setCourseId(courseId);
			Grade grade2=gradeService.selectByPrimaryKey(gradeKey);
			Course course=courseService.selectByPrimaryKey(courseId);
			
			if (studentBasicInfo!=null && grade2==null && course!=null) {//该学生存在，可以插入成绩   
				
				if(studentBasicInfo.getStuName().equals(stuName)&&studentBasicInfo.getStuClassid().equals(stuClassid)){
					int result = gradeService.insert(grade1);
					if (result == 1) {// 插入成功
						try {
							PrintWriter out = response.getWriter();
							out.print("<script>alert('Inert successfully!')</script>");
							out.print("<script>location.href='addscore.action'</script>");
							out.close();
	
						} catch (IOException e) {
							e.printStackTrace();
						}
					} else {
						try {
							PrintWriter out = response.getWriter();
							out.print("<script>alert('Failed to insert!')</script>");
							out.print("<script>location.href='addscore.action'</script>");
							out.close();
	
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			} else {//不是该学校的学生
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('Failed to insert!The record is alreay existed or the student dose not exist')</script>");
					out.print("<script>location.href='addscore.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "add-score";
	}
	
	@RequestMapping("/addScoreByFile")
	public String addScoreByFile(HttpServletRequest request, HttpServletResponse response, Model model) {
		String path = request.getRealPath("/upload");// create a path to save
														// the file uploaded
		System.out.println(path);
		File file = new File(path);
		file.mkdirs();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(file); // set temporary file
		factory.setSizeThreshold(1024 * 1024);// set temporary file's size
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");// set the encoding language
		String filename = "";

		try {
			List<FileItem> list = (List<FileItem>) upload.parseRequest(request); 
			for (FileItem item : list) {
				String name = item.getFieldName(); // get the file(field or real
													// file)'s name
				if (item.isFormField()) {
					System.out.println("just a simple field....");
					String value = item.getString();
					System.out.println(name + " = " + value);
					request.setAttribute(name, value);
				} else {
					String value = item.getName();// this item is real file
					System.out.println("got a real file");
					int start = value.lastIndexOf("\\");
					filename = value.substring(start + 1);// 锟斤拷锟斤拷锟斤拷锟斤拷锟侥硷拷锟斤拷锟街ｏ拷通锟斤拷锟斤拷一锟斤拷转锟斤拷只锟斤拷锟斤拷使锟斤拷Opera锟斤拷锟斤拷锟绞憋拷锟斤拷锟揭癸拷锟�
					System.out.println("file name : " + filename);
					request.setAttribute(name, filename);
					File f1 = new File(path, filename);
					OutputStream os = new FileOutputStream(f1);
					InputStream is = item.getInputStream();
					byte[] buffer = new byte[400];
					int length;
					while ((length = is.read(buffer)) != -1) {
						os.write(buffer, 0, length);
					}
					is.close();
					os.close();
					System.out.println("generate a file in the server.....");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Grade> list = new ArrayList<Grade>();
		File file1 = new File(path.concat("\\" + filename));
		Workbook rwb = null;
		try {
			rwb = Workbook.getWorkbook(file1);
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Sheet rs = rwb.getSheet("Sheet1");// 或者rwb.getSheet(0)
		int clos = rs.getColumns();// 得到所有的列
		int rows = rs.getRows();// 得到所有的行
		Grade grade = new Grade();
		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < clos; j++) {
				String num=rs.getCell(j++, i).getContents();
				String stuName=rs.getCell(j++, i).getContents();
				String stuClassid=rs.getCell(j++, i).getContents();
				String courseId=rs.getCell(j++, i).getContents();
				String grade1=rs.getCell(j++, i).getContents();
			
				if(num.equals("")||stuName.equals("")||stuClassid.equals("")||courseId.equals("")||grade1.equals("")){
					break;
				}else{
					StudentBasicInfo student = studentBasicInfoService.selectByPrimaryKey(num);
					GradeKey gradeKey=new GradeKey();
					gradeKey.setStuId(num);
					gradeKey.setCourseId(courseId);
					Grade grade2=gradeService.selectByPrimaryKey(gradeKey);
					Course course=courseService.selectByPrimaryKey(courseId);
					
					if (student!=null && grade2==null && course!=null) {//该学生存在，可以插入成绩   
						
						if(student.getStuName().equals(stuName)&&student.getStuClassid().equals(stuClassid)){
							
							grade.setStuId(num);// 默认最左边编号也算一列
							grade.setStuName(stuName);
							grade.setStuClassid(stuClassid);
							grade.setCourseId(courseId);
							grade.setGrade(Float.parseFloat(grade1));
							int result = gradeService.insert(grade);
							if (result == 1) {// 插入成功
								try {
									PrintWriter out = response.getWriter();
									out.print("<script>alert('Inert successfully!')</script>");
									out.print("<script>location.href='addscore.action'</script>");
									out.close();
			
								} catch (IOException e) {
									e.printStackTrace();
								}
								list.add(grade);
							} else {
								try {
									PrintWriter out = response.getWriter();
									out.print("<script>alert('Failed to insert!')</script>");
									out.print("<script>location.href='addscore.action'</script>");
									out.close();
								} catch (IOException e) {
									e.printStackTrace();
								}
							}
						}
					} else {//不是该学校的学生
						try {
							PrintWriter out = response.getWriter();
							out.print("<script>alert('Failed to insert!The record is alreay existed or the student dose not exist')</script>");
							out.print("<script>location.href='addscore.action'</script>");
							out.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					
				}
			}
		}
		if (list != null) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Insert successfully')</script>");
				out.print("<script>location.href='addscore.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Failed to insert!')</script>");
				out.print("<script>location.href='addscore.action'</script>");
				out.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "add-score";
	}
	
	
	
}
