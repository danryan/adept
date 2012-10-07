# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # $('#repository-modal-alert').hide()
  $('#new_repository_modal').on 'ajax:error', (event, xhr, status) ->
    # $('#repository-modal-alert').addClass 'alert alert-error'
    # $('#repository-modal-alert').prepend "<button class='close' data-dismiss='alert'>&times</button><strong>Oops!</strong> There were errors with your form. Try again."
    # $('#repository-modal-alert').show()

    # errors = $.parseJSON(xhr.responseText)['errors']
    # console.log errors

  $('#new_repository_modal').on 'ajax:success', (event, xhr, status) ->
    $(this).modal('hide')

  $('#modal-form-submit').on 'click', (event) ->
    event.preventDefault()
    if $('#repository-modal-alert').length
      $('#repository-modal-alert').alert('close')
      $('#repository-modal-alert').on 'closed', (event) ->
        $('#new_repository').submit()
    else
      $('#new_repository').submit()

  $('#new_repository').on 'ajax:success', (event, xhr, status) ->
    console.log event
    console.log xhr


    # {
    #   "errors":{
    #     "name": ["can't be blank","is invalid"],
    #     "_type": ["can't be blank","is not included in the list"]
    #   }
    # }

    