package com.ssm.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Submit;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
public interface SubmitService extends IService<Submit> {
    /**
     * 查询员工所有的报销
     * @param uid
     * @return
     */
    public Page<Submit> selectByUid(long uid);
}
