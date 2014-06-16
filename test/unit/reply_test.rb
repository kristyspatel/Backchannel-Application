require 'test_helper'

class ReplyTest < Test:Unit::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_reply_cannot_be_empty
    reply1=Reply.new
    !assert_valid(reply1)
  end


  end
