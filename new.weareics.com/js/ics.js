(function() {
  var highlightNavigation, startBanners;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  highlightNavigation = function() {
    return $.each($("#navigation, #subnavigation").find("a"), function(index, link) {
      var prefix;
      prefix = $(link).attr("prefix") || $(link).attr("href");
      if (window.location.pathname.indexOf(prefix) === 0) {
        return $(link).addClass("selected");
      }
    });
  };
  startBanners = function() {
    var showBanner, showNextBanner, timer;
    timer = null;
    $("#banners .banner:first-child").show();
    $("#banners #dots .dot:first-child").addClass("selected");
    $("#banners #dots .dot").click(function() {
      var next;
      next = $("#banners .banner:nth-child(" + ($(this).index() + 1) + ")");
      showBanner(next);
      return clearTimeout(timer);
    });
    showNextBanner = __bind(function() {
      var next;
      next = $("#banners .banner:visible").last().next();
      if (next.length === 0) {
        next = $("#banners .banner").first();
      }
      showBanner(next);
      return timer = setTimeout(showNextBanner, 6000);
    }, this);
    showBanner = function(next) {
      var curr, wasAnimating;
      curr = $("#banners .banner:visible");
      $("#banners #images").css("background-image", "url(" + (curr.find("img").attr("src")) + ")");
      wasAnimating = $("#banners .banner:animated").length > 0;
      $("#banners .banner").stop(true, true).hide();
      if (wasAnimating) {
        next.show();
      } else {
        next.fadeIn(1000);
      }
      $("#banners #dots .dot").removeClass("selected");
      return $("#banners #dots .dot:nth-child(" + (next.index() + 1) + ")").addClass("selected");
    };
    return setTimeout(showNextBanner, 6000);
  };
  $(document).ready(function() {
    highlightNavigation();
    return startBanners();
  });
}).call(this);
