module API::V1
  # Responsible for static API content
  class StaticPagesController < ApplicationController
    # GET /
    def index
      res = {
        name: 'Musicbox',
        description: 'Helping people listen.',
        version: 'v1'
      }
      render json: res
    end
  end
end
