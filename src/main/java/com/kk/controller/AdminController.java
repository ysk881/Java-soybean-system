package com.kk.controller;

import com.github.pagehelper.PageInfo;
import com.kk.form.AdminForm;
import com.kk.pogo.Account;
import com.kk.pogo.Admin;
import com.kk.pogo.Know;
import com.kk.pogo.User;
import com.kk.service.AdminService;
import com.kk.service.KnowService;
import com.kk.service.VarietyService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;


    //跳转至登录页面
    @RequestMapping("/tologins")
    public String toLogin() {
        return "super/login";
    }

    //实现登判断,并进行相应的跳转
    @RequestMapping("/login")
    public ModelAndView adminLogin(AdminForm adminForm, HttpSession session) {
        Account account =this.adminService.adminLogin(adminForm);
        ModelAndView modelAndView = new ModelAndView();
        switch (adminForm.getType()) {
            case "Admin":
                switch (account.getCode()) {
                    case -1:
                        modelAndView.setViewName("super/login");
                        modelAndView.addObject("nameError", "用户名错误");
                        break;
                    case -2:
                        modelAndView.setViewName("super/login");
                        modelAndView.addObject("passError", "密码错误");
                        break;
                    case 0:
                        modelAndView.setViewName("super/main");
                        session.setAttribute("admin", account.getAdmin());
                        break;
                }
                break;
            case "User":
                switch (account.getCode()) {
                    case -1:
                        modelAndView.setViewName("admin/login");
                        modelAndView.addObject("nameError", "用户名错误");
                        break;
                    case -2:
                        modelAndView.setViewName("admin/login");
                        modelAndView.addObject("passError", "密码错误");
                        break;
                    case 0:
                        modelAndView.setViewName("admin/main");
                        session.setAttribute("user", account.getAdmin());
                        break;
                }

        }
        return modelAndView;
    }


    //注销登录
    @RequestMapping("/outlogin")
    public String outLogin(HttpSession session) {
        session.removeAttribute("person");
        return "super/login";
    }

    /*修改登录密码*/
    //跳转到修改页面
    @RequestMapping("/admininfo")
    public String updatead() {
        return "super/updateadm";
    }

    /*修改超级管理员信息*/
    @RequestMapping("/upadmin")
    public String updateadmin(Admin admin) {
        int ad = adminService.updateAdminPwd(admin);
        if (ad > 0) {
            System.out.println("修改成功" + ad);
            return "redirect:/admin/tologins";
        } else {
            System.out.println("修改失败" + ad);
            return "error/errvar";
        }
    }
    //    查询所有用户
    @RequestMapping("/allUser")
    public String findAllUser(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                              @RequestParam(defaultValue = "5") Integer pageSize,
                              @RequestParam(required = false) String username,
                              @RequestParam(required = false) String name,
                              Model model) {
        //调用分页业务
        User user = null;
        if (username != null || name != null) {
            user = new User();
            user.setUsername(username);
            user.setName(name);

        }
        PageInfo<User> pageInfo = adminService.AllUser(user, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/user";
    }

    //    查询所有普通管理员
    @RequestMapping("/allAdmin")
    public String findAllAdmin(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                               @RequestParam(defaultValue = "5") Integer pageSize,
                               @RequestParam(required = false) String username,
                               @RequestParam(required = false) String name,
                               Model model) {
        //调用分页业务
        User user = null;
        if (username != null || name != null) {
            user = new User();
            user.setUsername(username);
            user.setName(name);

        }
        PageInfo<User> pageInfo = adminService.AllNormalAdmin(user, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/admin";
    }

    //    查询所有用户权限
    @RequestMapping("/authority")
    public String AllUserAuthority(@RequestParam(value = "pn", defaultValue = "1") Integer page,
                                   @RequestParam(defaultValue = "5") Integer pageSize,
                                   @RequestParam(required = false) String username,
                                   @RequestParam(required = false) String name,
                                   Model model) {
        //调用分页业务
        User user = null;
        if (username != null || name != null) {
            user = new User();
            user.setUsername(username);
            user.setName(name);

        }
        PageInfo<User> pageInfo = adminService.AllUserAuthority(user, page, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        return "super/authority";
    }

    //跳转到添加用户页面
    @RequestMapping("/toAddUser")
    public String toaddUser(User user) {
        return "super/addUser";
    }

    /*添加普通用户*/
    @RequestMapping("addUser")
    public String addUser(User user, Model model) {
        Integer integer = adminService.addUser(user);
        model.addAttribute("addUser", integer);
        return "redirect:/admin/allUser";
    }

    /*添加普通管理员*/
    @RequestMapping("addAdmin")
    public String addAdmin(User user, Model model) {
        Integer integer = adminService.addUser(user);
        model.addAttribute("addUser", integer);
        return "redirect:/admin/allAdmin";
    }

    /*添加用户*/
    @RequestMapping("addAuthority")
    public String addUsers(User user, Model model) {
        Integer integer = adminService.addUser(user);
        model.addAttribute("addUser", integer);
        return "redirect:/admin/authority";
    }

    /*查询账号是否存在*/
    @ResponseBody
    @RequestMapping("/findAccount")
    public boolean findAccount(String username) {
        User user = adminService.selectAccount(username);
        if (user != null) {
            return true;
        } else {
            return false;
        }
    }

    /*批量删除用户*/
    @RequestMapping("/delectUser")
    @ResponseBody
    public String deleteUserAll(String userList) {
        try {
            String[] strs = userList.split(",");
            List<Integer> usids = new ArrayList<Integer>();
            for (int i = 0; i < strs.length; i++) {
                usids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(usids);
            adminService.deleteUser(usids);
        } catch (Exception e) {
            System.out.println("删除失败");
            return "error/erruser";
        }
        return "redirect:/admin/allUser";
    }

    /*批量删除普通管理员*/
    @RequestMapping("/delectAdmin")
    @ResponseBody
    public String deleteadmin(String userList) {
        try {
            String[] strs = userList.split(",");
            List<Integer> usids = new ArrayList<Integer>();
            for (int i = 0; i < strs.length; i++) {
                usids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(usids);
            adminService.deleteUser(usids);
        } catch (Exception e) {
            System.out.println("删除失败");
            return "error/erradmin";
        }
        return "redirect:/admin/allAdmin";
    }

    /*批量删除用户权限及所有用户*/
    @RequestMapping("/delectAuth")
    @ResponseBody
    public String deleteAuthority(String userList) {
        try {
            String[] strs = userList.split(",");
            List<Integer> usids = new ArrayList<Integer>();
            for (int i = 0; i < strs.length; i++) {
                usids.add(Integer.parseInt(strs[i]));
            }
            System.out.println(usids);
            adminService.deleteUser(usids);
        } catch (Exception e) {
            System.out.println("删除失败");
            return "error/errauthority";
        }
        return "redirect:/admin/authority";
    }

    /*删除单个用户*/
    @RequestMapping("/delectById")
    public String deleteById(Integer usid, Model model) {
        Integer in = adminService.deleteUserById(usid);
        System.out.println("integer=>" + in);
        model.addAttribute("deleteUser", in);
        if (in > 0) {
            System.out.println("删除成功");
            return "redirect:/admin/allUser";
        } else {
            System.out.println("删除失败");
            return "error/erruser";
        }
    }

    /*删除单个普通管理员*/
    @RequestMapping("/delectAdById")
    public String deleteAdmin(Integer usid) {
        Integer i = adminService.deleteUserById(usid);
        System.out.println("integer=>" + i);
        if (i > 0) {
            System.out.println("删除成功");
            return "redirect:/admin/allAdmin";
        } else {
            System.out.println("删除失败");
            return "error/erradmin";
        }
    }

    /*删除单个用户*/
    @RequestMapping("/delectAuthById")
    public String deleteAuth(Integer usid, Model model) {
        Integer th = adminService.deleteUserById(usid);
        System.out.println("integer=>" + th);
        model.addAttribute("deleteUser", th);
        if (th > 0) {
            System.out.println("删除成功");
            return "redirect:/admin/authority";
        } else {
            System.out.println("删除失败");
            return "error/errauthority";
        }
    }

    @PostMapping("/update")
    public String update(User user) {
        this.adminService.updateUser(user);
        System.out.println("修改成功");
        return "redirect:/admin/allUser";
    }

    @PostMapping("/updateAdmin")
    public String updateAdmin(User user) {
        this.adminService.updateUser(user);
        System.out.println("修改成功");
        return "redirect:/admin/allAdmin";
    }

    @PostMapping("/updateauthority")
    public String updateAuthority(User user) {
        this.adminService.updateAuthority(user);
        System.out.println("修改成功");
        return "redirect:/admin/authority";
    }


    //导出所有用户信息表
    @RequestMapping("/excelUser")
    public void excel(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<User> list = adminService.queryAllUser();
        System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("用户信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("编号");
        titleRow.createCell(1).setCellValue("用户账号");
        titleRow.createCell(2).setCellValue("账号密码");
        titleRow.createCell(3).setCellValue("用户昵称");
        titleRow.createCell(4).setCellValue("性别");
        titleRow.createCell(5).setCellValue("电子邮箱");
        titleRow.createCell(6).setCellValue("联系电话");
        titleRow.createCell(7).setCellValue("账号属性");


        for (User user : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(user.usid);
            dataRow.createCell(1).setCellValue(user.username);
            dataRow.createCell(2).setCellValue(user.password);
            dataRow.createCell(3).setCellValue(user.name);
            dataRow.createCell(4).setCellValue(user.sex);
            dataRow.createCell(5).setCellValue(user.email);
            dataRow.createCell(6).setCellValue(user.phone);
            dataRow.createCell(7).setCellValue(user.permission);


        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("用户信息表".getBytes(), "iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }

    //导出所有普通管理员信息表
    @RequestMapping("/excelAdmin")
    public void exceladmin(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<User> list = adminService.queryAllAdmin();
        System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("普通管理员信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("编号");
        titleRow.createCell(1).setCellValue("用户账号");
        titleRow.createCell(2).setCellValue("账号密码");
        titleRow.createCell(3).setCellValue("用户昵称");
        titleRow.createCell(4).setCellValue("性别");
        titleRow.createCell(5).setCellValue("电子邮箱");
        titleRow.createCell(6).setCellValue("联系电话");
        titleRow.createCell(7).setCellValue("账号属性");


        for (User user : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(user.usid);
            dataRow.createCell(1).setCellValue(user.username);
            dataRow.createCell(2).setCellValue(user.password);
            dataRow.createCell(3).setCellValue(user.name);
            dataRow.createCell(4).setCellValue(user.sex);
            dataRow.createCell(5).setCellValue(user.email);
            dataRow.createCell(6).setCellValue(user.phone);
            dataRow.createCell(7).setCellValue(user.permission);


        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("普通管理员信息表".getBytes(), "iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }

    //导出所有用户信息表
    @RequestMapping("/excelAll")
    public void excelall(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<User> list = adminService.queryAll();
        System.out.println(list);
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("全部用户信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("编号");
        titleRow.createCell(1).setCellValue("用户账号");
        titleRow.createCell(2).setCellValue("账号密码");
        titleRow.createCell(3).setCellValue("用户昵称");
        titleRow.createCell(4).setCellValue("性别");
        titleRow.createCell(5).setCellValue("电子邮箱");
        titleRow.createCell(6).setCellValue("联系电话");
        titleRow.createCell(7).setCellValue("账号属性");


        for (User user : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(user.usid);
            dataRow.createCell(1).setCellValue(user.username);
            dataRow.createCell(2).setCellValue(user.password);
            dataRow.createCell(3).setCellValue(user.name);
            dataRow.createCell(4).setCellValue(user.sex);
            dataRow.createCell(5).setCellValue(user.email);
            dataRow.createCell(6).setCellValue(user.phone);
            dataRow.createCell(7).setCellValue(user.permission);


        }
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("全部用户信息表".getBytes(), "iso-8859-1") + ".xls");
        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }
}
