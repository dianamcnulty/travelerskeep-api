class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.string :country, null: false
      t.string :state
      t.references :user, index: true, foreign_key: true, null: false
      t.string :month
      t.integer :year, null: false
      t.string :companions

      t.timestamps
    end
  end
end
