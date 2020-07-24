class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title,null:false
      t.text :implession, limit: 200, null:false
      t.string :img,null: false
      t.timestamps
    end
  end
end
