$(".company").click(function(){var e;return e=$(this).data("id"),$("#"+e).show(),$(".glass-panel").removeClass("fadeOut").addClass("animated fadeIn"),$(".popover-view").removeClass("slideOutLeft delayed").addClass("animated slideInLeft"),$(".popover-items").removeClass("slideOutLeft").addClass("animated slideInLeft delayed")}),$(".glass-panel").click(function(){return $(".glass-panel").removeClass("fadeIn").addClass("animated fadeOut"),$(".popover-view").removeClass("slideInLeft").addClass("animated slideOutLeft delayed"),$(".popover-items").removeClass("slideInLeft delayed").addClass("animated slideOutLeft"),setTimeout(function(){return $(".popover").hide()},1e3)});