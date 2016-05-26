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

# Represents a piece of feedback
class Feedback < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true
  validates :user,    presence: true,
                      on: :create

  # Returns a hash of attributes. Used in API responses.
  # @return [Hash]  hash containing the selected attributes
  def json_attributes
    json_attrs = %w(message)
    attributes
      .select { |attr, _| attr.in? json_attrs }
      .merge 'user' => user.email
  end
end
