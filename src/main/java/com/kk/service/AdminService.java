package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.form.AdminForm;
import com.kk.pogo.Account;
import com.kk.pogo.Admin;
import com.kk.pogo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {
    //管理员登录
    /*Admin adminLogin(String adname, String admpass);*/
    public Account adminLogin(AdminForm adminForm);
    /*修改管理员信息*/
    int updateNorPwd(User user);
    /*修改管理员登录密码*/
    int updateAdminPwd(Admin admin);
    //查询全部用户
    PageInfo<User> AllUser(User user, Integer page, Integer pageSize);
    /*查询全部普通管理员*/
    PageInfo<User> AllNormalAdmin(User user, Integer page, Integer pageSize);
    /*查询全部用户权限*/
    PageInfo<User> AllUserAuthority(User user, Integer page, Integer pageSize);
    //添加用户
    int addUser(User user);
    //根据账号查询是否已存在该用户
    User selectAccount(@Param("account")String username);
    //    根据id删除用户
    void deleteUser(List<Integer> list);
    /*修改用户信息*/
    int updateUser(User user);
    /*修改账号权限*/
    int updateAuthority(User user);
    /*通过id删除用户*/
    int deleteUserById(Integer usid);
    /*导出所有用户信息*/
    List<User> queryAllUser();
    /*导出所有普通管理员信息*/
    List<User> queryAllAdmin();
    /*导出所有用户信息*/
    List<User> queryAll();
}
