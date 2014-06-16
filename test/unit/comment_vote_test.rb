require 'test_helper'

class CommentVoteTest < Test:Unit::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_commentvote_cannot_be_empty
    cv1=CommentVote.new
    !assert_valid(cv1)
    end

  end
