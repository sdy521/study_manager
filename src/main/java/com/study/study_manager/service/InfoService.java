package com.study.study_manager.service;

import com.study.study_manager.core.BaseDao;
import com.study.study_manager.core.BaseService;
import com.study.study_manager.dao.InfoDao;
import com.study.study_manager.entity.Info;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class InfoService extends BaseService<Info> {
    @Resource
    private InfoDao infoDao;
    @Override
    protected BaseDao<Info> getDao() {
        return infoDao;
    }
}