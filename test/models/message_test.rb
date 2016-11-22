require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "mentions returns senders name" do
    @message.content = "@example2"
    assert @message.mentions
  end

  test "mentions is nil for messages that do not @ another user by name" do
    @message.content = "example2"
    assert @message.mentions.blank?
  end
end
