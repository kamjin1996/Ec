package com.qfedu.service.impl;

import com.qfedu.mapper.SysUserMapper;
import com.qfedu.pojo.Goods;
import com.qfedu.pojo.SysUser;
import com.qfedu.service.SysUserService;
import com.qfedu.utils.MyFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Objects;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper mapper;

    //内部员工登录
    @Override
    public SysUser login(String username, String password) {

        if (username == null && "".equals(username)) {
            return null;
        } else {

            SysUser sysUser = mapper.selectByUsername(username);

            if(sysUser!=null && sysUser.getFlag()!=1){
                return Objects.equals(sysUser.getPassword(), password) ? sysUser : null;
            } else {
                return null;
            }
        }




    }


}
