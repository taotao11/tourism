package com.ssm.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Work;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
public interface WorkService extends IService<Work> {
    /**
     * 查询用户所有的工作记录
     * @param uid
     * @return
     */
    public Page<Work> selectByUid(long uid);
}
