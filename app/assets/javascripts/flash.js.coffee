do ($ = jQuery) ->
  $.fn.flash = (message, type) ->
    # opts = $.extend {}, $.fn.flash.options, opts
    flashElement = $('<div class="alert fade in"></div>')
    closeButton = $('<button class="close" data-dismiss="alert">&times</button>')

    try
      throw new Error("message should be a string") if $.type(message) != "string"
        
      @each ->
        elem = $(@)
        # Hide our flash until it's ready
        elem.hide()
        # clear out our flash container's content
        elem.html('')

        # if a type is specified, add the appropriate alert type class
        if type
          flashElement.addClass("alert-#{type}")
        
        # populate our flash and insert it into our container element
        flashElement.html(message).append(closeButton).prependTo(elem)

        elem.fadeIn().delay(4000).fadeOut()
    catch e
      throw e

jQuery ->
  $('#flash').on 'show', ->
    $('#flash').delay(4000).fadeOut()