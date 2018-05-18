package com.ssm.controller;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssm.entity.Admin;
import com.ssm.entity.Levea;
import com.ssm.entity.Suggest;
import com.ssm.entity.User;
import com.ssm.service.AdminService;
import com.ssm.service.LeveaService;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * <p>
 *  前端控制器 -- 请假控制
 * </p>
 *
 * @author 
 * @since 2018-05-17
 */
@Controller
@RequestMapping("/levea")
public class LeveaController {
    @Autowired
    private LeveaService leveaService;

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    /**
     *
     * 添加请假
     * @param levea
     * @return
     */
    @RequestMapping("/addL")
    public ModelAndView addLevea(Levea levea,String time){

        ModelAndView mv = new ModelAndView();
        if (levea.getUid() == null || levea.getUid() == 0){
            mv.setViewName("html/jie/add");
            mv.addObject("error","请先登录!!!");
            return mv;
        }
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            levea.setCreateTime(format.parse(time));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        levea.setType(0);
        boolean insert = leveaService.insert(levea);
        if (insert){
            mv.setViewName("html/jie/add");
            mv.addObject("success","添加请假成功!!!");
        }else {
            mv.setViewName("html/jie/add");
            mv.addObject("error","添加请假失败!!!");
        }
        return mv;
    }

    /**
     *所有员工请假查询
     * @param stu
     * @return
     */
    @RequestMapping("/selectByStu/{stu}")
    public ModelAndView selectByStu(@PathVariable("stu")int stu, int current){
        ModelAndView mv = new ModelAndView();
        Page<Levea> page = null;
        if (stu == 0){
            page = leveaService.selectPage(new Page<Levea>(current,10),new EntityWrapper<Levea>()
                    .eq("type",stu));
        }else {
            page = leveaService.selectPage(new Page<Levea>(current,10),new EntityWrapper<Levea>()
                    .gt("type",0));
        }
        //循环获得姓名
        for (int i = 0; i < page.getRecords().size(); i++){
            getName(page.getRecords().get(i));
        }
        mv.setViewName("html/web/levea");
        mv.addObject("page",page);
        mv.addObject("stu",stu);
        return mv;
    }

    /**
     * 请假回复
     * @param levea
     * @return
     */
    @RequestMapping("/update")
    public ModelAndView update(Levea levea){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("html/web/levea");
        if (levea.getAid() == null || levea.getAid() == 0){
            mv.addObject("error","修改失败!!!");
            return mv;
        }
        boolean update = leveaService.updateById(levea);

        if (update){
            mv.addObject("success","修改成功!!!");
        }else {
            mv.addObject("error","修改失败!!!");
        }
        return mv;
    }

    /**
     * 设置用户姓名
     * @param levea
     */
    public void getName(Levea levea){
        User user = userService.selectById(levea.getUid());
        levea.setuName(user.getName());
        if (levea.getAid() != null){
            Admin admin = adminService.selectById(levea.getAid());
            levea.setaName(admin.getName());
        }
    }
}

