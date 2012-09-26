@after_blocks = []
def after_bundler(&block)
  @after_blocks << [@current_recipe, block]
end

@after_everything_blocks = []
def after_everything(&block)
  @after_everything_blocks << [@current_recipe, block]
end

@before_configs = {}
def before_config(&block)
  @before_configs[@current_recipe] = block
end

# ActiveRecord

after_bundler do
  rake "db:create:all"
end
