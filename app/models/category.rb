class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新宿区' },
    { id: 3, name: '渋谷区' },
    { id: 4, name: '豊島区' },
    { id: 5, name: '中央区' },
    { id: 6, name: '千代田区' },
    { id: 7, name: '品川区' },
    { id: 8, name: '港区' },
    { id: 9, name: '目黒区' }
  ]

  include ActiveHash::Associations
  has_many :shops
  end