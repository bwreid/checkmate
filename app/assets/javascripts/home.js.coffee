class Home
    @document_ready: ->
      $('#login-form').on('click','a[data-clear-form]', Home.clear_form)
    @clear_form: (e) ->
      e.preventDefault()
      $('#login-form').slideUp(400)

$(document).ready(Home.document_ready)