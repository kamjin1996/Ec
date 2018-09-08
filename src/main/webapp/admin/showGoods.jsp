<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <script src="../js/DatePicker.js"></script>
    <script type="text/javascript">
        function del(id) {
            if(confirm("确认要删除此商品吗？")){
                $.ajax({
                    type:"get",
                    url:"/delGoods.do",
                    data:{"id":id},
                    async:true,
                    success:function (data) {
                        if(data.code==1000){
                            alert("删除成功");
                            window.location.reload()
                        }
                    }
                })
            }

        }


        function fun1(obj, obj1) {
            $.ajax({
                type: "get",
                url: "/showGoods.do",
                data: {"name": obj, "pubdate": obj1},
                async: true,
                success: function (data) {
                    if (data.code == 1001) {
                        alert(data.msg)
                    } else if (data.code == 1000) {
                        //用来计数序号
                      var p = 0;
                        for (i = 0; i < data.data.length; i++) {

                            for(j=0;j<data.data[i].goods.length;j++){
                                p = p + 1;
                                var tr = $("<tr id=\"+i+\">\n" +
                                    "                                <td>" + p + "</td>\n" +
                                    "                                <td>" + data.data[i].goods[j].name + "</td>\n" +
                                    "                                <td><img src=../goodspic/"+ data.data[i].goods[j].pic + " width='50px' height='50px'></td>\n"+
                                    "                                <td>" + data.data[i].goods[j].price/100.0 + "</td>\n" +
                                    "                                <td>" + data.data[i].goods[j].pubdate + "</td>\n" +
                                    "                                <td>" + data.data[i].cname + "</td>\n" +
                                    "                                <td><a onclick='del("+data.data[i].goods[j].id+")' >删除</a> &nbsp;<a href='/selectThisGoods.do?id="+data.data[i].goods[j].id+"'>修改</a> &nbsp;\n" +
                                    "                        <a tabindex=\"0\" id=\"example" + data.data[i].goods[j].id + "\" class=\"btn btn-primary btn-xs\"\n" +
                                    "                            role=\"button\" data-toggle=\"popover\"\n" +
                                    "                            data-trigger=\"focus\"\n" +
                                    "                            data-placement=\"left\"\n" +
                                    "                            data-content=\"" + data.data[i].goods[j].info + "\">描述</a>\n" +
                                    "                        </td>\n" +
                                    "                            </tr>")

                                $("#example${data.data[i].goods[j].id}").popover();
                                $("#tb_list").append(tr);
                            }


                        }

                    }
                }
            })


        }

        $(function () {

            fun1();

            $("#search").click(function () {

                    $("#tb_list").empty();
                    var basetr = $(" <tr>\n" +
                        "                            <td>序号</td>\n" +
                        "                            <td>商品名称</td>\n" +
                        "                            <td>价格</td>\n" +
                        "                            <td>上架时间</td>\n" +
                        "                            <td>类型</td>\n" +
                        "                            <td>操作</td>\n" +
                        "                        </tr>")


                    $("#tb_list").append(basetr);
                    var name = $("[name='name']").val()
                    var pubdate = $("[name='pubdate']").val()

                    fun1(name, pubdate);
                }
            )


        })


    </script>
    <title>商品列表</title>

</head>
<body>
<div class="row" style="width:98%;margin-left: 1%;">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                会员列表
            </div>
            <div class="panel-body">

                <div class="row">
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <div class="form-group form-inline">
                            <span>商品名称</span>
                            <input type="text" name="name" class="form-control">
                        </div>
                    </div>
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <div class="form-group form-inline">
                            <span>上架时间</span>
                            <input type="text" readonly="readonly" name="pubdate" class="form-control"
                                   onclick="setday(this)">
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
                            <td>商品名称</td>
                            <td>价格</td>
                            <td>上架时间</td>
                            <td>类型</td>
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