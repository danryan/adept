ClientSideValidations.callbacks.element.fail = (element, message, callback) ->
  callback()
  # if !element.data('valid')
    # element.closest('.control-group').addClass('')

ClientSideValidations.callbacks.element.pass = (element, callback) ->
  element.closest('.control-group').addClass('success')
