require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = User.new(first_name: 'Jean', last_name: 'Dupont', email: 'jean@dupont.fr')
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'first name should not be blank' do
    @user.first_name = '   '
    assert_not @user.valid?
  end

  test 'first name should not be too long' do
    @user.first_name = 'O' * 51
    assert_not @user.valid?
  end

  test 'last name should not be blank' do
    @user.last_name = '   '
    assert_not @user.valid?
  end

  test 'last name should not be too short' do
    @user.last_name = 'O'
    assert_not @user.valid?
  end

  test 'last name should not be too long' do
    @user.last_name = 'O' * 51
    assert_not @user.valid?
  end

  test 'email should not be blank' do
    @user.email = '   '
    assert_not @user.valid?
  end

  test 'email should not too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses should be saved as lowercase' do
    mixed_case_email = "Foo@exAmPLe.cOm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'flow_testing should be falsy by default' do
    assert !@user.flow_testing
  end
end
