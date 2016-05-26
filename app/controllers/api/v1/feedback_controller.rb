module API::V1
  # Manages user feedback
  class FeedbackController < ApplicationController
    # POST /feedback
    def create
      feedback = Feedback.new secure_params

      if feedback.save
        render json: feedback.json_attributes, status: :created
      else
        render json: feedback.json_attributes, status: :unprocessable_entity
      end
    end

    private

    # Protects against mass-assignment attacks by whitelisting params
    def secure_params
      params.require(:feedback).permit(:message, :user_id)
    end
  end
end
