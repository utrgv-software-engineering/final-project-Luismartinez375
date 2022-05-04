Feature: Edit Grade
    Scenario: Editing a grade
      Given there are grades in the gradebook
      And I sign in
      When I visit the homepage
      Then I should see everyone's grades
      And I click "Edit" on a post
      And I edit the name and submit
      Then I should have updated the grade

    Scenario: NOT Editing a grade
      Given there are grades in the gradebook
      And I sign in bad_user
      When I visit the homepage
      Then I should see everyone's grades
      And I click "Edit" on a post
      And I edit the name and submit
      Then I should NOT have updated the grade
      