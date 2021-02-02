class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :owner
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :shop_name 
    validates :address
    validates :phone, format: { with: /\A[0-9]{2,4}-[0-9]{2,4}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }, length: { maximum: 13 }
    
    validates :open_close
    validates :drink
    validates :area_id
    validates :owner_id
    validates :image
  end

  validates :area_id, numericality: { other_than: 1 } 

  def self.search(search)
    if search != ""
      Shop.where('shop_name LIKE(?)', "%#{search}%")
    else
      Shop.all
    end
  end

end
