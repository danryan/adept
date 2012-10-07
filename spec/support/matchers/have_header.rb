RSpec::Matchers.define :have_header do |expected|
  match do |actual|
    if value
      headers.has_key?(key)
      if value.is_a?(Regexp)
        actual_value =~ value
      else
        actual_value == value
      end
    else
      headers.has_key?(expected.to_s)
    end
  end

  chain :with do |value|
    @value = value
  end

  failure_message_for_should do |actual|
    message = "expected headers to have '#{key}'"
    message += " containing '#{value}'" if value
    message += ", got '#{key}'"
    message += " with value of '#{actual_value}'" if value
    message
  end

  failure_message_for_should_not do |actual|
    message = "expected body to not have '#{key}'"
    message += " with value of '#{value}'" if value
    message += ", got '#{key}'"
    message += " containing '#{actual_value}'" if value
    message
  end

  description do
    message = "have header '#{expected}'"
    message += " containing #{sanitize_value(value)}" if value
    message
  end

  def headers
    actual.headers
  end

  def key
    expected.first.to_s
  end

  def actual_header
    headers.has_key?(key)
  end

  def actual_value
    headers[key]
  end

  def value
    @value
  end

  def sanitize_value(value)
    if value.is_a?(Regexp)
      value.inspect
    else
      "'value'"
    end
  end
end
