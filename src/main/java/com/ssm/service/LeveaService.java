package com.ssm.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Levea;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
public interface LeveaService extends IService<Levea> {
    /**
     * 查询员工所有的请假
     * 查询员工所有的请假
     * @param uid
     * @return
     */
    public Page<Levea> selectByUid(long uid);
}
