require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "test name", email: "testemail@test.com")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should exist" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should exist" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "q" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "q" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email should throw away bad addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
