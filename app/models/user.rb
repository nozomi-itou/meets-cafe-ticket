class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_one :order

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #空の投稿を保存できないようにする

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :gender_id, numericality: { other_than: 1 } 

end
