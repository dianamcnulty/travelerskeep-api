class ChangeTitleToBeNotNullInStories < ActiveRecord::Migration[5.1]
  def change
    change_column :stories, :title, :string, null: false
  end
end
