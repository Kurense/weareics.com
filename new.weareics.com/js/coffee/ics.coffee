highlightNavigation = () ->
  $.each $("#navigation, #subnavigation").find("a"), (index, link) ->
    prefix = $(link).attr("prefix") || $(link).attr("href")
    if (window.location.pathname.indexOf(prefix) == 0)
      $(link).addClass("selected")

startBanners = () ->
  t = null

  showBanner = (next) ->
    curr = $("#banners .banner:visible")

    $("#banners .top").css("background-image", "url(#{curr.find("img").attr("src")})")
    $("#banners .banner").hide()

    next.fadeIn(300)

    $("#banners a").removeClass("selected")
    $("#banners a:nth-child(#{next.index() + 1})").addClass("selected")

  showNextBanner = () =>
    next = $("#banners .banner:visible").next()
    if (next.length == 0)
      next = $("#banners .banner").first()

    showBanner(next)
    t = setTimeout(showNextBanner, 6000)

  $("#banners .links a").click () ->
    clearTimeout(t)
    showBanner($("#banners .banner:nth-child(#{$(this).index() + 1})"))

  setTimeout(showNextBanner, 6000)

  $("#banners .banner:first-child").show()
  $("#banners .links a:first-child").addClass("selected")

$(document).ready ->
  highlightNavigation()
  startBanners();
