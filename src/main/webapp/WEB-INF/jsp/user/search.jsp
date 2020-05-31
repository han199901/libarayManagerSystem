<%--
  Created by IntelliJ IDEA.
  User: 韩勇
  Date: 2020/5/30
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>jQuery+CSS3创意搜索框特效</title>

    <link rel="stylesheet" type="text/css" href="../css/search-default.css" />

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../css/search-form.css" />

</head>
<body>

<form onSubmit="submitFn(this, event);">
    <img id="search-img" src="../images/search.gif" />
    <div class="search-wrapper">
        <div class="input-holder">
            <input type="text" class="search-input" placeholder="请输入关键词" />
            <button class="search-icon" onClick="searchToggle(this, event);"><span></span></button>
        </div>
        <span class="close" onClick="searchToggle(this, event);"></span>
        <div class="result-container">

        </div>
    </div>
</form>

<script src="../js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function searchToggle(obj, evt){
        var container = $(obj).closest('.search-wrapper');

        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
            // clear and hide result container when we press close
            container.find('.result-container').fadeOut(100, function(){$(this).empty();});
        }
    }

    function submitFn(obj, evt){
        value = $(obj).find('.search-input').val().trim();

        _html = "您搜索的关键词： ";
        if(!value.length){
            _html = "关键词不能为空。";
        }
        else{
            _html += "<b>" + value + "</b>";
        }

        $(obj).find('.result-container').html('<span>' + _html + '</span>');
        $(obj).find('.result-container').fadeIn(100);

        evt.preventDefault();
    }
</script>

</body>
</html>
