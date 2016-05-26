# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should have an email' do
    user = build(:user, email: nil)
    refute user.valid?
  end

  test 'should have a unique email' do
    create(:user, email: 'foo@example.com')
    user = build(:user, email: 'foo@example.com')
    refute user.valid?
  end

  test 'can have much feedback' do
    user = User.new
    assert_respond_to user, :feedback
    assert_respond_to user.feedback, :each # test if enumerable
  end
end
