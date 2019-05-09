package com.study.study_manager.core.log;

import com.study.study_manager.dao.OperationLogDao;
import com.study.study_manager.util.SpringBeanTool;

/**
 * @author sdy
 * @date 2019/5/9 17:13
 */
public class LogFactory {

    private static OperationLogDao operationLogDao = SpringBeanTool.getBean(OperationLogDao.class);

    public static Runnable operationlog(String name,String method,String username){
        return () ->{
            operationLogDao.insert(name,method,username);
        };
    }
}
