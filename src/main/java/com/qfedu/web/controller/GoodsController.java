package com.qfedu.web.controller;

import com.qfedu.pojo.Goods;
import com.qfedu.pojo.vo.GoodsVo;
import com.qfedu.pojo.vo.QueryVo;
import com.qfedu.pojo.SysUser;
import com.qfedu.service.GoodsService;
import com.qfedu.utils.MyFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@Controller
public class GoodsController {

    @Autowired
    private GoodsService service;


    //添加商品
    @RequestMapping(value = "/addgoods.do", method = RequestMethod.POST)
    public String addGoods(HttpServletRequest request, Goods goods, HttpSession session, @RequestParam("picture") CommonsMultipartFile commonsMultipartFile) throws IOException {
        File dir = new File(new File(request.getServletContext().getRealPath("/")).getParent(), "goodspic");
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String picName = MyFileUtil.getFileName(commonsMultipartFile.getOriginalFilename());
        File tarFile = new File(dir, picName);
        goods.setPic(tarFile.getName());
        System.out.println("文件上传路径: " + tarFile.getAbsolutePath());
        commonsMultipartFile.transferTo(tarFile);
        SysUser sysUser = (SysUser) session.getAttribute("sysUser");
        goods.setUid(sysUser.getId());

        return service.addGoods(goods) > 0 ? "/admin/admin.jsp" : "admin/addGoods.jsp";
    }

    //条件查询商品
    @RequestMapping(value = "/showGoods.do", method = {RequestMethod.GET,RequestMethod.POST})
    public @ResponseBody
    QueryVo selectGoods(Goods goods) throws InterruptedException {
        List<GoodsVo> goodsList = service.selectGoods(goods);
        QueryVo queryVo = new QueryVo();
        queryVo.setCode(goodsList.size() > 0 ? 1000 : 1001);
        queryVo.setMsg(goodsList.size() > 0 ? "查询成功" : "查询失败，条件不符合！");
        queryVo.setData(goodsList.size() > 0 ? goodsList : null);
        return queryVo;
    }

    //我们需要删除商品，实际是修改商品的标记。不是真正的删除
    @RequestMapping("/delGoods.do")
    public @ResponseBody QueryVo delGoods(Goods goods){
       // System.out.println(goods.getFlag());
        boolean flag = service.updateGoodsFlag(goods);
        QueryVo queryVo = new QueryVo();
        queryVo.setCode(flag?1000:1001);
        queryVo.setMsg(flag?"success":"faild");
        queryVo.setData(null);
        return queryVo;
    }
    //修改之前先通过当前id获取商品
    @RequestMapping("/selectThisGoods.do")
    public String updateGoods(Integer id,Model model){
        Goods goods = service.selectGoodsById(id);
        model.addAttribute("goods",goods);
        return "admin/updateGoods.jsp";
    }

    //修改商品
    @RequestMapping(value = "/updateGoods.do",method = RequestMethod.POST)
    public String updateGoods(Goods goods,@RequestParam("picture") CommonsMultipartFile commonsMultipartFile,HttpServletRequest request) throws IOException {

        if(!Objects.equals("",commonsMultipartFile.getOriginalFilename())){
            File dir = new File(new File(request.getServletContext().getRealPath("/")).getParent(), "goodspic");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String picName = MyFileUtil.getFileName(commonsMultipartFile.getOriginalFilename());
            File tarFile = new File(dir, picName);
            goods.setPic(tarFile.getName());
            System.out.println("文件上传路径: " + tarFile.getAbsolutePath());
            commonsMultipartFile.transferTo(tarFile);
        }

        if(service.updateGoods(goods)){
            return "admin/showGoods.jsp";
        } else {
            return "admin/updateGoods.jsp";
        }

    }
}
