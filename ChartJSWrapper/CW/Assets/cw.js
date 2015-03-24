"use strict";

function addPointData(chartId, dataStr, label) {
	var chart = window[chartId];
	var data = JSON.parse(dataStr);
	chart.addData(data,label);
	return 'OK'
}

function setPointValue(chartId, dataset, index, value) {
	var chart = window[chartId];
	chart.datasets[dataset].points[index].value = value;
	return 'OK'
}

function removePointData(chartId) {
	var chart = window[chartId];
	chart.removeData();
	return 'OK'
}

function setBarValue(chartId, dataset, index, value) {
	var chart = window[chartId];
	chart.datasets[dataset].bars[index].value = value;
	return 'OK'
}

function setSegmentValue(chartId, segment, value) {
	var chart = window[chartId];
	chart.segments[segment].value = value;
	return 'OK'
}

function addSegmentData(chartId, segment, index) {
	var chart = window[chartId];
	var data = JSON.parse(segment);
	chart.addData(data,index);
	return 'OK'
}

function removeSegmentData(chartId, index) {
	var chart = window[chartId];
	chart.removeData(index);
	return 'OK'
}

function updateChart(chartId) {
	var chart = window[chartId];
	chart.update();
	return 'OK'
}

function deleteChart(chartId) {
	var chart = window[chartId];
	chart.destroy();
	var canvas = document.getElementById(chartId+'_canvas');
	var div = document.getElementById(chartId+'_div');
	div.removeChild(canvas);
	document.body.removeChild(div);
	delete window[chartId];
	return 'OK';
}

function createContext(chartId, chartWidth,chartHeight) {
	var div = document.createElement('div');
	//	document.body.appendChild(div);
	document.body.insertBefore(div,document.body.firstChild);
	div.id = chartId+'_div';
	div.style.height='100%';
	div.style.width='100%';
	var canvas = document.createElement('canvas');
	div.appendChild(canvas);
	canvas.id = chartId+'_canvas';
	canvas.width = chartWidth;
	canvas.height = chartHeight;
	var ctx = canvas.getContext('2d');
	return ctx;
}

function addLineChart(chartId,chartWidth,chartHeight,chartData, chartOptions) {
	var data = JSON.parse(chartData);
	var options = JSON.parse(chartOptions);
	
	var ctx = createContext(chartId,chartWidth,chartHeight);
	
	var chart = new Chart(ctx).Line(data,options);
	window[chartId] = chart;
	return 'OK';
}

function addRadarChart(chartId,chartWidth,chartHeight,chartData, chartOptions) {
	var data = JSON.parse(chartData);
	var options = JSON.parse(chartOptions);
	
	var ctx = createContext(chartId,chartWidth,chartHeight);
	
	var chart = new Chart(ctx).Radar(data,options);
	window[chartId] = chart;
	return 'OK';
}

function addBarChart(chartId,chartWidth,chartHeight,chartData, chartOptions) {
	var data = JSON.parse(chartData);
	var options = JSON.parse(chartOptions);
	
	var ctx = createContext(chartId,chartWidth,chartHeight);
	
	var chart = new Chart(ctx).Bar(data,options);
	window[chartId] = chart;
	return 'OK';
}

function addPolarAreaChart(chartId,chartWidth,chartHeight,chartData, chartOptions) {
	var data = JSON.parse(chartData);
	var options = JSON.parse(chartOptions);
	
	var ctx = createContext(chartId,chartWidth,chartHeight);
	
	var chart = new Chart(ctx).PolarArea(data,options);
	window[chartId] = chart;
	return 'OK';
}

function addPieChart(chartId,chartWidth,chartHeight,chartData, chartOptions) {
	var data = JSON.parse(chartData);
	var options = JSON.parse(chartOptions);
	
	var ctx = createContext(chartId,chartWidth,chartHeight);
	
	var chart = new Chart(ctx).Pie(data,options);
	window[chartId] = chart;
	return 'OK';
}

function addDoughnutChart(chartId,chartWidth,chartHeight,chartData, chartOptions) {
	var data = JSON.parse(chartData);
	var options = JSON.parse(chartOptions);
	
	var ctx = createContext(chartId,chartWidth,chartHeight);
	
	var chart = new Chart(ctx).Doughnut(data,options);
	window[chartId] = chart;
	return 'OK';
}
