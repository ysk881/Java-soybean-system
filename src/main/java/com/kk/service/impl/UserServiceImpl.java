package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.UserMapper;
import com.kk.pogo.*;
import com.kk.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


    /*用户登录*/
    @Override
    public User login(String username, String password) {
        return userMapper.login(username, password);
    }

    /*用户注册*/
    @Override
    public int register(User user) {
        return userMapper.register(user);

    }

    /*判断账号是否存在*/
    @Override
    public User queryUserName(String username) {
        return userMapper.queryUserName(username);
    }


    @Override
    public int updateinfo(User user) {
        return userMapper.updateinfo(user);
    }

    @Override
    public PageInfo<Variety> AllVariety(Variety variety, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Variety> list= userMapper.AllVariety(variety);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public Variety queryVarById(Integer id) {
        return userMapper.queryVarById(id);
    }

    @Override
    public List<Know> AllLagum(Know know) {
        return userMapper.AllLagum(know);
    }

    @Override
    public Know KnowById(Integer knid) {
        return userMapper.KnowById(knid);
    }

    @Override
    public List<Know> AllCrop(Know know) {
        return userMapper.AllCrop(know);
    }


    @Override
    public PageInfo<Variety> AllIllness(Variety variety, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Variety> list= userMapper.AllIllness(variety);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<Variety> AllSource(Variety variety, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Variety> list= userMapper.AllSource(variety);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<Variety> AllArea(Variety variety, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Variety> list= userMapper.AllArea(variety);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<Phytology> AllPhytology(Phytology phytology, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Phytology> list= userMapper.AllPhytology(phytology);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }
    @Override
    public PageInfo<Biology> AllBiology(Biology biology, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Biology> list= userMapper.AllBiology(biology);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }
    @Override
    public PageInfo<Quality> AllQuality(Quality quality, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Quality> list= userMapper.AllQuality(quality);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }
    @Override
    public Variety queryPhyByNa(String name) {
        return userMapper.queryPhyByNa(name);
    }


}
