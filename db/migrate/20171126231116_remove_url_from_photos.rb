class RemoveUrlFromPhotos < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :url, :string
  end
end
