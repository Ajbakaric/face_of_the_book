# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
