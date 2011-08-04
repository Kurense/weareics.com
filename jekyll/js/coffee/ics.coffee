highlightNavigation = () ->
  $.each $("#navigation, #subnavigation").find("a"), (index, link) ->
    prefix = $(link).attr("prefix") || $(link).attr("href")
    if (window.location.pathname.indexOf(prefix) == 0)
      $(link).addClass("selected")

startBanners = () ->
  $("#banners .banner").hide()
  $("#banners .banner:first-child").show()

  t = null

  showNextBanner = () =>
    next = $("#banners .banner:visible").next()
    if (next.length == 0)
      next = $("#banners .banner").first()

    showBanner(next)
    t = setTimeout(showNextBanner, 6000)

  showBanner = (next) ->
    curr = $("#banners .banner:visible")
    $("#banners").css("background-image", "url(#{curr.find("img").attr("src")})")
    $("#banners .banner").hide()
    next.fadeIn(1000)

  setTimeout(showNextBanner, 6000)

$(document).ready ->
  highlightNavigation()
  startBanners();
