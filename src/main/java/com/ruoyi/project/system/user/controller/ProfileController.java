package com.ruoyi.project.system.user.controller;

import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.Message;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.IUserService;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 个人信息
 * @author ZhangSx
 */
@Controller
@RequestMapping("/system/user/profile")
public class ProfileController extends BaseController {

    private String prefix = "/system/user/profile";

    @Autowired
    private IUserService userService;

    @GetMapping()
    public String profile(Model model) {
        User user = getUser();
        String gender = user.getGender();
        if ("0".equals(gender)) {
            user.setGender("性别: 男");
        } else if ("1".equals(gender)) {
            user.setGender("性别: 女");
        }
        String roleGroup = userService.selectUserRoleGroup(user.getUserId());
        String postGroup = userService.selectUserPostGroup(user.getUserId());
        model.addAttribute("user", user);
        model.addAttribute("roleGroup", roleGroup);
        model.addAttribute("postGroup", postGroup);
        return prefix + "/profile";
    }

    @RequestMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(String password)
    {
        User user = getUser();
        String encrypt = new Md5Hash(user.getLoginName() + password + user.getSalt()).toHex().toString();
        if (user.getPassword().equals(encrypt))
        {
            return true;
        }
        return false;
    }

    @Log(title = "系统管理", action = "个人信息-重置密码")
    @GetMapping("/resetPwd/{userId}")
    public String resetPwd(@PathVariable("userId") Long userId, Model model)
    {
        User user = userService.selectUserById(userId);
        model.addAttribute("user", user);
        return prefix + "/resetPwd";
    }

    @Log(title = "系统管理", action = "个人信息-重置密码")
    @PostMapping("/resetPwd")
    @ResponseBody
    public Message resetPwd(User user)
    {
        int rows = userService.resetUserPwd(user);
        if (rows > 0)
        {
            setUser(userService.selectUserById(user.getUserId()));
            return Message.ok();
        }
        return Message.error();
    }

    /**
     * 修改用户
     */
    @Log(title = "系统管理", action = "个人信息-修改用户")
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, Model model)
    {
        User user = userService.selectUserById(userId);
        model.addAttribute("user", user);
        return prefix + "/edit";
    }

    /**
     * 修改用户
     */
    @Log(title = "系统管理", action = "个人信息-保存用户")
    @PostMapping("/update")
    @ResponseBody
    public Message update(User user)
    {
        if (userService.updateUser(user) > 0)
        {
            setUser(userService.selectUserById(user.getUserId()));
            return Message.ok();
        }
        return Message.error();
    }
}
