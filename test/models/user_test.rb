require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Fullname return first and last name capitalizad" do
    user = User.new(first_name: 'raPhael', last_name: 'farIAS')
    assert_equal 'Raphael Farias', user.fullname
  end
end
