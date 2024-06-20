# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    following_ids = current_user.follow_requests_as_follower.where(status: 'accepted').pluck(:followed_id)
    @posts = Post.where(user_id: [current_user.id, *following_ids]).order(created_at: :desc)
  end
end
