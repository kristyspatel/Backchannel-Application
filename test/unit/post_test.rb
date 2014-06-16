require 'test_helper'

class PostTest < Test:Unit::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_post_cannot_be_empty
  post1=category.new
  !assert_valid(post1)
  end


end
