package com.ruoyi.project.system.area.controller;

import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.project.system.area.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/area/")
public class AreaController extends BaseController {

    private String prefix = "system/area";

    @Autowired
    private AreaService areaService;

    /**
     * 选择城市树
     */
    @GetMapping("/selectAreaTree/{areaId}")
    public String selectAreaTree(@PathVariable("areaId") Long areaId, Model model) {
        String name  = areaService.selectAreaById(areaId).getName();
        model.addAttribute("treeName", name);
        return prefix + "/tree";
    }

    @GetMapping("/treeData")
    @ResponseBody
    public List<Map<String, Object>> treeData() {
        List<Map<String, Object>> tree = areaService.selectAreaTree();
        return tree;
    }



}
