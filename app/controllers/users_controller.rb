class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def splash
  end
end
