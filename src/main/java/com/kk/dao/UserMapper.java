package com.kk.dao;

import com.kk.pogo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    //登录
    User login(@Param("username") String username, @Param("password") String password);

    //注册
    int register(User user);

    //根据用户名查询用户信息
    User queryUserName(@Param("username") String username);

    /*修改登录密码*/
    int updateinfo(User user);

    /*查看全部品种*/
    List<Variety> AllVariety(Variety variety);

    /* 查看所有抗病毒性*/
    List<Variety> AllIllness(Variety variety);

    /* 查看所有品种来源*/
    List<Variety> AllSource(Variety variety);
    /* 查看所有适宜区域*/
    List<Variety> AllArea(Variety variety);
    // 通过品种ID查询
    Variety queryVarById(Integer id);

    /*查看全部豆类科普知识*/
    List<Know> AllLagum(Know know);

    /*根据科普id查询详细信息*/
    Know KnowById(Integer knid);

    /*查看全部农作物科普知识*/
    List<Know> AllCrop(Know know);

    /*查询所有植物学特征*/
    List<Phytology> AllPhytology(Phytology phytology);

    /*查询所有生物学特征*/
    List<Biology> AllBiology(Biology biology);

    /*查询所有品质性状*/
    List<Quality> AllQuality(Quality quality);

    // 通过品种ID查询
    Variety queryPhyByNa(String name);
}
