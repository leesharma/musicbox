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

FactoryGirl.define do
  factory :feedback do
    message 'hello world'
    user

    transient do
      sequence :email do |n|
        "feedback_user#{n}@example.com"
      end
    end

    # Set the custom email address if the user is set
    after(:build) do |feedback, evaluator|
      user = feedback.user
      if user
        user.email = evaluator.email
        user.save
      end
    end
  end
end
