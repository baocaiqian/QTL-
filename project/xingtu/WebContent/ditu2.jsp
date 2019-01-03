<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <style type="text/css">
            body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
            #allmap{width:100%;height:100%;}
            p{margin-left:5px; font-size:14px;}
        </style>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=no84ceXVi8gDw2sbzALgBU2HxUkcwEpM"></script>
        <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
        <title>给多个点添加信息窗口</title>
    </head>
    <body>
        <div id="allmap"></div>
    </body>
    </html>
    <script type="text/javascript">
        // 百度地图API功能
        var map = new BMap.Map("allmap");         
        map.centerAndZoom(new BMap.Point(121.4, 31.2), 11);
        map.setCurrentCity("上海");  
        var local1 = new BMap.LocalSearch(map, {
            renderOptions:{map: map}
        });
        var local2 = new BMap.LocalSearch(map, {
            renderOptions:{map: map}
        });
        local1.search("河北石家庄");
        local2.search("河北石家庄正定");
    </script>