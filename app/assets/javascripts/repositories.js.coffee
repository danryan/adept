# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  resource = Rails.resource_name

  $('#new_repository').on 'ajax:success', (event, xhr, status) ->

    $('#new_repository_form').collapse('hide')
    this.reset()

    $('#flash').flash I18n.t('flash.actions.create.notice', resource_name: resource), 'success'

  $('#new_repository').on 'ajax:error', (event, xhr, status) ->
    $('#flash').flash I18n.t('flash.actions.create.alert', resource_name: resource), 'error'
    console.log event
    console.log xhr

    
    # {
    #   "errors":{
    #     "name": ["can't be blank","is invalid"],
    #     "_type": ["can't be blank","is not included in the list"]
    #   }
    # }

    