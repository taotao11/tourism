package com.ssm.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Suggest;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
public interface SuggestService extends IService<Suggest> {
    /**
     * 查询员工所有的建议
     * @param uid
     * @return
     */
    public Page<Suggest> selectByUid(long uid);
}
