Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
		User.create!(user)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  #flunk "Unimplemented"
end

Given /^I am on the signin page$/ do
  visit signin_path
end

Given /^I am on the signup page$/ do
  visit signup_path
end

Then /^I should see an error message$/ do
	page.has_content?("Invalid email/password combination" || "Password doesn't match confirmation")
  #expect(page).to have_selector('div.alert.alert-error')
end
When /^I fill "(.*?)" with: "(.*?)"$/ do |type, data|
	fill_in :"#{type}", with: data
	# drying out this poop code
	#if (type == "user_name")
	#	fill_in :user_name, with: data
	#end
	#if (type == "password")
	#	fill_in :password, with: data
	#end
end

When /^I click the Sign In button$/ do
	click_button "Sign In"
end

When /^I click the Sign Up button$/ do
	click_button "Sign Up"
end

Then /^I should be signed in as: (".*?)"$/ do |data|
	page.has_content?(data)
end

Then /^I should see a signout link$/ do
	page.has_content?("Sign out")
end