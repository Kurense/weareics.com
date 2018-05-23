const highlightNavigation = () =>
  $.each($("#navigation, #subnavigation").find("a"), function(index, link) {
    const prefix = $(link).attr("prefix") || $(link).attr("href");
    if (window.location.pathname.indexOf(prefix) === 0) {
      $(link).addClass("selected");
    }
  })
;

const startBanners = function() {
  let timer = null;

  $("#banners .banner:first-child").show();
  $("#banners #dots .dot:first-child").addClass("selected");

  $("#banners #dots .dot").click(function() {
    clearTimeout(timer);
    const next = $(`#banners .banner:nth-child(${$(this).index() + 1})`);
    showBanner(next);
  });

  var showNextBanner = () => {
    let next = $("#banners .banner:visible").last().next();
    if (next.length === 0) {
      next = $("#banners .banner").first();
    }

    showBanner(next);
    timer = setTimeout(showNextBanner, 6000);
  };

  var showBanner = function(next) {
    const curr = $("#banners .banner:visible");
    $("#banners #images").css("background-image", `url(${curr.find("img").attr("src")})`);

    const wasAnimating = $("#banners .banner:animated").length > 0;
    $("#banners .banner").stop(true, true).hide();

    if (wasAnimating) {
      next.show();
    } else {
      next.fadeIn(1000);
    }

    $("#banners #dots .dot").removeClass("selected");
    $(`#banners #dots .dot:nth-child(${next.index() + 1})`).addClass("selected");
  };

  setTimeout(showNextBanner, 6000);
};

$(document).ready(function() {
  highlightNavigation();
  startBanners();
});
