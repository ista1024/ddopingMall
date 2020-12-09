<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<%@ include file="../include/header.jsp" %>
		<title>Insert title here</title>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<!-- <script type="text/javascript" src="https://www.google.com/jsapi"></script> -->
		<script type="text/javascript">
			// 구글 차트 라이브러리 로딩
			google.load("visualization","1",{"packages":["corechart"]});
			// 라이브러리 로딩이 완료되면 drawChart함수 호출, ()는 안씀
			google.setOnLoadCallback(drawChart);
			
			function drawChart(){
				// 차트 그리기에 필요한 json 데이터 로딩
				var jsonData = $.ajax({
					url: "${path}/resources/admin/json/sampleData.json",
					dataType: "json",
					async: false // 동기식 처리(순차적 처리:데이터를 전부 읽어온 후에 차트를 출력하기 위함)
				}).responseText;
				console.log(jsonData); // 콘솔에도 출력
				var data = new google.visualization.DataTable(jsonData);
				console.log("데이터 테이블 : " + data);
				var options = {title: "차트 예제",
						is3D: true
				}
				var chart = new google.visualization.PieChart(document.getElementById("chart_div1"));
				//var chart=new google.visualization.LineChart(document.getElementById("chart_div2"));
				//var chart=new google.visualization.ColumnChart(document.getElementById("chart_div3"));
				chart.draw(data, options);
			}
		</script>
	</head>
	<body>
		<%@ include file="../include/admin_menu.jsp" %>
		<div id="chart_div1" style="width: 600px; height: 440px;"></div>
		<div id="chart_div2"></div>
		<div id="chart_div3"></div>
		<button id="btn" type="button" onclick="drawChart()">refresh</button>
	</body>
</html>