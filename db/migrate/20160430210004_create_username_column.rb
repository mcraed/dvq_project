class CreateUsernameColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :username, :string
  	add_column :posts, :created, :datetime
  end
end
