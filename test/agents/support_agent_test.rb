require "test_helper"

class SupportAgentTest < ActiveAgent::TestCase
  test "help" do
    generation = SupportAgent.help
    assert_not_nil generation
    # Test the generation by calling generate_now if needed
    # response = generation.generate_now
  end
end
