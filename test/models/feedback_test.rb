# == Schema Information
#
# Table name: feedback
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'should require a message' do
    feedback = build(:feedback, message: nil)
    refute feedback.valid?
  end

  test 'should have a user on create' do
    feedback = build(:feedback, user: nil)
    refute feedback.valid?
  end

  test 'may have no user on update' do
    feedback = create(:feedback)
    feedback.user = nil
    assert feedback.valid?
  end

  test '#json_attributes should return selected attributes' do
    feedback = build(:feedback,
                     message: 'hello world',
                     email: 'foo@example.com')
    subject  = feedback.json_attributes
    expected = { 'message' => 'hello world', 'user' => 'foo@example.com' }

    assert_equal expected, subject
  end
end
