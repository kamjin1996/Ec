package com.qfedu.mapper;

import com.qfedu.pojo.Goods;
import com.qfedu.pojo.SysUser;

import java.util.List;

public interface SysUserMapper {


    SysUser selectByUsername(String username);

    int insertSysUser(SysUser sysUser);

    List<SysUser> selectAll();

    SysUser selectById(Integer id);



}