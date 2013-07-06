register = do ->
  $ ->
    $("#webpage").change (e) ->
      self = $(this)
      self.closest(".field").after("<li id='app-picture' class='center'><img src='/img/ajax-loader.gif' /></li>")
      url = self.val()
      $.post("/register/ajax/picture",{src: url}, (data) ->
        $("#app-picture").find("img").attr("src", data.src))
