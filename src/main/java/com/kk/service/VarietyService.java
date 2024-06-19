package com.kk.service;

import com.github.pagehelper.PageInfo;
import com.kk.pogo.Variety;

import java.util.List;

public interface VarietyService {
    //  添加品种
    int addVariety(Variety variety);

    /*     通过品种名查询品品种是否已存在*/
    Variety findName(String name);

    //  批量删除品种
    void deleteVariety(List<Integer> list);
    /*通过id删除单个品种*/
    int deleteVarietyById(Integer id);
    //  更新品种
    int updateVariety(Variety variety);
    // 修改品种图片
    int updateImg(Variety variety);

    //  根据id查询品种
    Variety queryVarietyByname(String name);

    //  查询所有品种
    List<Variety> queryAllVariety();
    // 分页查询
    PageInfo<Variety> VarietyPage(Variety variety, Integer page, Integer pageSize);
}
