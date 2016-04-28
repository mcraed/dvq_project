class RemoveDatetimeColumn < ActiveRecord::Migration
  def change
  	remove_column :posts, :created, :datetime
  	remove_column :post, :created_at, :datetime
  	remove_column :post, :updated_at, :datetime
  end
end
