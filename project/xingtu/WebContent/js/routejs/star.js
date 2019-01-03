window.onload=function(){
	var images=document.getElementsByClassName("stars");
	var comment=['差','一般','中等','良好','优秀'];
	var txt=document.getElementById('txt');
	var tag=false;
	var whichClick=0;
	for(var i=0; i<images.length; i++){
		images[i].onmouseover = function(){
			var which=this.title;
			txt.innerHTML=comment[which-1];
			if(this.title<3){
				for(var j=0; j<this.title; j++){
					images[j].src="images/star1.png";
				}
			}else{
				for(var j=0; j<this.title; j++){
					images[j].src="images/star2.png";
				}
			}
			for(var j=this.title; j<images.length;j++){
				images[j].src="images/star0.png";
			}
		}
		images[i].onmouseout=function(){
			console.log(whichClick);
			if(tag){
				if(whichClick<2){
					for(var j=0; j<whichClick;j++){
						images[j].src="images/star1.png";
					}
				}else{
					for(var j=0; j<whichClick;j++){
						images[j].src="images/star2.png";
					}
				}
				
				for(var j=whichClick; j<images.length;j++){
					images[j].src="images/star0.png";
				}	
				txt.innerHTML=comment[whichClick-1];
				return;	
			}
			for(var j=0; j<images.length;j++){
				images[j].src="images/star0.png";
			}
			txt.innerHTML='';
		}
		images[i].onclick=function(){
			tag=(tag==true?false:true);
			whichClick=this.title;
		}
	}
}