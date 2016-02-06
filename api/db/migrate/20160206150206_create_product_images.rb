class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images, id: false do |t|
      t.string :image_id
      t.boolean :main_image, default: false
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
