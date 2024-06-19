package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Quality;

import java.util.List;

public interface QualityService {
    /*根据品种查询*/
    Quality queryByQname(String name);

    List<Quality> getAllQuality();

    // 查询所有品质性状
    PageInfo<Quality> getAllQualityPage(Quality quality, Integer page, Integer pageSize);

    /*修改品质性状*/
    int updateQuality(Quality quality);
    /*批量删除品质性状*/
    void delectQua(List<Integer> agids);
    /*通过id删除单个品质性状*/
    int delectOneQua(Integer agid);
}
