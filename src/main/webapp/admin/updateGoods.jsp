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
<script src="../js/DatePicker.js"></script>
<title>商品修改页面</title>
</head>
<body>
	<div class="row" style="margin-left: 20px;">
		<form action="/updateGoods.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${goods.id}"/>
			<div>
				<h3>修改商品</h3>
			</div>
			<hr />
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group form-inline">
						<label>名称:</label>
						<input type="text" name="name" class="form-control" placeholder="${goods.name}" />
					</div>
					
					<div class="form-group form-inline">
						<label>分类:</label>
						<select name="cid" class="form-control">
							<option value="0">------</option>
							<option value="1">电脑</option>
							<option value="2">笔记本</option>
							<option value="3">平板</option>
							<option value="7">小米手机</option>
							<option value="8">红米</option>
						</select>
					</div>
					<%--由于是添加时间，所以不可修改--%>
					<%--<div class="form-group form-inline">--%>
						<%--<label>时间:</label>--%>
						<%--<input type="text" name="pubdate" readonly="readonly" class="form-control" onclick="setday(this)" />--%>
					<%--</div>--%>
				</div>
				<div class="col-sm-6">
					<div class="form-group form-inline">
						<label>价格:</label>
						<input type="text" name="price" class="form-control" placeholder="${goods.price/100}" />
					</div>
					<div class="form-group form-inline">
						<label>评分:</label>
						<input type="text" name="star" class="form-control" placeholder="${goods.star}" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10">
					<div class="form-group form-inline">
						<label>商品图片</label>
						<img src="/goodspic/${goods.pic}" width="50px" height="50px"/><br/>
						<input type="file" name="picture"  />
					</div>

					<div class="form-group ">
						<label>商品简介</label>
						<textarea name="info" class="form-control" rows="5">${goods.info}</textarea>
					</div>
					<div class="form-group form-inline">
						<input type="submit" value="修改" class="btn btn-primary" />
						<input type="reset" value="重置" class="btn btn-default" />
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>