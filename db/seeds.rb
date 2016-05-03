#User.delete_all /if you use this, put this at the top to delete all the users first; then will run through and create all of the users (again). if you dont, it will just create more users and you might end up with errors (same user id)
User.delete_all
Post.delete_all

User.create(:email => "l@gmail.com", :fname => "Linda", :lname => "Lacey" , :username => "llacey" , :password => "12345")
User.create(:email => "t@gmail.com" , :fname => "Thomas", :lname => "Red" , :username => "tred44" , :password => "12345")
User.create(:email => "z@gmail.com" , :fname => "Jordan", :lname => "Johnson" , :username => "jjohn18" , :password => "12345")
User.create(:email => "c@gmail.com", :fname => "Sally", :lname => "Henson" , :username => "sally_is_great" ,password:"12345")
User.create(:email => "f@gmail.com" , :fname => "Free", :lname => "Press", :username => "f_press" ,:password => "12345")
User.create(:email => "i@gmail.com" , :fname => "Jimi", :lname => "Hendrix", :username => "bold_is_love" , :password => "12345")
User.create(:email => "at@gmail.com" , :fname => "Elle", :lname => "Fo", :username => "efo99" , :password => "12345")
User.create(:email => "for@gmail.com" , :fname => "Five", :lname => "Four", :username =>"my_parents_arent_good_with_names" , :password => "12345")

Post.create(:user_id => 1 , :username => "llacey", :body => "greatblog spot first post")
Post.create(:user_id => 2 , :username => "tred44", :body => "mmmm maybe i should make some food")
Post.create(:user_id => 3 , :username => "jjohn18", :body => " woo had a fun weekend!")
Post.create(:user_id => 4 , :username => "sally_is_great", :body => "waiting for the weekend")
Post.create(:user_id => 5 , :username => "f_press", :body => "ughhhh monday noo")
Post.create(:user_id => 6 , :username => "bold_is_love", :body => "the backgound is too colorful change it ")
Post.create(:user_id => 7 , :username => "efo99", :body => "freezing in this room ")
Post.create(:user_id => 8	, :username => "my_parents_arent_good_with_names", :body => " welp off to work i go! ")