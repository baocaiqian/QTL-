var count=1;
var spancount=0;
function shc(){
	var div1=document.getElementById('dao1');
	var div2=document.getElementById('dao2');
	var adiv1=document.getElementById('remen');
	var adiv2=document.getElementById('wsc');
	div1.style.display="none";
	div2.style.display="block";
	adiv2.style.backgroundColor="#eff1f1";
	adiv1.style.backgroundColor="#fff";
	
}
function retj(){
	var div1=document.getElementById('dao1');
	var div2=document.getElementById('dao2');
	div2.style.display="none";
	div1.style.display="block";
	var adiv1=document.getElementById('remen');
	var adiv2=document.getElementById('wsc');
	adiv1.style.backgroundColor="#eff1f1";
	adiv2.style.backgroundColor="#fff";
}
function addxq(obj){
	var oldimg=obj.getElementsByTagName("img")[0];
	var oldname=obj.getElementsByTagName("div")[2];
	var oldadd=obj.getElementsByTagName("div")[5];
	var oldid=obj.getElementsByTagName("div")[1];
	var fid= document.getElementById('zhong');//插入的父id
	var zhongju=document.createElement("div");//创建新div存距离
	var cartb=document.createElement("img");
	var newdi= document.createElement("div");//创建新div
	var myimg= document.createElement("img");//插入图片
	var myname=document.createElement("div");//插入名称
	var myadd=document.createElement("div");//插入地址
	var mya=document.createElement("a");//插入周边
	
	var zuofid= document.getElementById('xingcheng');
	var zuoxian=document.createElement("div");//创建显示距离的div
	/*
	var zuospan1=document.createElement("input");
	var zuospan2=document.createElement("input");
	var zuospan3=document.createElement("input");
	*/
	var zuod=document.createElement("div");//创建地点的div
	var zuoname= document.createElement("input");//地点的名字
	var yincang= document.createElement("input");//地点的Id
	var youxuan= document.createElement("img");
	youxuan.src="http://localhost:8080/xingtu/img/icon/greatroute.png";
	cartb.src="http://localhost:8080/xingtu/img/icon/car.png";
	zhongju.id='zj'+count;
	newdi.id='xian'+count;
	myname.id='di'+count;
	myadd.id='pj'+count;
	mya.id='ck'+count;
	zuoxian.id='xia'+count;
	zuod.id='zd'+count;
	zuoname.id='dim'+count;
	zuoname.type="text";
	zuoname.setAttribute("name","diname");
	zuoname.className="dz";
	zuoname.style.border="none";
	zuoname.style.width="80%";
	zuoname.style.fontSize="25px";
	/*
	zuospan1.id='fspan'+spancount;
	zuospan2.id='sspan'+spancount;
	/*zuospan3.id='tspan'+spancount;*/
	myimg.src=oldimg.src;
	myname.innerText=oldname.innerText;
	myadd.innerText=oldadd.innerText;
	yincang.setAttribute("name","diid");
	yincang.type="hidden";
	yincang.id='yc'+count;
	mya.href='#';
	mya.innerText="查看周边";
	/*transit.search(id1,id2);*/
	zuoname.value=oldname.innerText;
	yincang.value=oldid.innerText;
	newdi.appendChild(myimg);
	newdi.appendChild(myname);
	newdi.appendChild(myadd);
	newdi.appendChild(mya);
	fid.appendChild(zhongju);
	fid.appendChild(newdi);
	zuofid.appendChild(zuoxian);
	zuoxian.appendChild(youxuan);
	zuod.appendChild(zuoname);
	zuod.appendChild(yincang);
	zuofid.appendChild(zuod);/*
	zhongju.appendChild(zuospan1);
	zuoxian.appendChild(zuospan2);
	zuoxian.appendChild(zuospan3);*/
	if(count>1){
	
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);
	var output = "两地之间的距离为";
	var dis = "距离：";
	var divertime = "驾车所需时长：";
	var bustime="公交所需时长：";
	var searchComplete = function (results){
		if (transit.getStatus() != BMAP_STATUS_SUCCESS){
			return ;
		}
		var plan = results.getPlan(0);
		dis+=plan.getDistance(true)+'；';
		divertime+=plan.getDuration(true)+' \n ';
		bustime = "    公交所需时长： "+plan.getDuration(true);
	}
	/*
	var searchComplete2 = function (results){
		if (transit.getStatus() != BMAP_STATUS_SUCCESS){
			return ;
		}
		alert(1);
		var plan = results.getPlan(0);
		bustime+=plan.getDuration(true)+' \n ';
		alert(bustime);
	}
	*/
	var percount = count-1;
	var zuospan1=document.createElement("input");
	var zuospan2=document.createElement("input");
	var zuospan3=document.createElement("input");
	spancount++;
	zuospan1.id='fspan'+spancount;
	zuospan2.id='sspan'+spancount;
	//zuospan3.id='tspan'+spancount;
	zuospan1.type="text";
	zuospan2.type="text";
	zuospan3.type="text";
	zuospan1.style.border="none";
	zuospan1.style.width="80%";
	zuospan1.style.fontSize="20px";
	zuospan1.name="juli";
	zhongju.appendChild(cartb);
	zhongju.appendChild(zuospan1);
	//zhongju.appendChild(zuospan2);
	/*zuoxian.appendChild(zuospan3);*/
	var name1=document.getElementById('dim'+percount).value;
	var name2=document.getElementById('dim'+count).value;
	var id1= name1;
	var id2= name2;
	var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
		onSearchComplete: searchComplete,
		onPolylinesSet: function(){
			document.getElementById('fspan'+spancount).value=dis+divertime;
			//document.getElementById('sspan'+spancount).value=divertime;
	}});
	var transit2 = new BMap.TransitRoute(map, {renderOptions: {map: map},
		onSearchComplete: searchComplete,
		onPolylinesSet: function(){
			document.getElementById("tspan"+spancount).innerText=bustime;
		}});
	transit.search(id1,id2);
	transit2.search(id1,id2);
	}
	count++;
}
/*// 百度地图API功能
var map = new BMap.Map("allmap");
var id1= "北京";
var id2= "天津";
map.centerAndZoom(new BMap.Point(116.404, 39.915), 12);
var output = "两地之间的距离为";
var searchComplete = function (results){
	if (transit.getStatus() != BMAP_STATUS_SUCCESS){
		return ;
	}
	var plan = results.getPlan(0);
	output += plan.getDuration(true) + "\n";                //获取时间
	output += "总路程为：" ;
	output += plan.getDistance(true) + "\n";             //获取距离
}
var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
	onSearchComplete: searchComplete,
	onPolylinesSet: function(){        
		setTimeout(function(){alert(output)},"1000");	
}});*/
