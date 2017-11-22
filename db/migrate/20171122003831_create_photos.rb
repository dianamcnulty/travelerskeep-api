class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :url, null: false
      t.string :caption
      t.references :vacation, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
