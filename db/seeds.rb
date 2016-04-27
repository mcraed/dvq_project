#User.delete_all /if you use this, put this at the top to delete all the users first; then will run through and create all of the users (again). if you dont, it will just create more users and you might end up with errors (same user id)


#User.create([
	
# {username: ' ', password: ' '}

# ]) 

#Post.create([
	
# {user_id: users[0].id} 
	
# ])

#irb > require './db/seeds.rb'

#run it only once 
