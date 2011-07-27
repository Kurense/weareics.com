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
    var showBanner, showNextBanner, t;
    t = null;
    showBanner = function(banner) {
      $("#banners .banner").hide();
      banner.show();
      $("#banners a").removeClass("selected");
      return $("#banners a:nth-child(" + ($(banner).index() + 1) + ")").addClass("selected");
    };
    showNextBanner = __bind(function() {
      var next;
      next = $("#banners .banner:visible").next();
      if (next.length === 0) {
        next = $("#banners .banner").first();
      }
      showBanner(next);
      return t = setTimeout(showNextBanner, 6000);
    }, this);
    $("#banners .links a").click(function() {
      clearTimeout(t);
      return showBanner($("#banners .banner:nth-child(" + ($(this).index() + 1) + ")"));
    });
    return showNextBanner();
  };
  $(document).ready(function() {
    highlightNavigation();
    return startBanners();
  });
}).call(this);
