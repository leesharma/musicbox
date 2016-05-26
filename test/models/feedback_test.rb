# == Schema Information
#
# Table name: feedback
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'should require a message' do
    feedback = build(:feedback, message: nil)
    refute feedback.valid?
  end

  test '#json_attributes should return selected attributes' do
    feedback = build(:feedback, message: 'hello world')
    subject  = feedback.json_attributes
    expected = { 'message' => 'hello world' }

    assert_equal expected, subject
  end
end
