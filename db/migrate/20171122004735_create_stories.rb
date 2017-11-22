class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.references :vacation, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
