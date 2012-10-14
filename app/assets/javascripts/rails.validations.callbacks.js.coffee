ClientSideValidations.callbacks.element.fail = (element, message, callback) ->
  callback()
  if element.data('valid') != false
    element.closest('.row').addClass('error')
    # element.closest('.row').removeClass('success')

ClientSideValidations.callbacks.element.pass = (element, callback) ->
  # element.closest('.row').addClass('success')
  element.parent().find('small.error').remove()
  element.closest('.row').removeClass('error')
