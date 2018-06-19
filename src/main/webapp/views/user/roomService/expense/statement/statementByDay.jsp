<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/dateRange.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/plugin/calendar/monthPicker.css"/>
<link href="${pageContext.request.contextPath}/css/ld/user/home/public.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/ld/user/roomService/roomService.css" rel="stylesheet" type="text/css" />
<title>日结算</title>
</head>
<body>
	<jsp:include page="../../../_header.jsp"></jsp:include>
	<jsp:include page="../../../_modal.jsp" />

	<!-- 页面内容 strat -->
	<div class="main">
		<div class="main-page">
			<div class="nav-path">
				<a href="../../../home/homeUser.jsp" title="回到首页"><i class="icon-home"></i></a>
				<i class="icon-path"></i>
				<a href="javascript:void(0);">日结算</a>
			</div>
			<div class="bill-area">
			    <div class="search">
					<div class="roomNumFloat">
			            <span>房间号: </span><input id="search-input" type="text" value="">
					</div>
					<div class="roomNumFloat">
						<span>姓名: </span><input id="guestName" type="text" value="" disabled="disabled">
					</div>
					<!-- 双日历 start -->
					<div class="calendarPart">

						<span class="date">日期：</span>
						<div class="ta_date" id="div_date_demo3">
							<span class="date_title" id="date_demo3"></span>
						</div>
						<div id="datePicker"></div>
					</div>
					<!-- 双日历 end -->
					<div style="float: right;margin-top:20px;margin-bottom: 5px;">
						<a class="btn btn-edit btnEdit" onclick="requestFirstStatement(this);" >搜索</a>
						<a class="btn btn-edit btnEdit" onclick="exportList();" >导出</a>
						<a class="btn btn-edit btnEdit" onclick="printList('hahaha');">打印</a>
					</div>

					<div style="float:right;margin-right: 55px;margin-top: 20px;">
						<span style="color: red;padding-left: 10px;">总计：</span><span id="total">0</span><span style="color: red;padding-left: 10px;">元</span>
					</div>
				</div>
				<div class="bill-table">
					<!-- 费用 table start -->
					<table style="table-layout:fixed;word-break:break-all;">
						<thead>
							<tr>
								<th>收费类型</th>
								<th>日期</th>
								<th>物品</th>
								<th>费用</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody id="shoeCleaningTbody"></tbody>
					</table>
					<!-- 费用 table end -->

					<!-- 底部页面 start -->
					<div id="serviceShoeCleaningBottom" class="bottom"></div>
					<!-- 底部页码 end -->

				</div>
			</div>
		</div>
	</div>
	<div class="shadow"></div>
	<!-- 页面内容 end -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bootstrap.min.js"></script>
	<!-- 日历-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/dateRange.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/plugin/calendar/monthPicker.js"></script>
		
	<!-- 导出插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/Blob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/exportCsv/FileSaver.js"></script>

	<!-- 打印插件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/plugin/printer/print.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/home/public.js"></script>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/roomService.js"></script>--%>
	<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/service/serviceShoeCleaning.js"></script>--%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/ld/user/roomService/expense/statement/statementByDay.js"></script>

	<script type="text/javascript">
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        month = (month<10)?'0'+month:month;
        var day = date.getDate();

        var dateRange = new pickerDateRange('date_demo3', {
            isTodayValid : true,
            startDate : year + '-' + month + '-' +'01',
            endDate : year + '-' + month + '-' + day,
            minDate: '2010-01-01' ,
            maxDate: '2060-01-01' ,
            defaultText : ' 至 ',
            theme : 'ta',
            success : function(obj) {
                //console.log(obj);
                //console.log($(".date_title").val())
            }
        });

        // 拉取第一页 擦鞋费信息
        requestFirstPage();
	</script>
</body>
</html>