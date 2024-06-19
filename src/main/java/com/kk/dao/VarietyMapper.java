package com.kk.dao;

import com.kk.pogo.Variety;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VarietyMapper {
    // 通过品种查询
    Variety queryVarietyByname(@Param("Vname") String name);

    /*  <!--通过品种名查询品品种是否已存在-->*/
    Variety findName(@Param("VName")String name);

    // 添加品种
    int addVariety(Variety variety);

    //  批量删除品种
    void deleteVariety(List<Integer> ids);
    /*通过id删除单个品种*/
    int deleteVarietyById(Integer id);

    // 修改品种
    int updateVariety(Variety variety);
    // 修改品种图片
    int updateImg(Variety variety);

    // 查询所有品种
    List<Variety> queryAllVariety();

    //通过品种名查询品种
    /*分页查询*/
    List<Variety> VarietyPage(Variety variety);

}
