# app/models/post.rb
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :content, as: :contentable, dependent: :destroy

  accepts_nested_attributes_for :content
end
