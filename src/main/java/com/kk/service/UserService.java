package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.*;

import java.util.List;

public interface UserService {
    //登录
    User login(String username, String password);

    //用户注册，如果用户名已存在，则需要重新注册一个新的用户名（用户名不可以重复）
    public int register(User user);

    //判断用户名是否存在，返回true表示用户名已存在，返回false表示用户名可用
    User queryUserName(String username);

    /*修改登录密码*/
    int updateinfo(User user);

    /*查看全部品种*/
    PageInfo<Variety> AllVariety(Variety variety, Integer page, Integer pageSize);

    // 通过品种ID查询
    Variety queryVarById(Integer id);

    /*查看全部豆类科普知识*/
    List<Know> AllLagum(Know know);
    /*根据科普id查询详细信息*/
    Know KnowById(Integer knid);
    /*查看全部农作物科普知识*/
    List<Know> AllCrop(Know know);

    /* 查看所有抗病毒性*/
    PageInfo<Variety> AllIllness(Variety variety, Integer page, Integer pageSize);

    /* 查看所有品种来源*/
    PageInfo<Variety> AllSource(Variety variety, Integer page, Integer pageSize);

    /* 查看所有适宜区域*/
    PageInfo<Variety> AllArea(Variety variety, Integer page, Integer pageSize);

    /*查询所有植物学特征*/
    PageInfo<Phytology> AllPhytology(Phytology phytology, Integer page, Integer pageSize);

    /*查询所有生物学特征*/
    PageInfo<Biology> AllBiology(Biology biology, Integer page, Integer pageSize);

    /*查询所有品质性状*/
    PageInfo<Quality> AllQuality(Quality quality, Integer page, Integer pageSize);

    // 通过品种ID查询
    Variety queryPhyByNa(String name);
}
