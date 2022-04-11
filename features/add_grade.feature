Feature: Add Grade
    Scenario: signed in and adding a grade
        Given there are grades in the gradebook
        And I sign in
        When I visit the homepage
        And I click "New Grade"
        And I fill out the form and submit
        Then I should have added a grade
