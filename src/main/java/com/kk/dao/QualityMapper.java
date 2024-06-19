package com.kk.dao;

import com.kk.pogo.Quality;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QualityMapper {
    // 通过品种名查询
    Quality queryByQname(@Param("Qname") String name);

    //获取所有品质性状
    List<Quality> getAllQuality();

    //查询所有品质性状分页
    List<Quality> getAllQualityPage(Quality quality);

    /*修改品质性质*/
    int updateQuality(Quality quality);

    /*批量删除品质性状*/
    void delectQua(List<Integer> agids);

    /*删除单个品质性状*/
    int delectOneQua(Integer agid);

}
