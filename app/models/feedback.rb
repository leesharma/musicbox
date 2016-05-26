# == Schema Information
#
# Table name: feedback
#
#  id         :integer          not null, primary key
#  message    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Represents a piece of feedback
class Feedback < ActiveRecord::Base
  validates :message, presence: true

  # Returns a hash of attributes. Used in API responses.
  # @return [Hash]  hash containing the selected attributes
  def json_attributes
    json_attrs = %w(message)
    attributes.select { |attr, _| attr.in? json_attrs }
  end
end
