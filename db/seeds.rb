# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

updates = [
			{:title => "Baby steps", :description => "Ladies and Gentlemen, I present to you a new kind of social interaction", :user_name => "butts"},
			{:title => "Setting Up Rspec", :description => "We're currently working to get rspec setup", :user_name => "butts"}
		]

users = [
			{:user_name => "butts", :email => "butts@butts.com", :password => "password", :password_confirmation => "password", :slogan => "kerblam", :mod => true},
			{:user_name => "jacob", :email => "rails@ruby.com", :password => "password1", :password_confirmation => "password1", :slogan => "I prefer php", :mod => true},
			{:user_name => "drbees", :email => "doctor@bees.com", :password => "bees", :password_confirmation => "bees", :slogan => "What's this a website woefully underpopulated by bees", :mod => false}
		]
levels = [
			{:user_name => "butts", :avg_rating => "5", :title => "Olympus", :description => "The Titans want revenage",:restriction_move => "30", :restriction_move => "0"},
			{:user_name => "drbees", :avg_rating => "2", :title => "BEES", :description => "My brief case full of bees",:restriction_move => "0", :restriction_move => "90"},
			{:user_name => "butts", :avg_rating => "3.5", :title => "Andes", :description => "A dangerous Yeti awaits",:restriction_move => "10", :restriction_move => "60"},
			{:user_name => "Jacob", :avg_rating => "4", :title => "The Darkest Souls", :description => "There's no time",:restriction_move => "0", :restriction_move => "50"},
		]
updates.each do |update|
	Update.create!(update)
end

users.each do |user|
	User.create!(user)
end

levels.each do |level|
	Level.create!(level)
end