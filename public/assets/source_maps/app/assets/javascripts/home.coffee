class Home
<<<<<<< HEAD
    @document_ready: ->
      $('#login-form').on('click','a[data-clear-form]', Home.clear_form)
    @clear_form: (e) ->
      e.preventDefault()
      $('#login-form').slideUp(400)

$(document).ready(Home.document_ready)
=======
  @document_ready: ->
    $('#bankform').on('click', 'a[data-clear-form]', Home.clear_form)

  @clear_form: (e) ->
    e.preventDefault()
    $('#bankform').empty()

<<<<<<< HEAD
$(document).ready(Home.document_ready)
=======
$(document).ready(Home.document_ready);
>>>>>>> ec505f85937e655a6d198d2ec777f1107654ed22
>>>>>>> 8f7d4c32287ab42361ed5ebae984380214bd8366
