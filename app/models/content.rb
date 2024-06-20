# app/models/content.rb
class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
  has_one_attached :image
end
