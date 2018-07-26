package com.cug.ssm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cug.ssm.other.Page;
import com.cug.ssm.po.Change;
import com.cug.ssm.po.StudentBasicInfo;
import com.cug.ssm.po.Teacher;
import com.cug.ssm.po.User;
import com.cug.ssm.po.UserAddName;
import com.cug.ssm.services.ChangeService;
import com.cug.ssm.services.CourseService;
import com.cug.ssm.services.GradeService;
import com.cug.ssm.services.StudentBasicInfoService;
import com.cug.ssm.services.TeacherService;
import com.cug.ssm.services.UserService;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ChangeService changeService;
	
	@Autowired
	private StudentBasicInfoService studentBasicInfoService;
	
	@Autowired
	private GradeService gradeService ;
	
	@Autowired
	private TeacherService teacherService ;
	
	@RequestMapping("/login")
	public String index(HttpServletRequest request, Model model) throws Exception {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String check = request.getParameter("check");

		String rightCheck = "selse";
		String message = "";

		if (username.equals("") || password.equals("") || check.equals("")) {
			message = "输入不能为空!";
			model.addAttribute("msg", message);
			return "login";
		} else {
			User user = userService.selectByPrimaryKey(username);
			if (user != null) {
				if (user.getPassword().equals(password)) {
					if (check.equals(rightCheck)) {
						request.getSession().setAttribute("user", user);
						model.addAttribute("msg", message);
						return "index";
					} else {
						message = "验证码输入错误!";
						model.addAttribute("msg", message);
						return "login";
					}
				} else {
					message = "密码输入错误!";
					model.addAttribute("msg", message);
					return "login";
				}
			} else {
				message = "该用户名不存在!";
				model.addAttribute("msg", message);
				return "login";
			}
		}
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("user");
		}
		return "login";
	}
	
	@RequestMapping("/settingroot") // 设置权限
	public String settingroot(HttpServletRequest request, Model model, Page page) {
		int total = 0;
		int zongshu = userService.getUserTotal();
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

		List<User> userListAll = userService.selectUserAll(page);
		model.addAttribute("userListAll", userListAll);
		model.addAttribute("one", "1");
		return "setting-root";
	}
	
	@RequestMapping("/searchPemission") // 设置权限 查询输入的编号对应的信息
	public String searchPemission(HttpServletRequest request, Model model) {

		String username = request.getParameter("username");
		User user = userService.selectByPrimaryKey(username);
		UserAddName userAddName = new UserAddName();
		if (user.getPermission().equals("0")) {
			StudentBasicInfo studentBasicInfo = studentBasicInfoService.selectByPrimaryKey(username);
			userAddName.setName(studentBasicInfo.getStuName());
			userAddName.setName(studentBasicInfo.getStuName());
		} else {
			userAddName.setName("无名");
		}
		userAddName.setPermission(user.getPermission());
		userAddName.setUsername(username);
		List<UserAddName> userListAll = new ArrayList<UserAddName>(); // =
																		// userService.serachUser(username);
		userListAll.add(userAddName);
		model.addAttribute("one", "2");
		model.addAttribute("userListAll", userListAll);
		return "setting-root";
	}
	
	
	@RequestMapping("/searchPemissionDelete") // 设置权限 删除
	public String searchPemissionDelete(HttpServletRequest request, HttpServletResponse response,Model model,Page page) {
		
		String permission = request.getParameter("searchPemissionDelete1");
		String Id = request.getParameter("searchPemissionDelete0");
		
		if (permission.equals("0")) {// 学生
			Change change=changeService.selectByPrimaryKey(Id);
			
			if(change!=null){
				String status=change.getChangeStatus();
				if(status.equals("1")||status.equals("4")){
					userService.deleteByPrimaryKey(Id);
					studentBasicInfoService.deleteByPrimaryKey(Id);//删除学生表中的该学生的记录
					gradeService.deleteByStuId(Id);
					changeService.deleteByPrimaryKey(Id);
				}else{
					try {
						PrintWriter out = response.getWriter();
						out.print("<script>alert('The student are not in offschool status!')</script>");
						out.print("<script>location.href='addscore.action'</script>");
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else{
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('The student are not in offschool status!')</script>");
					out.print("<script>location.href='addscore.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else if(permission.equals("1")){//教师
			Teacher teacher=teacherService.selectByPrimaryKey(Id);
			if(teacher!=null&&teacher.getCourseId()!=null){
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('The teacher still has course.Can not be deleted!')</script>");
					out.print("<script>location.href='addscore.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				userService.deleteByPrimaryKey(Id);
				teacherService.deleteByPrimaryKey(Id);
			}
			
		}else{//管理员
			userService.deleteByPrimaryKey(Id);
		}
		int total = 0;
		int zongshu = userService.getUserTotal();
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
		
		List<User> userListAll = userService.selectUserAll(page);
		model.addAttribute("userListAll", userListAll);
		model.addAttribute("one", "1");
		return "setting-root";
	}
	
	@RequestMapping("/settinguser")
	public String settinguser(HttpServletRequest request, Model model,Page page) {
		
		int total = 0;
		int zongshu = userService.getUserTotal();
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
		
		List<User> userListAll = userService.selectUserAll(page);
		model.addAttribute("userListAll", userListAll);
		return "setting-user";
	}


	@RequestMapping("/settingUserDelete")
	public String settingUserDelete(HttpServletRequest request, HttpServletResponse response,Model model,Page page) {
		String Id = request.getParameter("searchUserDelete0");
		String permission = request.getParameter("searchUserDelete1");
		
		if (permission.equals("0")) {// 学生
			Change change=changeService.selectByPrimaryKey(Id);
			
			if(change!=null){
				String status=change.getChangeStatus();
				if(status.equals("1")||status.equals("4")){
					userService.deleteByPrimaryKey(Id);
					studentBasicInfoService.deleteByPrimaryKey(Id);//删除学生表中的该学生的记录
					gradeService.deleteByStuId(Id);
					changeService.deleteByPrimaryKey(Id);
				}else{
					try {
						PrintWriter out = response.getWriter();
						out.print("<script>alert('The student are not in offschool status!')</script>");
						out.print("<script>location.href='addscore.action'</script>");
						out.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}else{
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('The student are not in offschool status!')</script>");
					out.print("<script>location.href='addscore.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}else if(permission.equals("1")){//教师
			Teacher teacher=teacherService.selectByPrimaryKey(Id);
			if(teacher!=null&&teacher.getCourseId()!=null){
				try {
					PrintWriter out = response.getWriter();
					out.print("<script>alert('The teacher still has course.Can not be deleted!')</script>");
					out.print("<script>location.href='addscore.action'</script>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else{
				userService.deleteByPrimaryKey(Id);
				teacherService.deleteByPrimaryKey(Id);
			}
			
		}else{//管理员
			userService.deleteByPrimaryKey(Id);
		}
		int total = 0;
		int zongshu = userService.getUserTotal();
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
		
		List<User> userListAll = userService.selectUserAll(page);
		model.addAttribute("userListAll", userListAll);
		return "setting-user";
	}
	
	@RequestMapping("/addUserByFile")
	public String addUserByFile(HttpServletRequest request, HttpServletResponse response,Model model,Page page) {

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
			List<FileItem> list = (List<FileItem>) upload.parseRequest(request); // get
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
		List<User> list = new ArrayList<User>();
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
		User user = new User();
		for (int i = 0; i < rows; i++) {
			for (int j = 0; j < clos; j++) {
				String num = rs.getCell(j++, i).getContents();
				String password=rs.getCell(j++, i).getContents();
				String permission=rs.getCell(j++, i).getContents();
				if (num.equals("")||password.equals("")||permission.equals("")) {
					break;
				} else {
					User student = userService.selectByPrimaryKey(num);
					if (student != null) {
						break;
					} else {
						user.setUsername(num);// 默认最左边编号也算一列
						// 所以这里得j++
						user.setPassword(password);
						user.setPermission(permission);
						int result = userService.insert(user);
						if (result == 1) {
							list.add(user);
						}
					}
				}
			}
		}
		if (list != null) {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Insert successfully')</script>");
				out.print("<script>location.href='settinguser.action'</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>alert('Failed to insert!')</script>");
				out.print("<script>location.href='settinguser.action'</script>");
				out.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int total=0;
		int zongshu = studentBasicInfoService.getStudentTotal();
		if(zongshu%10==0){
			total = zongshu/10;
		}else{
			total = zongshu/10+1;
		}
		
		if(page.getStartRow()==0&&page.getPageNo()==0){
			page.setStartRow(0);
			page.setEndRow(10);
			page.setPageNo(1);
			request.getSession().setAttribute("page", page);
		}else{
			if(page.getPageNo()>total){
				page.setPageNo(total);
			}
			if(page.getPageNo()==0){
				page.setPageNo(1);
			}
			page.setStartRow((page.getPageNo()-1)*10);
			page.setEndRow(10);
		}

		List<User> userListAll = userService.selectUserAll(page);
		model.addAttribute("userListAll", userListAll);
		return "setting-user";
	}
	
	
	

}
