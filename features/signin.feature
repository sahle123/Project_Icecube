Feature: Signin and Signup
	As a player	
	So that I can contribute to the website
	I want the ability to have an account

Background: users have been added to database

  Given the following users exist:
  | user_name	| password	| email			| birth_date	| slogan			|
  | brain		| p1		| brain@ice.com	| 25-Nov-1992	| I like to think	|

Scenario: Unsuccessful signup; Password and Password Confirm don't match
	Given I am on the signup page
	When I fill "user_name" with: "new user"
	And I fill "password" with: "password"
	And I fill "password_confirmation" with: "wrong password"
	And I click the Sign Up button
	Then I should see an error message

Scenario: successful signup
	Given I am on the signup page
	When I fill "user_name" with: "billy"
	And I fill "password" with: "password"
	And I fill "password_confirmation" with: "password"
	And I fill "email" with: "billy@ice.com"
	And I fill "birth_date" with: "19-Sep-1989"
	And I fill "slogan" with: "I like trains"
	And I click the Sign Up button
	Then I should be signed in as: "billy"

Scenario: Unsuccessful signup; Same user name
	Given I am on the signup page
	When I fill "user_name" with: "brain"
	And I fill "password" with: "password"
	And I fill "password_confirmation" with: "password"
	And I fill "email" with: "brain@ice.com"
	And I fill "birth_date" with: "12-Sep-1991"
	And I fill "slogan" with: "I like to think"
	And I click the Sign Up button
	Then I should get a same name error

Scenario: Unsuccessful signin
	Given I am on the signin page
	When I fill "user_name" with: "error"
	And I fill "password" with: "lolnope"
	When I click the Sign In button
	Then I should see an error message

Scenario: Successful signin
	Given I am on the signin page
	When I fill "user_name" with: "brain"
	And I fill "password" with: "p1"
	And I click the Sign In button
	Then I should be signed in as: "brain"
	And I should see a signout link