class ErrorsController < ApplicationController
  def not_found
    render json: { 'error' => 'Page not found' },
                 status: :not_found
  end

  def unprocessable_entity
    render json: { 'error' => 'Unprocessable entity' },
                 status: :unprocessable_entity
  end

  def internal_server_error
    render json: { 'error' => 'Internal server error' },
                 status: :internal_server_error
  end
end
