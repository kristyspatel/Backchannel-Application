require 'test_helper'

class UserTest < Test:Unit::TestCase
  # test "the truth" do
  #   assert true
  # end
def test_user_cannot_be_empty
  user1=User.new
  !assert_valid(user1)
end


end
