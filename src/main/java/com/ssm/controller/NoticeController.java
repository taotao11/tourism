package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Notice;
import com.ssm.service.NoticeService;
import org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * <p>
 *  前端控制器 -- 公告
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    /**
     * 添加公告
     * @param notice
     * @return
     */
    @RequestMapping("/add")
    public ModelAndView addNotic(Notice notice){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/add");

        if (notice.getAid() == null||notice.getAid() == 0){
            mv.addObject("error","请先登录!!");
            return mv;
        }
        notice.setCreatTime(new Date());
        boolean insert = noticeService.insert(notice);

        if (insert){
            mv.addObject("success","添加公告成功!!!");
        }else {
            mv.addObject("error","添加公告失败!!!");
        }
        return mv;
    }

    /**
     * 管理员查询公告
     * @param current
     * @return
     */
    @RequestMapping("/selectAll")
    public ModelAndView selectAllByAdmin(int current){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/notice");
        Page<Notice> page = noticeService.selectPage(new Page<Notice>(current,10),new EntityWrapper<Notice>());
        mv.addObject("page",page);
        return mv;
    }

    /**
     * 删除公告
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    public ModelAndView delete(long id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/notice");
        boolean delete = noticeService.deleteById(id);
        if (delete){
            mv.addObject("success","删除公告成功!!");
        }else {
            mv.addObject("error","删除公告失败!!！");
        }
        return mv;
    }

    /**
     * 公告修改页转
     * @param id
     * @return
     */
    @RequestMapping("/set")
    public ModelAndView set(long id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/nupdate");
        Notice notice = noticeService.selectById(id);
        mv.addObject("obj",notice);
        return mv;
    }

    /**
     * 修改公告
     * @param notice
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Notice notice){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/nupdate");
        boolean update = noticeService.updateById(notice);

        if (update){
            mv.addObject("success","修改公告成功!!");
        }else {
            mv.addObject("error","修改公告失败!!!");
        }
        return mv;
    }

    /**
     * 查看公告
     * @param id
     * @return
     */
    @RequestMapping("/select")
    public ModelAndView select(long id){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/jie/notice");
        Notice notice = noticeService.selectById(id);
        mv.addObject("notice",notice);
        return mv;
    }
}

