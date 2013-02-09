class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.integer :box_id
      t.string :desc

      t.timestamps
    end
  end
end
