package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.VarietyMapper;
import com.kk.pogo.Variety;
import com.kk.service.VarietyService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VarietyServiceImpl implements VarietyService {
    private VarietyMapper varietyMapper;

    // 设置VarietyDao
    public void setVarietyMapper(VarietyMapper varietyMapper) {
        this.varietyMapper = varietyMapper;
    }

    // 添加品种
    @Override
    public int addVariety(Variety variety) {
        Integer i = varietyMapper.addVariety(variety);
        return i;
    }

    @Override
    public Variety findName(String name) {
        return varietyMapper.findName(name);
    }

    @Override
    public void deleteVariety(List<Integer> list) {
        varietyMapper.deleteVariety(list);
    }

    @Override
    public int deleteVarietyById(Integer id) {
        return varietyMapper.deleteVarietyById(id);
    }


    // 更新品种
    @Override
    public int updateVariety(Variety variety) {
        return varietyMapper.updateVariety(variety);
    }
    // 修改品种图片
    @Override
    public int updateImg(Variety variety) {
        return varietyMapper.updateImg(variety);
    }

    // 根据id查询品种
    @Override
    public Variety queryVarietyByname(String name) {
        return varietyMapper.queryVarietyByname(name);
    }

    // 查询所有品种
    @Override
    public List<Variety> queryAllVariety() {
        return varietyMapper.queryAllVariety();
    }


    @Override
    public PageInfo<Variety> VarietyPage(Variety variety, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<Variety> list = varietyMapper.VarietyPage(variety);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

}
