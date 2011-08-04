highlightNavigation = () ->
  $.each $("#navigation, #subnavigation").find("a"), (index, link) ->
    prefix = $(link).attr("prefix") || $(link).attr("href")
    if (window.location.pathname.indexOf(prefix) == 0)
      $(link).addClass("selected")

startBanners = () ->
  timer = null

  $("#banners .banner:first-child").show()
  $("#banners #dots .dot:first-child").addClass("selected")

  $("#banners #dots .dot").click ->
    next = $("#banners .banner:nth-child(#{$(this).index() + 1})")
    showBanner(next)
    clearTimeout(timer)

  showNextBanner = () =>
    next = $("#banners .banner:visible").next()
    if (next.length == 0)
      next = $("#banners .banner").first()

    showBanner(next)
    timer = setTimeout(showNextBanner, 6000)

  showBanner = (next) ->
    curr = $("#banners .banner:visible")
    $("#banners #images").css("background-image", "url(#{curr.find("img").attr("src")})")
    $("#banners .banner").hide()
    next.fadeIn(1000)

    $("#banners #dots .dot").removeClass("selected")
    $("#banners #dots .dot:nth-child(#{next.index() + 1})").addClass("selected")

  setTimeout(showNextBanner, 6000)

$(document).ready ->
  highlightNavigation()
  startBanners();
