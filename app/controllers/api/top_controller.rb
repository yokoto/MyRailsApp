module Api
  class TopController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end
  end
end