class RemoveNameAndDescriptionFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :name
    remove_column :posts, :description
  end
end
