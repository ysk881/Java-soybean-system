package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Biology;

import java.util.List;

public interface BiologyService {
    /*根据id查询*/
    Biology queryBybioName(String name);

    List<Biology> getAllBiology();

    // 查询所有生物学特征
    PageInfo<Biology> getAllBiologyPage(Biology biology, Integer page, Integer pageSize);

    /*修改生物学特征*/
    int updateBiology(Biology biology);
    /*批量删除生物学特征*/
    void delectBio(List<Integer> agids);
    /*通过id删除生物学特征*/
    int delectOneBio(Integer agid);
}
