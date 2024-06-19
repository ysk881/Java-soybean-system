package com.kk.dao;

import com.kk.pogo.Know;

import java.util.List;

public interface KnowMapper {
    /*查看全部科普信息*/
    List<Know> findAllKnow(Know know);
    /*查看全部豆类科普信息*/
    List<Know> findLegumina(Know know);
    /*查看全部农作物科普信息*/
    List<Know> findCrop(Know know);
    /*添加科普信息*/
    int addKnow(Know know);
    /*通过id批量删除*/
    void deleteKnows(List<Integer> knids);
    /*通过id删除*/
    int deleteKnow(Integer knid);
}
