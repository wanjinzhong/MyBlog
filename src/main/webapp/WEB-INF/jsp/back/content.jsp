<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/back_all.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.1.0.js"></script>
</head>
<body>
	<div id="Contents">
		<script type="text/javascript">
			$(
					function() {
						$(".select")
								.each(
										function() {
											var s = $(this);
											var z = parseInt(s.css("z-index"));
											var dt = $(this).children("dt");
											var dd = $(this).children("dd");
											var _show = function() {
												dd.slideDown(200);
												dt.addClass("cur");
												s.css("z-index", z + 1);
											};
											var _hide = function() {
												dd.slideUp(200);
												dt.removeClass("cur");
												s.css("z-index", z);
											};
											dt.click(function() {
												dd.is(":hidden") ? _show()
														: _hide();
											});
											dd.find("a").click(function() {
												dt.html($(this).html());
												_hide();
											});
											$("body")
													.click(
															function(i) {
																!$(i.target)
																		.parents(
																				".select")
																		.first()
																		.is(s) ? _hide()
																		: "";
															});
										})
					})
		</script>

		<!-- MainForm -->
		<div id="MainForm">
			<div class="form_boxB">
				<h2>2015-04月预测审批列表</h2>
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="10" class="info_boxA">部门：人力资源部 类别：费用类 日期：2015-04
							预测总额：46150.00元</td>
					</tr>
					<tr>
						<th>序号</th>
						<th>提交人</th>
						<th>科目</th>
						<th>预测金额（元）</th>
						<th>总计（元）</th>
						<th>状态</th>
						<th>审核人</th>
						<th>审核时间</th>
						<th>备注</th>
						<th>操作</th>
					</tr>
					<tr>
						<td>1</td>
						<td>田雪</td>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
						<td class="money">45050.00</td>
						<td class="f_cA">通过</td>
						<td>闵红蕾</td>
						<td>2015-04-13 09:58:45</td>
						<td>&nbsp;</td>
						<td class="last"><a href="#">驳回</a></td>
					</tr>
					<tr>
						<td rowspan="5">2</td>
						<td rowspan="5">田雪</td>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
						<td rowspan="5" class="money">45050.00</td>
						<td rowspan="5" class="f_cA">通过</td>
						<td rowspan="5">闵红蕾</td>
						<td rowspan="5">2015-04-13 09:58:45</td>
						<td rowspan="5">&nbsp;</td>
						<td rowspan="5" class="last"><a href="#">驳回</a></td>
					</tr>
					<tr>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
					</tr>
					<tr>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
					</tr>
					<tr>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
					</tr>
					<tr>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
					</tr>
					<tr>
						<td>3</td>
						<td>田雪</td>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
						<td class="money">45050.00</td>
						<td class="f_cA">通过</td>
						<td>闵红蕾</td>
						<td>2015-04-13 09:58:45</td>
						<td>&nbsp;</td>
						<td class="last"><a href="#">驳回</a></td>
					</tr>
					<tr>
						<td>4</td>
						<td>田雪</td>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
						<td class="money">45050.00</td>
						<td class="f_cA">通过</td>
						<td>闵红蕾</td>
						<td>2015-04-13 09:58:45</td>
						<td>&nbsp;</td>
						<td class="last"><a href="#">驳回</a></td>
					</tr>
					<tr>
						<td>5</td>
						<td>田雪</td>
						<td>市内交通费</td>
						<td class="money">12000.00</td>
						<td class="money">45050.00</td>
						<td class="f_cA">通过</td>
						<td>闵红蕾</td>
						<td>2015-04-13 09:58:45</td>
						<td>&nbsp;</td>
						<td class="last"><a href="#">驳回</a></td>
					</tr>
				</table>
				<p class="msg">共找到47条年度预算记录，当前显示从第1条至第10条</p>
			</div>
		</div>
		<!-- /MainForm -->


		<!-- BtmMain -->
		<div id="BtmMain">
			<span class="ttl">全部审批</span>

			<!-- txtbox -->
			<div class="txtbox floatL mag_r20">
				<span class="sttl">审核时间：</span> <input name="" type="text" size="8">
			</div>
			<!-- /txtbox -->

			<!-- txtbox -->
			<div class="txtbox floatL mag_r20">
				<span class="sttl">审核人：</span> <input name="" type="text" size="8">
			</div>
			<!-- /txtbox -->

			<!-- btn_box -->
			<div class="btn_box floatR mag_l20">
				<input name="" type="button" value="返回列表"
					onmousemove="this.className='input_move'"
					onmouseout="this.className='input_out'">
			</div>
			<!-- /btn_box -->

			<!-- btn_box -->
			<div class="btn_box floatR mag_l20">
				<input name="" type="button" value="驳回"
					onmousemove="this.className='input_move'"
					onmouseout="this.className='input_out'">
			</div>
			<!-- /btn_box -->

			<!-- btn_box -->
			<div class="btn_box floatR mag_l20">
				<input name="" type="button" value="通过"
					onmousemove="this.className='input_move'"
					onmouseout="this.className='input_out'">
			</div>
			<!-- /btn_box -->
		</div>
		<!-- /BtmMain -->

		<!-- PageNum -->
		<ul id="PageNum">
			<li><a href="">首页</a></li>
			<li><a href="">上一页</a></li>
			<li><a href="">1</a></li>
			<li><a href="">2</a></li>
			<li><a href="">3</a></li>
			<li><a href="">4</a></li>
			<li><a href="">5</a></li>
			<li><a href="">6</a></li>
			<li><a href="">下一页</a></li>
			<li><a href="">尾页</a></li>
		</ul>
		<!-- /PageNum -->
	</div>
</body>
</html>