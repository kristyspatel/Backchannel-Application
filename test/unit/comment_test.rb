require 'test_helper'

class CommentTest < Test:Unit::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_comment_cannot_be_empty
    comment1=Comment.new
    !assert_valid(comment1)
    end

  end
