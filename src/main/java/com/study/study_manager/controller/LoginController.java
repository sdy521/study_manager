package com.study.study_manager.controller;

import com.study.study_manager.core.JSONResult;
import com.study.study_manager.core.Result;
import com.study.study_manager.dto.PerfactInfoParam;
import com.study.study_manager.dto.UpdatePasswordParam;
import com.study.study_manager.entity.Info;
import com.study.study_manager.entity.User;
import com.study.study_manager.service.InfoService;
import com.study.study_manager.service.InitPasswordService;
import com.study.study_manager.util.SpringSecurity;
import com.study.study_manager.util.UploadFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class LoginController {
    @Resource
    private InitPasswordService initPasswordService;
    @Resource
    private InfoService infoService;
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        return mv;
    }

    @RequestMapping("/initPassword")
    public String initPassword(){
        return "/password";
    }

    @RequestMapping("/updateInitPassword")
    @ResponseBody
    public Result updateInitPassword(@RequestBody UpdatePasswordParam param){
        User user = new User();
        user.setName(param.getUsername());
        user = initPasswordService.selectOne(user);
        if(user!=null){
            BCryptPasswordEncoder bcry = new BCryptPasswordEncoder();
            boolean password = bcry.matches(param.getOldPassword(),user.getPassword());
            if(password){
                if(param.getNewPassword().equals(param.getRepeatNewPassword())){
                    user.setPassword(BCrypt.hashpw(param.getNewPassword(),BCrypt.gensalt()));
                    initPasswordService.updateSelective(user);
                    return new Result(0,"修改成功");
                }else {
                    return new Result(405,"两次密码输入不一致");
                }
            }else{
                return new Result(406,"旧密码输入错误");
            }
        }else {
            return new Result(407,"用户不存在");
        }
    }

    @RequestMapping("/perfectInfo")
    @ResponseBody
    public Result perfectInfo(@RequestBody PerfactInfoParam param){
        User user = new User();
        user.setName(param.getUsername());
        user = initPasswordService.selectOne(user);
        if(user!=null){
            BCryptPasswordEncoder bcry = new BCryptPasswordEncoder();
            boolean password = bcry.matches(param.getOldPassword(),user.getPassword());
            if(password){
                if(param.getNewPassword().equals(param.getRepeatNewPassword())){
                    user.setPassword(BCrypt.hashpw(param.getNewPassword(),BCrypt.gensalt()));
                    Integer userid = initPasswordService.updateSelective(user);
                    Info info = new Info();
                    info.setUserid(userid);
                    info.setDeleted(false);
                    List<Info> list = infoService.select(info);
                    if(list!=null&&list.size()>0){
                        info.setId(list.get(0).getId());
                        info.setAddress(param.getAddress());
                        info.setPhone(param.getPhone());
                        info.setSex(param.getSex());
                        info.setAge(param.getAge());
                        infoService.updateSelective(info);
                    }else {
                        info.setAddress(param.getAddress());
                        info.setPhone(param.getPhone());
                        info.setSex(param.getSex());
                        infoService.insert(info);
                    }
                    return new Result(0,"修改成功");
                }else {
                    return new Result(405,"两次密码输入不一致");
                }
            }else{
                return new Result(406,"旧密码输入错误");
            }
        }else {
            return new Result(407,"用户不存在");
        }
    }

    @RequestMapping("/leftmodal")
    @ResponseBody
    public Result leftmodal(){
        User user = new User();
        user.setId(SpringSecurity.getSysUser().getId());
        user = initPasswordService.selectOne(user);
        return new JSONResult(user);
    }
    @RequestMapping("/leftupdate")
    @ResponseBody
    public Result leftupdate(@RequestParam Integer id,@RequestParam String name){
        User user = new User();
        user.setId(id);
        user.setName(name);
        initPasswordService.updateSelective(user);
        return new Result(0,"更新成功");
    }

    @RequestMapping("/upload")
    @ResponseBody
    public void upload(@RequestParam("file")MultipartFile uploadimg){
        String imgPath = UploadFile.uploadImg(uploadimg);
        Integer userid = SpringSecurity.getSysUser().getId();
        User user = new User();
        user.setId(userid);
        user.setImg(imgPath);
        initPasswordService.updateSelective(user);
    }
}
