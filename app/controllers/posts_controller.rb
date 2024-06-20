# app/controllers/posts_controller.rb
class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  
    def index
      following_ids = current_user.follow_requests_as_follower.where(status: 'accepted').pluck(:followed_id)
      @posts = Post.where(user_id: [current_user.id, *following_ids]).order(created_at: :desc)
    end
  
    def show
    end
  
    def new
      @post = Post.new
      @post.build_content
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  
    def like
      @post.likes.create(user: current_user)
      redirect_to @post
    end
  
    def unlike
      @post.likes.find_by(user: current_user)&.destroy
      redirect_to @post
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:content_attributes => [:body, :image])
    end
  end
  