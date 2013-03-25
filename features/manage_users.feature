Feature: Manage Users
  In Order to make a resume builder
  As an admin
  I want to create and manage users

  Scenario: User login
    Given I have a valid account
    And I am on the homepage
    When I fill in "authentication_email" field with "test@test.com"
    And I fill in "authentication_password" field with "password"
    And click on "Sign up" button
    Then I should see "You have successfully signed in".
