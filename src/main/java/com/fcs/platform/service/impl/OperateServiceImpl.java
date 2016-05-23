package com.fcs.platform.service.impl;

import com.fcs.platform.mapper.OperateMapper;
import com.fcs.platform.model.OperRecord;
import com.fcs.platform.service.OperateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Lucare.Feng on 2016/5/23.
 */
@Service("operateService")
public class OperateServiceImpl implements OperateService {

    @Autowired
    private OperateMapper operateMapper;

    public int insert(OperRecord operRecord) {
        return operateMapper.insert(operRecord);
    }
}
