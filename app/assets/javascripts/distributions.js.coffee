# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#distribution_component_list").select2
    tags: [ "main", "contrib", "unstable", "testing" ]
    tokenSeparators: [ ",", " " ]
    width: 'resolve'

  $("#distribution_architecture_list").select2
    tags: [ "amd64", "i386" ]
    tokenSeparators: [ ",", " " ]
    width: 'resolve'

  $("#new_distribution").validate
    rules:
      "distribution[architecture_list]":
        equals: [ "amd64", "i386", "source" ]
        required: true
