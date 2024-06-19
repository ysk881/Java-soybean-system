package com.kk.dao;

import com.kk.pogo.Admin;
import com.kk.pogo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
/*    //管理员登录
    Admin adminLogin(@Param("adminname") String adname, @Param("password") String password);*/
    Admin findByAdname(String username);

    /*修改管理员信息*/
    int updateNorPwd(User user);
    /*修改管理员登录密码*/
    int updateAdminPwd(Admin admin);

    User  findByname(String username);
    /*查询全部用户*/
    List<User> AllUser(User user);
    /*查询全部普通管理员*/
    List<User> AllNormalAdmin(User user);
    /*查询全部用户权限*/
    List<User> AllUserAuthority(User user);
    //添加用户
    int addUser(User user);
    //根据账号查询是否已存在该用户
    User selectAccount(@Param("account")String username);
    /*通过id批量删除用户*/
    void deleteUser(List<Integer> usids);
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
