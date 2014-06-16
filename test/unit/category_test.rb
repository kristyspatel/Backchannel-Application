require 'test_helper'

class CategoryTest < Test:Unit::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_category_cannot_be_empty
    cat1=Category.new
    !assert_valid(cat1)

  end
end
