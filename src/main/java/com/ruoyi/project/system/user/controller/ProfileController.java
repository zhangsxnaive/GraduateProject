package com.ruoyi.project.system.user.controller;

import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
