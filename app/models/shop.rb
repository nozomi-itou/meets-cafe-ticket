class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :owner
  has_many :comments
  has_one_attached :image

  validates :image, presence: true
  validates :area_id, numericality: { other_than: 1 } 

  def self.search(search)
    if search != ""
      Shop.where('shop_name LIKE(?)', "%#{search}%")
    else
      Shop.all
    end
  end

end
