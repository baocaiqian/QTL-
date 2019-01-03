//======================================================================
//
//        Copyright (C) 2009-2010 赵阳  
//        All rights reserved
//
//        filename : 投票结果柱状显示
//        description :投票结果柱状显示
//
//        created by 赵阳 at  2009年11月9日  21:09 PM
//        邮箱：zhaoyang314@163.com msn:zhaoyang314@pbo365.yahoo.com.cn
//
//======================================================================
$.fn.study_vote= function(options,totle){
	var settings=options;
	if(totle!=null)
	{
		if(isNaN(totle))
		{
			alert('参数错误');
			return;
		}
	}
	if(typeof(settings)!='object')
	{
		alert('参数错误');
		return;
	}
	var container = jQuery(this);
	container.html('<dl id="studyvote"></dl>');
	var study_voteCount=0;
	if(totle==null||totle=='')
	{//单项投票
		for(i=0;i<settings.length;i++)
		{
			study_voteCount += parseInt(settings[i].data);
		}
	}
	else
	{//多项投票
		study_voteCount = parseInt(totle);
	}
	var study_votestr="";
		for(i=0;i<settings.length;i++)
		{
			var studyplay_present=settings[i].data/study_voteCount*100;
			if(parseInt(studyplay_present)!=studyplay_present)
			{
				studyplay_present=studyplay_present.toFixed(2);
			}
			study_votestr +='<dd class="dd"><div class="fl">'+settings[i].name+'：</div><div class="outbar"><div class="inbar" style="width:'+studyplay_present+'%;background:'+settings[i].color+';"></div></div> <div class="fl">'+studyplay_present+'% </div></dd>';
		}
	container.find('#studyvote').html(study_votestr)
	}