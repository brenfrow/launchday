$ ->
  $(".warning input").keypress ->
    $(this).parent().removeClass("warning")
