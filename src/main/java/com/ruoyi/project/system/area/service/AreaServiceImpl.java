package com.ruoyi.project.system.area.service;

import com.ruoyi.project.system.area.dao.AreaDao;
import com.ruoyi.project.system.area.domain.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("areaService")
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaDao areaDao;

    @Override
    public Area selectAreaById(Long areaId) {
        return areaDao.selectAreaTree(areaId);
    }

    @Override
    public List<Map<String, Object>> selectAreaTree() {
        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        List<Area> areaList = areaDao.selectAreaAll();

        for (Area area : areaList)
        {
            Map<String, Object> deptMap = new HashMap<String, Object>();
            deptMap.put("id", area.getId());
            deptMap.put("pId", area.getPid());
            deptMap.put("name", area.getName());
            trees.add(deptMap);
        }
        return trees;
    }
}
