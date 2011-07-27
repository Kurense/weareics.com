highlightNavigation = () ->
  $.each $("#navigation, #subnavigation").find("a"), (index, link) ->
    prefix = $(link).attr("prefix") || $(link).attr("href")
    if (window.location.pathname.indexOf(prefix) == 0)
      $(link).addClass("selected")

startBanners = () ->
  t = null

  showBanner = (banner) ->
    $("#banners .banner").hide()
    banner.show()

  showNextBanner = () =>
    next = $("#banners .banner:visible").next()
    if (next.length == 0)
      next = $("#banners .banner").first()

    showBanner(next)
    t = setTimeout(showNextBanner, 3000)

  $("#banners .links .link").click () ->
    clearTimeout(t)
    showBanner($("#banners .banner:nth-child(#{$(this).index() + 1})"))

  showNextBanner()

$(document).ready ->
  highlightNavigation()
  startBanners();
