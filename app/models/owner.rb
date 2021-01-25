class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shops

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :encrypted_password,:password,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :last_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :last_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :address
    validates :phone_number, numericality: { with: /\A[0-9]\z/, message: "is invalid." }, length: { maximum: 11 }
  end

  validates :area_id, numericality: { other_than: 1 } 
end
