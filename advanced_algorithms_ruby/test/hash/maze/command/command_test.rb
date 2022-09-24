require 'test/unit'
require File.join(File.dirname(__FILE__), '..' , '..', '..', '..', 'hash', 'maze', 'command', 'command.rb')

class CommandTest < Test::Unit::TestCase

	def test_execute
    assert_raises NotImplementedError do
      Command.new.execute
    end
	end
end
