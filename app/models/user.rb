# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follow_requests_as_follower, foreign_key: :follower_id, class_name: 'FollowRequest'
  has_many :follow_requests_as_followed, foreign_key: :followed_id, class_name: 'FollowRequest'

  has_one_attached :profile_picture

  after_create :send_welcome_email

  def profile_picture_url
    if profile_picture.attached?
      Rails.application.routes.url_helpers.rails_blob_url(profile_picture, only_path: true)
    else
      gravatar_url
    end
  end

  private

  def gravatar_url
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email.downcase)}"
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end
end
