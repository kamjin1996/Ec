<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <script type="text/javascript">

        function fun1(obj,obj1){
            $.ajax({
                type: "get",
                url: "/showGoodsType.do",
                data:{"level":obj,"cname":obj1},
                async: true,
                success: function (data) {
                    if (data.code == 1001) {
                        alert(data.msg)
                    } else if (data.code == 1000) {
                        for (i = 0; i < data.data.length; i++) {
                            //用来接收当前parentid对应id的name
                            var name = "";
                            //不为0表示是有父级的，那么parentid也有对应的id和name
                            if (data.data[i].parentid != 0) {
                                //在当前记录中遍历整张表，如果有对应的id，则把name赋值给变量name
                                for (j = 0; j < data.data.length; j++) {
                                    if (data.data[i].parentid == data.data[j].id) {
                                        name = data.data[j].cname;
                                    }
                                }
                            } else {
                                name = "Object!";
                            }

                            var tr = $("<tr>\n" +
                                "                            <td>" + i + "</td>\n" +
                                "                            <td>" + data.data[i].cname + "</td>\n" +
                                "                            <td>" + data.data[i].level + "</td>\n" +
                                //代入
                                "                            <td>" + name + "</td>\n" +
                                "                            <td>\n" +
                                "                            <button>修改</button>&nbsp;&nbsp;\n" +
                                "                            <button>删除</button>\n" +
                                "                            </td>\n" +
                                "                            </tr>\n");

                            $("#tb_list").append(tr);
                        }


                    }
                }


            })
        }
        $(function () {

            fun1();
           $("#search").click(function () {
               $("#tb_list").empty();
               var basetr = $("<tr>\n" +
                   "                            <td>序号</td>\n" +
                   "                            <td>类型</td>\n" +
                   "                            <td>等级</td>\n" +
                   "                            <td>所属类型</td>\n" +
                   "                            <td>操作</td>\n" +
                   "                        </tr>")


               $("#tb_list").append(basetr)
               var level = $("[name='level']:checked").val();
               var cname = $("[name='cname']").val();
              fun1(level,cname);
           })
            $(":radio[name='level']").click(function(event){
                // 禁用事件的默认动作
                event.preventDefault();
            })
            // 绑定一个鼠标单击事件
                .mouseup(function(){
                    $(this).prop("checked",!$(this).is(":checked"));
                });

        })


    </script>

    <title>商品分类</title>
</head>
<body>
<div class="row" style="width:98%;margin-left: 1%;">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                商品分类
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <div class="form-group form-inline">
                            <span>分类等级</span>
                            <label>  <input type="radio" name="level" class="form-control" value="1"/>等级一</label>
                            <label>  <input type="radio" name="level" class="form-control" value="2"/>等级二</label>
                        </div>
                    </div>
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <div class="form-group form-inline">
                            <span>分类名称</span>
                            <input type="text" name="cname" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <button type="button" class="btn btn-primary" id="search"><span
                                class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>
                <div style="height: 400px;overflow: scroll;">
                    <table id="tb_list" class="table table-striped table-hover table-bordered">
                        <tr>
                            <td>序号</td>
                            <td>类型</td>
                            <td>等级</td>
                            <td>所属类型</td>
                            <td>操作</td>
                        </tr>

                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>