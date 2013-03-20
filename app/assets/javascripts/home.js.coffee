class Home
  @document_ready: ->
    $('#bankform').on('click', 'a[data-clear-form]', Home.clear_form)

  @clear_form: (e) ->
    e.preventDefault()
    $('#bankform').empty()

$(document).ready(Home.document_ready)