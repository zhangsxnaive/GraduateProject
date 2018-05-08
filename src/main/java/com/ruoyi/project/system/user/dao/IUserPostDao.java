package com.ruoyi.project.system.user.dao;

import com.ruoyi.project.system.user.domain.UserPost;

import java.util.List;

/**
 * 用户与岗位 表 数据层
 * 
 * @author ruoyi
 */
public interface IUserPostDao
{

    /**
     * 通过用户ID删除用户和岗位关联
     * 
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserPostByUserId(Long userId);

    /**
     * 批量新增用户岗位信息
     * 
     * @param userPostList 用户角色列表
     * @return 结果
     */
    public int batchUserPost(List<UserPost> userPostList);

    List<Long> selectUserIdList(Long postId);
}
