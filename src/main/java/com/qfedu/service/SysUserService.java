package com.qfedu.service;

import com.qfedu.mapper.SysUserMapper;
import com.qfedu.pojo.Goods;
import com.qfedu.pojo.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


public interface SysUserService {
    public SysUser login(String username,String password);

}
