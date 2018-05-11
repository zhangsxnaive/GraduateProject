package com.ruoyi.project.system.area.domain;

public class Area {
    /** 地区id */
    private Long id;
    /** 地区名称 */
    private String name;
    /** 父级id */
    private Long pid;
    /** 父级名称 */
    private String pName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }
}
