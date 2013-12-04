Feature: Create Account
	As a player	
	So that I can contribute to the website
	I want the ability to have an account

	Scenario: Create an account for Project Ice Cube
		Given I have clicked on signup
		When I type in "C-Loud" for username
		And I type in "cloud@square.com" for email
		And I type in "1997-31-01" for date of birth
		And I type in "I don't wanna do that anymore because of the low poly"	for slogan
		And I click on submit
		Then I will I have an account under the name "C-Loud"
