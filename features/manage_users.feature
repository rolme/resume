Feature: Manage Users
  In Order to make a resume builder
  As an admin
  I want to create and manage users

  Scenario: User login
    Given I have a valid account
    And I am on the homepage
    When I fill in "user_login" field with "test@test.com"
    And I fill in "user_password" field with "password"
    And click on "Sign in" button
    Then I should see "Signed in successfully.".
