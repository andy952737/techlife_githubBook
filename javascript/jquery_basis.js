//尋找元件
	// *, element, #id, .class, selector1, selector2
	// not, first, last, even, odd, eq, gt, lt, header, animated, focus, 
 	// contains('text'), empty, parent, has(selector)
 	// hidden, visible
 	// nth-child(expr), first-child, last-child, only-child
 	// [attribute], [attribute='value'], [attribute!='value'], [attribute^='value'],
 	// [attribute$='value'], [attribute*='value'], [attribute|='value'], [attribute~='value'], [attribute][attribute2]
 	
 	// 表單
 	// input, text, password, radio, checkbox, submit, image, reset, button, file, selected, enabled
 	// disabled, checked

$(function(){

	//jquery元件操作
	//取得變更內容
	$("li.not").html();
	$("li.not").text();
	$("li.not").replaceWith();
	$("li.not").remove();

	//元件
	$("li.not").before(nodes...: Node|DOMString);
	$("li.not").after(nodes...: Node|DOMString);
	$("li.not").prepend(nodes...: Node|DOMString);
	$("li.not").append(nodes...: Node|DOMString);
	$("li.not").remove();
	$("li.not").close(); 
	$("li.not").unwrap();
	$("li.not").detach();
	$("li.not").empty();
	$("li.not").add();
	$("li.not").attr();
	$("li.not").removeAttr();
	$("li.not").addClass();
	$("li.not").removeClass();
	$("li.not").css();

	//表單值
	$("li.not").val();
	$("li.not").isNumeric();
	
	//尋找元件
	$("li.not").find();
	$("li.not").closest();
	$("li.not").parent();
	$("li.not").parents();
	$("li.not").children();
	$("li.not").siblings();
	$("li.not").next();
	$("li.not").nextAll();
	$("li.not").prew();
	$("li.not").prewAll();

	//篩選/測試
	$("li.not").filter();
	$("li.not").not();
	$("li.not").has();
	$("li.not").is();
	$("li.not").contains();

	//尺寸
	$("li.not").height();
	$("li.not").width();
	$("li.not").innerHeight();
	$("li.not").innerWidth();
	$("li.not").outerHeight();
	$("li.not").outerWidth();
	$(document).height();
	$(document).width();
	$(window).height();
	$(window).width();

	//位置
	$("li.not").offset();
	$("li.not").position();
	$("li.not").scrollLeft();
	$("li.not").scrollTop();

	//特效動畫
	$("li.not").show();
	$("li.not").hide();
	$("li.not").toggle();

	//淡化
	$("li.not").fadeIn();
	$("li.not").fadeOut();
	$("li.not").fadeTo();
	$("li.not").fadeToggle();

	//滑動
	$("li.not").slideDown();
	$("li.not").slideUp();
	$("li.not").slideToggle();

	//自訂
	$("li.not").delay();
	$("li.not").stop();
	$("li.not").animate();

	//事件
	$(document).ready();
	$("li.not").load();

	//使用者互動
	$("li.not").on(); // on(); 可搭配: .hover(), click(), submit()來使用
	
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

