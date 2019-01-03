var count=1;
var tianshu=1;
var tianshu1=1;
var tianshu2=1;
var tianshu3=1;
var tianshu4=1;
var tianshu5=1;
var tianshu6=1;
function addcity(obj){
	//使div的display为none
	var dele1=document.getElementById('did0');
	dele1.style.display="none";
	//创建
	var fid= document.getElementById('titna');//插入的父id
	/*var cit= document.getElementById('cna${citylist.ctid }');*/
	var newdi= document.createElement("div");
	var didi=document.createElement("input");
	var oldadd=obj.getElementsByTagName("div")[0];
	didi.value=oldadd.innerText;
	didi.type="text";
	didi.style.border="none";
	didi.style.width="35%";
	didi.style.height="40px";
	didi.name="cityname";
	didi.style.marginLeft="3%";
	var lefimg= document.createElement("img");
	var num=document.createElement("div");
	var shu=document.createElement("input");
	var rigimg=document.createElement("img");
	var delimg=document.createElement("img");
	shu.type="text";
	shu.style.border="none";
	shu.style.width="70%";
	shu.style.height="40px";
	shu.name="tians";
	shu.value=tianshu;
	tianshu=1;
	num.id='tis'+count;
	num.style.width="10%";
/*	num.style.marginLeft="65%";*/
	newdi.id='myci'+count;
	didi.id='dizhi'+count;
	shu.id='ts'+count;
	lefimg.src="http://localhost:8080/xingtu/img/left-square.png";
	lefimg.id='lef'+count;
	rigimg.src="http://localhost:8080/xingtu/img/right-square.png";
	rigimg.id='rig'+count;
	delimg.src="http://localhost:8080/xingtu/img/clo.png";
	delimg.id='del'+count;
	delimg.style.display="none";
	newdi.appendChild(didi);
	newdi.appendChild(lefimg);
	num.appendChild(shu);
	newdi.appendChild(num);
	newdi.appendChild(rigimg);
	newdi.appendChild(delimg);
	fid.appendChild(newdi);
	count=count+1;
}
/*function changecity(){
	var dele1=document.getElementById('did0');
	dele1.style.display="none";
	var fid= document.getElementById('titna');
	var didi=document.createElement("div");
	var inputtitle = document.getElementById('diz').value;
	didi.innerText=inputtitle;
	var lefimg= document.createElement("img");
	var num=document.createElement("input");
	var shu=document.createTextNode(number);
	var rigimg=document.createElement("img");
	newdi.id='myci'+count;
	didi.id='dizhi'+count;
	num.id='ts'+count;
	lefimg.src="http://localhost:8080/xingtu/img/left-square.png";
	lefimg.id='lef'+count;
	rigimg.src="http://localhost:8080/xingtu/img/right-square.png";
	rigimg.id='rig'+count;
	newdi.appendChild(didi);
	newdi.appendChild(lefimg);
	num.appendChild(shu);
	newdi.appendChild(num);
	newdi.appendChild(rigimg);
	fid.appendChild(newdi);
	count++;
}*/
$(document).on("mouseover",'#myci1',function(){
	var tub=document.getElementById('del1');
	tub.style.display="inline";
})
$(document).on("mouseout",'#myci1',function(){
	var tub=document.getElementById('del1');
	tub.style.display="none";
})
$(document).on("click",'#lef1',function(){
	var jian=document.getElementById('ts1');
	if(tianshu1>1){
		tianshu1--;
		jian.value=tianshu1;
	}else{
		jian.value=1;
	}
})
$(document).on("click","#rig1",function(){
	var jia=document.getElementById('ts1');
	tianshu1++;
	jia.value=tianshu1;
})
$(document).on("click","#del1",function(){
	$("div").remove("#myci1");
})
$(document).on("mouseover",'#myci2',function(){
	var tub=document.getElementById('del2');
	tub.style.display="inline";
})
$(document).on("mouseout",'#myci2',function(){
	var tub=document.getElementById('del2');
	tub.style.display="none";
})
$(document).on("click",'#lef2',function(){
	var jian=document.getElementById('ts2');
	if(tianshu2>1){
		tianshu2--;
		jian.value=tianshu2;
	}else{
		jian.value=1;
	}
})
$(document).on("click","#rig2",function(){
	var jia=document.getElementById('ts2');
	tianshu2++;
	jia.value=tianshu2;
})
$(document).on("click","#del2",function(){
	$("div").remove("#myci2");
})
$(document).on("mouseover",'#myci3',function(){
	var tub=document.getElementById('del3');
	tub.style.display="inline";
})
$(document).on("mouseout",'#myci3',function(){
	var tub=document.getElementById('del3');
	tub.style.display="none";
})
$(document).on("click",'#lef3',function(){
	var jian=document.getElementById('ts3');
	if(tianshu3>1){
		tianshu3--;
		jian.value=tianshu3;
	}else{
		jian.value=1;
	}
})
$(document).on("click","#rig3",function(){
	var jia=document.getElementById('ts3');
	tianshu3++;
	jia.value=tianshu3;
})
$(document).on("click","#del3",function(){
	$("div").remove("#myci3");
})
$(document).on("mouseover",'#myci4',function(){
	var tub=document.getElementById('del4');
	tub.style.display="inline";
})
$(document).on("mouseout",'#myci4',function(){
	var tub=document.getElementById('del4');
	tub.style.display="none";
})
$(document).on("click",'#lef4',function(){
	var jian=document.getElementById('ts4');
	if(tianshu4>1){
		tianshu4--;
		jian.value=tianshu4;
	}else{
		jian.value=1;
	}
})
$(document).on("click","#rig4",function(){
	var jia=document.getElementById('ts4');
	tianshu4++;
	jia.innerText=tianshu4;
})
$(document).on("click","#del4",function(){
	$("div").remove("#myci4");
})
$(document).on("mouseover",'#myci5',function(){
	var tub=document.getElementById('del5');
	tub.style.display="inline";
})
$(document).on("mouseout",'#myci5',function(){
	var tub=document.getElementById('del5');
	tub.style.display="none";
})
$(document).on("click",'#lef5',function(){
	var jian=document.getElementById('ts5');
	if(tianshu5>1){
		tianshu5--;
		jian.innerText=tianshu5;
	}else{
		jian.innerText=1;
	}
})
$(document).on("click","#rig5",function(){
	var jia=document.getElementById('ts5');
	tianshu5++;
	jia.innerText=tianshu5;
})
$(document).on("click","#del5",function(){
	$("div").remove("#myci5");
})