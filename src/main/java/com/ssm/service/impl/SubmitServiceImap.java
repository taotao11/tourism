package com.ssm.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Submit;
import com.ssm.mapper.SubmitMapper;
import com.ssm.service.SubmitService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
@Service
public class SubmitServiceImap extends ServiceImpl<SubmitMapper, Submit> implements SubmitService {

    @Override
    public Page<Submit> selectByUid(long uid) {
        return null;
    }
}
