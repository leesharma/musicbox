module API::V1
  # Base class for all API controller classes
  class BaseController < ApplicationController
    # Allow external API requests
    protect_from_forgery with: :null_session
  end
end
