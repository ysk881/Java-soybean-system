package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Know;

import java.util.List;

public interface KnowService {
    /*查看全部科普信息*/
    PageInfo<Know> findAllKnow(Know know,Integer page,Integer pageSize);
    /*查看全部豆类科普信息*/
    PageInfo<Know> findLegumina(Know know,Integer page,Integer pageSize);
    /*查看全部农作物科普信息*/
    PageInfo<Know> findCrop(Know know,Integer page,Integer pageSize);
    /*添加科普信息*/
    int addKnow(Know know);
    /*通过id批量删除*/
    void deleteKnows(List<Integer> list);
    /*通过id删除*/
    int deleteKnow(Integer knid);
}
