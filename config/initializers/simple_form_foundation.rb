# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :foundation, tag: 'div', class: 'row', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.wrapper tag: 'div', class: 'two mobile-one columns' do |ba|
      ba.wrapper tag: 'label', class: 'right inline' do |bb|
        bb.use :label_text
      end
    end

    b.wrapper tag: 'div', class: 'four mobile-three columns' do |ba|
      ba.use :input #, class: 'eight'
      ba.use :error, wrap_with: { tag: 'small', class: 'error' }
    end
    b.wrapper tag: 'div', class: 'six columns hide-for-small hide-for-medium' do |ba|
      ba.use :hint,  wrap_with: { tag: 'p', class: 'hint' }
    end
  end

  # config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'error' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.use :label
  #   b.wrapper tag: 'div', class: 'controls' do |input|
  #     input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
  #       prepend.use :input
  #     end
  #     input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  #     input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  #   end
  # end

  # config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
  #   b.use :html5
  #   b.use :placeholder
  #   b.use :label
  #   b.wrapper tag: 'div', class: 'controls' do |input|
  #     input.wrapper tag: 'div', class: 'input-append' do |append|
  #       append.use :input
  #     end
  #     input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
  #     input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
  #   end
  # end
  
  config.default_wrapper = :foundation
end
