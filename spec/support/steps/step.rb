# module RSpec
#   module Core
#     class ExampleGroup
#       class << self
#         alias_method :scenario, :describe
#         alias_method :_when, :describe

#         define_example_method :When
#         define_example_method :Then
#       end
#     end
#     module SharedExampleGroup
#       alias_method :given, :shared_examples
#     end
#   end
# end
