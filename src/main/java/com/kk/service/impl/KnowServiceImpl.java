package com.kk.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kk.dao.KnowMapper;
import com.kk.pogo.Know;
import com.kk.pogo.Variety;
import com.kk.service.KnowService;

import java.util.List;

public class KnowServiceImpl implements KnowService {
    private KnowMapper knowMapper;

    public void setKnowMapper(KnowMapper knowMapper) {
        this.knowMapper = knowMapper;
    }

    @Override
    public PageInfo<Know> findAllKnow(Know know, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Know> list= knowMapper.findAllKnow(know);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<Know> findLegumina(Know know, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Know> list= knowMapper.findLegumina(know);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public PageInfo<Know> findCrop(Know know, Integer page, Integer pageSize) {
        //开启分页支持
        PageHelper.startPage(page,pageSize);
        //调用dao层查询
        List<Know> list= knowMapper.findCrop(know);
        //获取分页的相关信息
        PageInfo pageInfo = new PageInfo(list);

        return pageInfo;
    }

    @Override
    public int addKnow(Know know) {
        return knowMapper.addKnow(know);
    }

    @Override
    public void deleteKnows(List<Integer> list) {
        knowMapper.deleteKnows(list);
    }

    @Override
    public int deleteKnow(Integer knid) {
        return knowMapper.deleteKnow(knid);
    }

}
