package com.fcs.platform.service.impl;

import com.fcs.platform.mapper.SuperMapper;

/**
 * Created by Lucare.Feng on 2016/5/24.
 */
public class BaseServiceImpl<M extends SuperMapper<T>,T> extends ServiceImpl<M,T,String> {
}
