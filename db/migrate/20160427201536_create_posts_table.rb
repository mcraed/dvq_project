class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.integer		:user_id
  		t.datetime	:created
  		t.string		:body
  	end
  end
end
