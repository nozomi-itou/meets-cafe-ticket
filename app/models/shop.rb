class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :owner
  has_many :comments
  has_one_attached :image

  validates :image, presence: true
  validates :area_id, numericality: { other_than: 1 } 
end
