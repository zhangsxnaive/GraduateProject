package com.ruoyi.project.system.user.controller;

import com.ruoyi.framework.web.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 学生显示
 * 控制层
 */
@Controller
@RequestMapping("/user/")
public class UserSearchController extends BaseController {

    private String prefix = "system/user";

    @GetMapping("/search/{postId}")
    public String searchUser(@PathVariable("postId") Long postId, Model model) {
        model.addAttribute("postId",postId);
        return prefix+"/userlist";
    }


}
