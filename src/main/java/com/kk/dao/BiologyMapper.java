package com.kk.dao;

import com.kk.pogo.Biology;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BiologyMapper {
    // 通过品种查询
    Biology queryBybioName(@Param("Bname") String name);

    //获取所有生物学特征
    List<Biology> getAllBiology();
    /*分页及模糊查询*/
    List<Biology> getAllBiologyPage(Biology biology);
    /*修改生物学特征*/
    int updateBiology(Biology biology);

    /*批量删除生物学特征*/
    void delectBio(List<Integer> agids);
    /*通过id删除生物学特征*/
    int delectOneBio(Integer agid);
}
