package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.QualityMapper;
import com.kk.pogo.Quality;
import com.kk.service.QualityService;

import java.util.List;

public class QualityServiceImpl implements QualityService {
    private QualityMapper qualityMapper;

    public void setQualityMapper(QualityMapper qualityMapper) {
        this.qualityMapper = qualityMapper;
    }

    @Override
    public Quality queryByQname(String name) {
        return qualityMapper.queryByQname(name);
    }

    @Override
    public List<Quality> getAllQuality() {
        return qualityMapper.getAllQuality();
    }

    // 查询所有品质性状
    @Override
    public PageInfo<Quality> getAllQualityPage(Quality quality, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page, pageSize);
        //调用dao层查询
        List<Quality> list = qualityMapper.getAllQualityPage(quality);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }


    /*修改品质性状*/
    @Override
    public int updateQuality(Quality quality) {
        return qualityMapper.updateQuality(quality);
    }

    @Override
    public void delectQua(List<Integer> agids) {
        qualityMapper.delectQua(agids);
    }

    @Override
    public int delectOneQua(Integer agid) {
        return qualityMapper.delectOneQua(agid);
    }
}

