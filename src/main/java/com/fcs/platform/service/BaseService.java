package com.fcs.platform.service;

import java.util.List;

/**
 * Created by Lucare.Feng on 2016/5/24.
 */
public interface BaseService<T,I> {

    int insert(T t);

    int deleteById(I id);

    int update(T t);

    T selectById(I id);

    List<T> selectList();
}
