class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :owner
  has_one_attached :image

  validates :image, presence: true
  validates :area_id, numericality: { other_than: 1 } 
end
