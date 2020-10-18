$(function(){
	
	//選擇 not -> class
	$("li.not").addClass('complete');

	//each, html: li 
	$('li').each(function(){
		var ids = this.id;
		$(this).append(' <span class="order">' + ids + '</span>');
	});

	//event, e 是 事件的縮寫	
	$('li').on('click' function(e){
		$('li span').remove();
		var date = new Date();
		date.setTime(e.timeStamp);
		var clicked = date.toDateString();
		$(this).append('<span class="date">' + clicked + '' + e.type + '</span>');
	}); 

	//特效
	$('h2').hide().slideDown();
	var $li = $('li');
	$li.hide().each(function(index){
		$(this).delay(700 * index).fadeln(700);
	});
	$li.on('click', function(){
		$(this).fadeOut(700);
	});

	//程式碼準備就緒
	$(document).ready(function(){
		//code
	});
	$(function(){
		//code
	});


});  

