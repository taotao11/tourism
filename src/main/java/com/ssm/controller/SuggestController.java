package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Admin;
import com.ssm.entity.Suggest;
import com.ssm.entity.User;
import com.ssm.entity.Work;
import com.ssm.service.AdminService;
import com.ssm.service.SuggestService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器 --添加员工建议
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
@Controller
@RequestMapping("/suggest")
public class SuggestController {
    @Autowired
    private SuggestService suggestService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    /**
     * 添加建议
     * @param suggest
     * @return
     */
    @RequestMapping("/addSug")
    public ModelAndView addSug(Suggest suggest){
        ModelAndView mv = new ModelAndView();
        if (suggest.getUid() == null || suggest.getUid() == 0){

            mv.addObject("error","请先登录!!");
            mv.setViewName("html/jie/add");
            return mv;
        }
        suggest.setStuats(0);
        suggest.setCreateTime(new Date());
        boolean insert = suggestService.insert(suggest);
        if (insert){

            mv.addObject("success","添加建议成功!!!");
        }else {
            mv.addObject("error","添加建议失败!!!");
        }
        mv.setViewName("html/jie/add");
        return mv;
    }

    /**
     *所有员工建议查询
     * @param stu
     * @return
     */
    @RequestMapping("/selectByStu/{stu}")
    public ModelAndView selectByStu(@PathVariable("stu")int stu, int current){
        ModelAndView mv = new ModelAndView();
        Page<Suggest> page = suggestService.selectPage(new Page<Suggest>(current,10),new EntityWrapper<Suggest>()
                .eq("stuats",stu));
        //循环获得姓名
        for (int i = 0; i < page.getRecords().size(); i++){
            getName(page.getRecords().get(i));
        }
        mv.setViewName("html/web/suggest");
        mv.addObject("page",page);
        mv.addObject("stu",stu);
        return mv;
    }

    /**
     * 工作回复
     * @param suggest
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Suggest suggest){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/suggest");
        if (suggest.getAid() == null || suggest.getAid() == 0){
            mv.addObject("error","修改失败!!!");
            return mv;
        }
        suggest.setStuats(1);
        suggest.setUpdateTime(new Date());
        boolean update = suggestService.updateById(suggest);

        if (update){
            mv.addObject("success","修改成功!!!");
        }else {
            mv.addObject("error","修改失败!!!");
        }
        return mv;
    }

    /**
     * 设置用户姓名
     * @param suggest
     */
    public void getName(Suggest suggest){
        User user = userService.selectById(suggest.getUid());
        suggest.setuName(user.getName());
        if (suggest.getAid() != null){
            Admin admin = adminService.selectById(suggest.getAid());
            suggest.setaName(admin.getName());
        }
    }
}

