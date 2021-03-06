package com.ruoyi.project.system.dept.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.dept.dao.IDeptDao;
import com.ruoyi.project.system.dept.domain.Dept;

/**
 * 部门管理 服务实现
 * 
 * @author ruoyi
 */
@Repository("deptService")
public class DeptServiceImpl implements IDeptService
{
    @Autowired
    private IDeptDao deptDao;

    /**
     * 查询部门管理集合
     * 
     * @return 所有部门信息
     */
    @Override
    public List<Dept> selectDeptAll()
    {
        return deptDao.selectDeptAll();
    }

    /**
     * 查询部门管理树
     * 
     * @return 所有部门信息
     */
    @Override
    public List<Map<String, Object>> selectDeptTree()
    {
        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        List<Dept> deptList = deptDao.selectDeptAll();

        for (Dept dept : deptList)
        {
            Map<String, Object> deptMap = new HashMap<String, Object>();
            deptMap.put("id", dept.getDeptId());
            deptMap.put("pId", dept.getParentId());
            deptMap.put("name", dept.getDeptName());
            trees.add(deptMap);
        }
        return trees;
    }

    /**
     * 查询部门人数
     * 
     * @param parentId 部门ID
     * @return 结果
     */
    @Override
    public int selectDeptCount(Long parentId)
    {
        Dept dept = new Dept();
        dept.setParentId(parentId);
        return deptDao.selectDeptCount(dept);
    }

    /**
     * 查询部门是否存在用户
     * 
     * @param deptId 部门ID
     * @return 结果 true 存在 false 不存在
     */
    @Override
    public boolean checkDeptExistUser(Long deptId)
    {
        int result = deptDao.checkDeptExistUser(deptId);
        return result > 0 ? true : false;
    }

    /**
     * 删除部门管理信息
     * 
     * @param deptId 部门ID
     * @return 结果
     */
    @Override
    public int deleteDeptById(Long deptId)
    {
        return deptDao.deleteDeptById(deptId);
    }

    /**
     * 保存部门信息
     * 
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public int saveDept(Dept dept)
    {
        if (StringUtils.isNotNull(dept.getDeptId()))
        {
            dept.setUpdateBy(ShiroUtils.getLoginName());
            return deptDao.updateDept(dept);
        }
        else
        {
            dept.setCreateBy(ShiroUtils.getLoginName());
            return deptDao.insertDept(dept);
        }
    }

    /**
     * 根据部门ID查询信息
     * 
     * @param deptId 部门ID
     * @return 部门信息
     */
    @Override
    public Dept selectDeptById(Long deptId)
    {
        return deptDao.selectDeptById(deptId);
    }

    /**
     * 校验部门名称是否唯一
     * 
     * @param dept 部门信息
     * @return 结果
     */
    @Override
    public String checkDeptNameUnique(Dept dept)
    {
        Long deptId = dept.getDeptId();
        Dept info = deptDao.checkDeptNameUnique(dept.getDeptName());
        if (StringUtils.isNotNull(info) && StringUtils.isNotNull(info.getDeptId())
                && info.getDeptId().longValue() != deptId.longValue())
        {
            return UserConstants.NAME_NOT_UNIQUE;
        }
        return UserConstants.NAME_UNIQUE;
    }
}
