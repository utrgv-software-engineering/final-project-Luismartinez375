Feature: Sort

Scenario: signed in and sorting grades(ASC)
    Given there are grades in the gradebook
    And I sign in
    When I visit the homepage
    And I click "ASC" 
    Then I should see grades sorted least to greatest

Scenario: signed in and sorting grades(DESC)
    Given there are grades in the gradebook
    And I sign in
    When I visit the homepage
    And I click "DESC" 
    Then I should see grades sorted greatest to least