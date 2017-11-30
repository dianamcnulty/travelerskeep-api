class ChangeContentToBeNotNullInStories < ActiveRecord::Migration[5.1]
  def change
    change_column :stories, :content, :string, null: false
  end
end
