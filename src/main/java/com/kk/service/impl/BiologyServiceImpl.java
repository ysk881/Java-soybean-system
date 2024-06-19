package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.BiologyMapper;
import com.kk.pogo.Biology;
import com.kk.service.BiologyService;

import java.util.List;

public class BiologyServiceImpl implements BiologyService {
    private BiologyMapper biologyMapper;

    public void setBiologyMapper(BiologyMapper biologyMapper) {
        this.biologyMapper = biologyMapper;
    }

    @Override
    public Biology queryBybioName(String name) {
        return biologyMapper.queryBybioName(name);
    }

    @Override
    public List<Biology> getAllBiology() {
        return biologyMapper.getAllBiology();
    }

    // 查询所有生物学特征
    @Override
    public PageInfo<Biology> getAllBiologyPage(Biology biology, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<Biology> list = biologyMapper.getAllBiologyPage(biology);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    /*修改生物学特征*/
    @Override
    public int updateBiology(Biology biology) {
        return biologyMapper.updateBiology(biology);
    }

    @Override
    public void delectBio(List<Integer> agids) {
        biologyMapper.delectBio(agids);
    }

    @Override
    public int delectOneBio(Integer agid) {
        return biologyMapper.delectOneBio(agid);
    }


}
