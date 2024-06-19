package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.PhytologyMapper;
import com.kk.pogo.Phytology;
import com.kk.service.PhytologyService;

import java.util.List;

public class PhytologyServiceImpl implements PhytologyService {
    private PhytologyMapper phytologyMapper;

    public void setPhytologyMapper(PhytologyMapper phytologyMapper) {
        this.phytologyMapper = phytologyMapper;
    }

    @Override
    public Phytology queryVarietyById(Integer agid) {
        return phytologyMapper.queryVarietyById(agid);
    }

    @Override
    public List<Phytology> getAllPhytology() {
        return phytologyMapper.getAllPhytology();
    }

    // 查询所有植物学特征
    @Override
    public PageInfo<Phytology> getAllPhytologyPage(Phytology phytology, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<Phytology> list = phytologyMapper.getAllPhytologyPage(phytology);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }
/**/

    @Override
    public int updatePhytology(Phytology phytology) {
        return phytologyMapper.updatePhytology(phytology);
    }

    @Override
    public void delectPhy(List<Integer> list) {
        phytologyMapper.delectPhy(list);
    }
    @Override
    public int delectOnePhy(Integer agid) {
        return phytologyMapper.delectOnePhy(agid);
    }
}
