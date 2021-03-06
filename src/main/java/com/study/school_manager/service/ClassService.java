package com.study.school_manager.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.school_manager.core.BaseDao;
import com.study.school_manager.core.BaseService;
import com.study.school_manager.dao.ClassDao;
import com.study.school_manager.dto.ClassParam;
import com.study.school_manager.entity.Class;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ClassService extends BaseService<Class> {
    @Resource
    private ClassDao classDao;
    @Override
    protected BaseDao<Class> getDao() {
        return classDao;
    }

    public PageInfo<Map> selectByPage(ClassParam param){
        PageHelper.startPage(param.getPage(),param.getRows());
        List<Map> list = classDao.selectByPage(param.getName(),param.getDeleted());
        return new PageInfo<Map>(list);
    }

    /***
     * 获取一个班级
     * @param id
     * @return
     */
    public Class selectOneById(Integer id){
        return classDao.selectOneById(id);
    }
}
