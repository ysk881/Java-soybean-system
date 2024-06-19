package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Phytology;

import java.util.List;

public interface PhytologyService{
    // 通过id查询品种详情
    Phytology queryVarietyById(Integer agid);

    List<Phytology> getAllPhytology();
    // 查询所有植物学特征
    PageInfo<Phytology> getAllPhytologyPage(Phytology phytology, Integer page, Integer pageSize);

    /*修改植物学特征*/
    int updatePhytology(Phytology phytology);
    /*根据id删除植物学特征*/
    void delectPhy(List<Integer> list);
    /*通过id删除生物学特征*/
    int delectOnePhy(Integer agid);
}
