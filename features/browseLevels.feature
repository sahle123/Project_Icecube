Feature: Browse the Levels
	As a user,
	I would like to be able to browse through all of the different levels
	So that I can find one that I am interested in playing
Background: movies have been added to database

  Given the following levels exist:
  | title                   | avg_rating | level_ID | user_name     | type  | restriction |
  | Aladdin                 | 2          | 0001     | stinkyPete    | timed | 60          |
  | AnimalFarm              | 5          | 0002     | stormy        | moves | 20          |
	| Megaman                 | 4          | 0003     | doctorQuin    | none  | nil         |
	| X                       | 3.5        | 0004     | blackDeby     | both  | 20.20       |
	| Zero                    | 4.6        | 0005     | CaptainMuprhy | timed | 60          |

 	And  I am on the ProjectIceCube levels page

Scenario: Sort the levels by title
	When I select sortby title
	And I press refresh
	Then 'Zero' will be before 'X'
	
Scenario: restrict levels by a type
	When I check the following: "timed"
	And I uncheck the following: "moves"
	And I press refresh
	Then I should see the following: Aladdin, Zero


