$(function(){
    //计算元素集合的总宽度
    function mcalSumWidth(elements) {
        var width = 0;
        $(elements).each(function () {
            width += $(this).outerWidth(true);
        });
        return width;
    }
    //滚动到指定选项卡
    function mscrollToTab(element) {
        var marginLeftVal = mcalSumWidth($(element).prevAll()), marginRightVal = mcalSumWidth($(element).nextAll());
        // 可视区域非tab宽度
        var tabOuterWidth = mcalSumWidth($(".ad-main-nav-box").children().not(".ad-main-wraper"));
        //可视区域tab宽度
        var visibleWidth = $(".ad-main-nav-box").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".ad-main-list").outerWidth() < visibleWidth) {
            scrollVal = 0;
        } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
            if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                scrollVal = marginLeftVal;
                var tabElement = element;
                while ((scrollVal - $(tabElement).outerWidth()) > ($(".ad-main-list").outerWidth() - visibleWidth)) {
                    scrollVal -= $(tabElement).prev().outerWidth();
                    tabElement = $(tabElement).prev();
                }
            }
        } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
            scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
        }
        $('.ad-main-list').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    //查看左侧隐藏的选项卡
    function mscrollTabLeft() {
        var marginLeftVal = Math.abs(parseInt($('.ad-main-list').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = mcalSumWidth($(".ad-main-nav-box").children().not(".ad-main-wraper"));
        //可视区域tab宽度
        var visibleWidth = $(".ad-main-nav-box").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".ad-main-list").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".ad-main-list li:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            if (mcalSumWidth($(tabElement).prevAll()) > visibleWidth) {
                while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                    offsetVal += $(tabElement).outerWidth(true);
                    tabElement = $(tabElement).prev();
                }
                scrollVal = mcalSumWidth($(tabElement).prevAll());
            }
        }
        $('.ad-main-list').animate({
            marginLeft: 0 - scrollVal + 'px'
        }, "fast");
    }
    //查看右侧隐藏的选项卡
    function mscrollTabRight() {
        var marginLeftVal = Math.abs(parseInt($('.ad-main-list').css('margin-left')));
        // 可视区域非tab宽度
        var tabOuterWidth = mcalSumWidth($(".ad-main-nav-box").children().not(".ad-main-wraper"));
        //可视区域tab宽度
        var visibleWidth = $(".ad-main-nav-box").outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".ad-main-list").width() < visibleWidth) {
            return false;
        } else {
            var tabElement = $(".ad-main-list li:first");
            var offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) <= marginLeftVal) {//找到离当前tab最近的元素
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            offsetVal = 0;
            while ((offsetVal + $(tabElement).outerWidth(true)) < (visibleWidth) && tabElement.length > 0) {
                offsetVal += $(tabElement).outerWidth(true);
                tabElement = $(tabElement).next();
            }
            scrollVal = mcalSumWidth($(tabElement).prevAll());
            if (scrollVal > 0) {
                $('.ad-main-list').animate({
                    marginLeft: 0 - scrollVal + 'px'
                }, "fast");
            }
        }
    }
    // 点击选项卡菜单
    function mactiveTab() {
        
        if (!$(this).hasClass('over')) {
            $(this).addClass('over').siblings('.ad-main-list li').removeClass('over');
            mscrollToTab(this);
        }
    }

    $('.ad-main-list li').on('click',mactiveTab);

    // 左移按扭
    $('.J_mainLeft').on('click', mscrollTabLeft);

    // 右移按扭
    $('.J_mainRight').on('click', mscrollTabRight);

})