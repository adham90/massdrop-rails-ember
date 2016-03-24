class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.string :cover_image

      t.timestamps null: false
    end
  end
end
