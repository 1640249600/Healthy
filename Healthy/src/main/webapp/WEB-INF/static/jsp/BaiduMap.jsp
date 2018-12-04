<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BaiduMap.jsp' starting page</title>
    
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	
	<style type="text/css">  
	    html{height:100%}    
	    body{height:100%;margin:0px;padding:0px}    
	    #container{height:100%}    
	</style> 
	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=ng4LBeF8q9bRx41rIDm1x0Mt8naHZKno"></script>
  
  </head>
  
  
  <body>
    <div id="container"></div> 
  </body>
  <script type="text/javascript">
   		var map = new BMap.Map("container");    
		var point = new BMap.Point(116.404, 39.915);    
		map.centerAndZoom(point, 15);  
   		
   		
   /* 	//IP定位
	function ipFun(r){
	    cityName = r.name;
	    map.setCenter(cityName);
	    alert("欢迎来自:"+cityName+"的朋友");
	    var marker = new BMap.Marker(point);        // 创建标注    
		map.addOverlay(marker);   
	}
	var myCity = new BMap.LocalCity();
	myCity.get(ipFun); */
	
	
	var geolocation = new BMap.Geolocation();
	/* // 开启SDK辅助定位
	geolocation.enableSDKLocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	}); */
	// 开启浏览器定位
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	});


	// 开启鼠标滚轮缩放
	map.enableScrollWheelZoom(true); 


//添加标准地图控件、平移缩放控件、比例尺控件和缩略图控件
map.addControl(new BMap.NavigationControl());
map.addControl(new BMap.ScaleControl());    
map.addControl(new BMap.OverviewMapControl());    
map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));     
// 设置地图显示的城市 此项是必须设置的
map.setCurrentCity(cityName);
  </script>
</html>
