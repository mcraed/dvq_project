class User < ActiveRecord::Base
	has_many :posts
end

class Post < ActiveRecord::Base
	belongs_to :user
end

class UserPost < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end