# RSpec::Matchers.define :have_json do |expected|
#   match do |actual|
#     actual = MultiJson.load(actual.body).with_indifferent_access
#     expected = MultiJson.load(expected) if expected.is_a?(String)
#     expected = expected.with_indifferent_access
#     actual.diff(expected) == {}
#   end

#   failure_message_for_should do |response|
#     body = MultiJson.load(response.body)
#     "expected that #{body} would have #{hash}"
#   end
# end

# RSpec::Matchers.define :have_json_key do |expected|
#   match do |actual|
#     actual = MultiJson.load(actual.body)

#     result = actual.key?(expected.to_s)
#     result &&= actual[expected.to_s] == @expected_val if @val_provided
#     result
#   end

#   chain :with_value do |val|
#     @val_provided = true
#     @expected_val = val
#   end

#   description do
#     result = "have json key #{expected.inspect}"
#     result << " with value #{@expected_val.inspect}" if @val_provided
#     result
#   end

#   failure_message_for_should do |actual|
#     "expected response " + description + ", was #{@body[expected_key.to_s].inspect}"
#   end
# end
