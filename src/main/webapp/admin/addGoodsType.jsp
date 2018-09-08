<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<title>添加商品种类</title>
<script>
	$(function () {

        $("[name='parentid']").change(function () {
            $("[name='parentid']").attr("selected","selected");
        })

		$.ajax({
		   type:"get",
			url:"/showGoodsType.do",
			async:true,
			success:function (data) {

				if(data.code!=1001){
				    //数据查询完成
					for(i=0;i < data.data.length;i++){
					    if(data.data[i].level == 1){
                           var op = $("<option value="+data.data[i].id+">"+data.data[i].cname+"</option>");
                            $("[name='parentid']").append(op)
						}

					}

				} else if(data.code != 1000){
				    alert("查询失败！")
				}
            }
		})
    })

</script>
</head>
<body>
<div style="width:98%;margin-left: 1%;">
	<div class="panel panel-default">
		<div class="panel-heading">
			添加商品种类
		</div>
		<div class="panel-body">
			<form action="/addGoodsType.do" method="post">
				<div class="row">
					<div class="form-group form-inline">
						<span>所属种类</span>
						<select name="parentid">
							<option value="0">--请选择--</option>

						</select>
					</div>
				</div>
				<div class="row">
					<div class="form-group form-inline">
						<span>种类名称</span>
						<input type="text" name="cname" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="btn-group">
						<button type="reset" class="btn btn-default">清空</button>
						<button type="submit" class="btn btn-default">添加</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>