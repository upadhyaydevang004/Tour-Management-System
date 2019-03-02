require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without email" do
    agent = Agent.new
    agent.email = ""
    assert_not agent.save
  end

  test "should not save user with invalid email" do
    agent = Agent.new
    agent.name = "User"
    agent.email = "abc"
    agent.password = "password"
    assert_not agent.save
  end

  test "should not save user with password less than 8 chars" do
    agent = Agent.new
    agent.name = "User"
    agent.email = "user@gmail.com"
    agent.password = "pas"
    assert_not agent.save
  end

end
