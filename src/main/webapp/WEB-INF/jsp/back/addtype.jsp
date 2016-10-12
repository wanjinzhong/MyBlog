<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<div id="mask"
	style="position: absolute; width: 100%; height: 100%; background-color: black; opacity: 0.4; left: 0; top: 0; display: none; z-index: 1000"></div>
<div id="addDiv"
	style="background-color: white; position: absolute; width: 400px; height: 200px; left: 50%; top: 50%; margin-left: -200px; margin-top: -300px; box-shadow: 5px 5px 20px rgba(50, 50, 50, 0.8); display: none; z-index: 1000">
	<div
		style="height: 30px; width: 390px; background-color: #55a9cd; line-height: 30px; color: white; padding: 5px;">
		添加类别<a style="float: right; margin: 5px 10px"
			href="javascript:void(0);" onclick="hideAddDiv()"><img alt="关闭"
			src="images/delete.png" onclick="closeAddDiv()" /></a>
	</div>
	<form action="addarticletype.do" method="POST" id="form">
		<table
			style="border: none; margin: 0 20px; margin-top: 30px; width: 360px">
			<tr>
				<td>类别名称</td>
				<td><input type="text" name="typeName" style="width: 100%" /></td>
			</tr>
			<tr style="margin-top: 10px; height: 50px">
				<td>类别描述</td>
				<td><textarea name="descript" style="width: 100%; height: 100%"></textarea></td>
			</tr>
		</table>
		<div style="text-align: right; margin-top: 10px; margin-right: 20px">
			<input type="button" id="submittype" value="确定" style="width: 50px;height: 25px"/>&nbsp;&nbsp;&nbsp;<input
				type="button" value="取消" style="width: 50px;height: 25px" onclick="hideAddDiv()" />
		</div>
	</form>
</div>