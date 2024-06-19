package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.AdminMapper;
import com.kk.form.AdminForm;
import com.kk.pogo.Account;
import com.kk.pogo.Admin;
import com.kk.pogo.User;
import com.kk.service.AdminService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    /*管理员登录*/
/*    @Override
    public Admin adminLogin(String adname, String admpass) {

        return adminMapper.adminLogin(adname, admpass);
    }*/


    @Override
    public Account adminLogin(AdminForm adminForm) {
        Account acc = new Account<>();
        /*判断用户类型*/
        switch (adminForm.getType()) {
            case "Admin":
                Admin admin = this.adminMapper.findByAdname(adminForm.getUsername());
                /*判断用户名是否正确*/
                if (admin == null) {
                    acc.setCode(-1);
                } else {
                    /*判断密码是否正确*/
                    if (!admin.getPassword().equals(adminForm.getPassword())) {
                        acc.setCode(-2);
                    } else {
                        acc.setCode(0);
                        acc.setAdmin(admin);
                    }

                }
                break;
            case "User":
                User user = this.adminMapper.findByname(adminForm.getUsername());
                /*判断用户名是否正确*/
                if (user == null) {
                    acc.setCode(-1);
                } else {
                    /*判断密码是否正确*/
                    if (!user.getPassword().equals(adminForm.getPassword())) {
                        acc.setCode(-2);
                    } else {
                        acc.setCode(0);
                        acc.setAdmin(user);
                    }

                }
                break;
        }
        return acc;
    }

    @Override
    public int updateNorPwd(User user) {
        return adminMapper.updateNorPwd(user);
    }



    @Override
    public int updateAdminPwd(Admin admin) {
        return adminMapper.updateAdminPwd(admin);
    }


    @Override
    public PageInfo<User> AllUser(User user, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<User> list = adminMapper.AllUser(user);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<User> AllNormalAdmin(User user, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<User> list = adminMapper.AllNormalAdmin(user);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<User> AllUserAuthority(User user, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<User> list = adminMapper.AllUserAuthority(user);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    /*添加用户*/
    @Override
    public int addUser(User user) {
        return adminMapper.addUser(user);
    }

    /*判断账号是否存在*/
    @Override
    public User selectAccount(String username) {
        return adminMapper.selectAccount(username);
    }

    /*批量删除用户*/
    @Override
    public void deleteUser(List<Integer> list) {
        adminMapper.deleteUser(list);
    }

    @Override
    public int updateUser(User user) {
        return adminMapper.updateUser(user);
    }

    @Override
    public int updateAuthority(User user) {
        return adminMapper.updateAuthority(user);
    }

    @Override
    public int deleteUserById(Integer usid) {
        return adminMapper.deleteUserById(usid);
    }

    @Override
    public List<User> queryAllUser() {
        return adminMapper.queryAllUser();
    }

    @Override
    public List<User> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }

    @Override
    public List<User> queryAll() {
        return adminMapper.queryAll();
    }
}
