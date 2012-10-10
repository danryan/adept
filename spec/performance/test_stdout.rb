require 'spec_helper'
require 'cabin'

class Foo

  def out
    @log = Cabin::Channel.new
    @log.subscribe(STDOUT)

    5.times { @log.info "FOOOOOO" }
  end
end

describe Foo do
  it "emits to STDOUT" do
    STDOUT.should_receive(:<<)
  end
end
