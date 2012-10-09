# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require underscore
#= require bootstrap
#= require bootstrap_ujs
#= require select2
#= require jquery.validate
#= require jquery.validate.additional-methods
#= require validations
#= require handlebars.runtime
#= require i18n
#= require i18n/translations
#= require rails.validations
#= require rails.validations.simple_form
#= require_tree ./templates
#= require_self
#= require_tree .

$.ajaxSetup
  dataType: 'json'

$ ->
  window.Rails = 
    controller_name: $('body').data('controller')
    action_name: $('body').data('action')
    resource_name: $('body').data('resource')

# fromPrototype = (prototype, object) ->
#   newObject = Object.create(prototype)
#   `for(prop in object)
#     {
#       if(object.hasOwnProperty(prop))
#         newObject[prop] = object[prop];
#     }`
#   return newObject


# window.Rails=fromPrototype Array,
#   register_init: (names, fun) ->
#     if(typeof(names.forEach) == 'undefined')
#       n=names
#       names=[n]
#     for n in names
#       previously_registered=this[n]
#       this[n]=() ->
#         if(typeof(previously_registered) != 'undefined')
#           previously_registered.call()
#         fun.call()
#   init: (name) ->
#     if(typeof(this[name]) != 'undefined')
#       this[name]()