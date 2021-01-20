class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.text   :address, null: false
      t.string :phone, null: false  
      t.text   :open_close, null: false
      t.text   :drink, null: false  
      t.integer :category_id
      t.integer :area_id, null: false
      t.references :owner, null: false, foreign_key: true


      t.timestamps
    end
  end
end
