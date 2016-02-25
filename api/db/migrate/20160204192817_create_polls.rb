class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :state
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
