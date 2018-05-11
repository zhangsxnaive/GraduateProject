package com.ruoyi.project.system.area.dao;


import com.ruoyi.project.system.area.domain.Area;

import java.util.List;

public interface AreaDao {
    Area selectAreaTree(Long areaId);

    List<Area> selectAreaAll();
}
