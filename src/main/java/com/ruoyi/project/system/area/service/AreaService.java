package com.ruoyi.project.system.area.service;

import com.ruoyi.project.system.area.domain.Area;

import java.util.List;
import java.util.Map;

public interface AreaService {

    Area selectAreaById(Long areaId);

    List<Map<String,Object>> selectAreaTree();
}
