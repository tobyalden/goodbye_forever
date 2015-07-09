class AddTimeSoldOutToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :time_sold_out, :datetime
  end
end
