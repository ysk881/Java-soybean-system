package com.kk.dao;

import com.kk.pogo.Phytology;

import java.util.List;

public interface PhytologyMapper {
    // 通过id查询品种详情
    Phytology queryVarietyById(Integer agid);

    /*查询全部导出数据*/
    List<Phytology> getAllPhytology();
    //获取所有植物学特征
    List<Phytology> getAllPhytologyPage(Phytology phytology);
    /*修改生物学特征*/
    int updatePhytology(Phytology phytology);
    /*删除生物学特征*/
    void delectPhy(List<Integer> agids);
    /*通过id删除生物学特征*/
    int delectOnePhy(Integer agid);
}
