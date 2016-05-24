package com.fcs.platform.service.impl;

import com.fcs.platform.mapper.BaseMapper;
import com.fcs.platform.mapper.SuperMapper;
import com.fcs.platform.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/5/24.
 */
public class ServiceImpl<M extends BaseMapper<T,I>, T, I> implements BaseService<T,I>{

    @Autowired
    protected M baseMapper;

    public int insert(T t) {
        return baseMapper.insert(t);
    }

    public int deleteById(I id) {
        return baseMapper.deleteById(id);
    }

    public int update(T t) {
        return baseMapper.update(t);
    }

    public T selectById(I id) {
        return baseMapper.selectById(id);
    }

    public List<T> selectList() {
        return baseMapper.selectList();
    }
}
