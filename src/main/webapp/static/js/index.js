$(function(){


    //菜单点击
    $(".J_menuItem").on('click',function(){
        var url = $(this).attr('href');
		$(".left-li").removeClass("active");
		$(this).parent().addClass("active")
        $("#J_iframe").attr('src',url);
        return false;
    });
});
