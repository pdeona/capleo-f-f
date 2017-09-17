require 'test_helper'

class UserTest < ActiveSupport::TestCase
	# create_table "users", force: :cascade do |t|
  #   t.string "name"
  #   t.string "email"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.string "password_digest"
  #   t.index ["email"], name: "index_users_on_email", unique: true
  # end
  def setup
    @user = User.new(name: "pedro", email: "test@test.case",
                     password: 'tester1', password_confirmation: 'tester1')
  end

  test "new user objects are valid" do
    assert(@user)
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.save
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.save
  end

  test "email should be unique" do
    @user.save
    user2 = User.new(name: "warren", email: "test@test.case")
    assert_not user2.save
  end

  test "invalid email should not work" do
    @user.email = "pedro"
    assert_not @user.save
  end

  test "email case should not impact uniqueness" do
    @user.save
    user2 = User.new(name: "warren", email: "TEST@tEsT.casE")
    assert_not user2.save
  end

  test "password should be present" do
    @user.password = @user.password_confirmation =  ""
    assert_not @user.save
  end

  test "password should be at least 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.save
  end
end
