Feature: Registration

Registration must not be possible, please remove the sign-up button from the sign in page.

Scenario: I should not be able to register
    Given I am a user
    When I go to sign in page
    Then I should not be able to see the "Sign up" button
