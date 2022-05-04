Feature: Deleting Grades
    Scenario: Viewing detailed grade information, should be able to delete the grade
        Given there are grades in the gradebook
        And I sign in
        When I visit the homepage
        And I click "Destroy" on a post
        Then that post should be deleted

    Scenario: Viewing detailed grade information, should NOT be able to delete the grade
        Given there are grades in the gradebook
        And I sign in bad_user
        When I visit the homepage
        And I click "Destroy" on a post
        Then that post should NOT be deleted
