class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.datetime :end_at
      t.string :state
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
