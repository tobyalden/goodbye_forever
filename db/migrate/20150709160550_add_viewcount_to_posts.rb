class AddViewcountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :copies_remaining, :int, default: 1
  end
end
