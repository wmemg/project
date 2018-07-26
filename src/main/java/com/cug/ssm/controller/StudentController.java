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
import com.cug.ssm.po.StudentBasicInfo;
import com.cug.ssm.po.User;
import com.cug.ssm.services.ChangeService;
import com.cug.ssm.services.GradeService;
import com.cug.ssm.services.StudentBasicInfoService;
import com.cug.ssm.services.UserService;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

@Controller
public class StudentController {

	@Autowired
	private StudentBasicInfoService studentBasicInfoService;

	@Autowired
	private UserService userService;
	
	
	@Autowired
	private ChangeService changeService;
	
	@Autowired
	private GradeService gradeService;

	@RequestMapping("/addfile")
	public String addfile(HttpServletRequest request, Model model) {
		return "add-file";
	}

	@RequestMapping("/addFile")
	public String addFile(HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			request.setCharacterEncoding("gb2312");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String stuSex = request.getParameter("stuSex");
		String stuAcademy = request.getParameter("stuAcademy");
		String stuDept = request.getParameter("stuDept");
		String stuClassId = request.getParameter("stuClassId");
		if (stuId.equals("") || stuName.equals("") || stuSex.equals("") || stuAcademy.equals("") || stuDept.equals("")
				|| stuClassId.equals("")) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Input can not be empty!')</script>");
				out.print("<script>location.href='addfile.action'</script>");
				out.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
			return "add-file";
		} else {
			StudentBasicInfo studentBasicInfo = new StudentBasicInfo();
			studentBasicInfo.setStuName(stuName);
			studentBasicInfo.setStuId(stuId);
			studentBasicInfo.setStuSex(stuSex);
			studentBasicInfo.setStuAcademy(stuAcademy);
			studentBasicInfo.setStuDept(stuDept);
			studentBasicInfo.setStuClassid(stuClassId);

			StudentBasicInfo studentBasicInfo1 = studentBasicInfoService.selectByPrimaryKey(stuId);

			if (studentBasicInfo1 == null) {// 该学生不存在，可以插入
				int result = studentBasicInfoService.insert(studentBasicInfo);
				if (result == 1) {
					try {
						User temp = userService.selectByPrimaryKey(stuId);
						if (temp != null) {
							User user = new User();
							user.setUsername(stuId);
							user.setPassword("000000");
							user.setPermission("0");
							userService.insert(user);
						}
						PrintWriter out = response.getWriter();
						out.print("<script>alert('Insert successfully!')</script>");
						out.print("<script>location.href='addfile.action'</script>");
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					try {
						PrintWriter out = response.getWriter();
						out.print("<script>alert('Failed to insert!')</script>");
						out.print("<script>location.href='addfile.action'</script>");
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			} else {
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('The Stu_id is already exist, can not be inserted again!')</script>");
					out.print("<script>location.href='addfile.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

		return "add-file";
	}

	@RequestMapping("/searchfile")
	public String searchfile(HttpServletRequest request, Model model, Page page) {
		int total = 0;
		int zongshu = studentBasicInfoService.getStudentTotal();
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
		List<StudentBasicInfo> studentListAll = studentBasicInfoService.selectStudentAll(page);
		model.addAttribute("studentListAll", studentListAll);
		return "search-file";
	}

	@RequestMapping("/searchFile")
	public String searchFile(HttpServletRequest request, Model model) {
		String stuId = request.getParameter("stuId");
		StudentBasicInfo studentBasicInfo = studentBasicInfoService.selectByPrimaryKey(stuId);
		List<StudentBasicInfo> studentListAll = new ArrayList<StudentBasicInfo>();
		studentListAll.add(studentBasicInfo);
		model.addAttribute("studentListAll", studentListAll);
		return "search-file";
	}

	@RequestMapping("/searchFileDelete")
	public String searchFileDelete(HttpServletRequest request, Model model, Page page) {
		String stuId = request.getParameter("searchFileDelete");
		studentBasicInfoService.deleteByPrimaryKey(stuId);//删除学生表中的该学生的记录
		gradeService.deleteByStuId(stuId);
		userService.deleteByPrimaryKey(stuId);
		changeService.deleteByPrimaryKey(stuId);

		int total = 0;
		int zongshu = studentBasicInfoService.getStudentTotal();
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

		List<StudentBasicInfo> studentListAll = studentBasicInfoService.selectStudentAll(page);
		model.addAttribute("studentListAll", studentListAll);
		return "search-file";
	}

	@RequestMapping("/addFileByFile")
	public String addFileByFile(HttpServletRequest request, HttpServletResponse response, Model model) {

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
		List<StudentBasicInfo> list = new ArrayList<StudentBasicInfo>();
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
		StudentBasicInfo studentBasicInfo = new StudentBasicInfo();
		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < clos; j++) {
				// 第一个是列数，第二个是行数
				String num = rs.getCell(j++, i).getContents();
				String name=rs.getCell(j++, i).getContents();
				String sex=rs.getCell(j++, i).getContents();
				String academy=rs.getCell(j++, i).getContents();
				String dept=rs.getCell(j++, i).getContents();
				String classid=rs.getCell(j++, i).getContents();
				if (num.equals("")||name.equals("")||sex.equals("")||academy.equals("")||dept.equals("")||classid.equals("")) {
					break;
				} else {
					StudentBasicInfo student = studentBasicInfoService.selectByPrimaryKey(num);
					if (student == null) {// 该学号不存在
						studentBasicInfo.setStuId(num);// 默认最左边编号也算一列
						// 所以这里得j++
						studentBasicInfo.setStuName(name);
						studentBasicInfo.setStuSex(sex);
						studentBasicInfo.setStuAcademy(academy);
						studentBasicInfo.setStuDept(dept);
						studentBasicInfo.setStuClassid(classid);
						int result = studentBasicInfoService.insert(studentBasicInfo);
						if (result == 1) {
							User temp = userService.selectByPrimaryKey(num);
							if (temp == null) { // 如果在用户表中没有该学生的记录，插入到用户表中并且设置密码和权限
								User user = new User();
								user.setUsername(num);
								user.setPassword("000000");
								user.setPermission("0");
								userService.insert(user);
							}
							list.add(studentBasicInfo);
						}
					}
				}
			}
		}
		if (!list.isEmpty()){
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Insert successfully')</script>");
				out.print("<script>location.href='addfile.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Failed to insert!')</script>");
				out.print("<script>location.href='addfile.action'</script>");
				out.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "add-file";
	}
}
