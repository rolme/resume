###############################################################################
# Helper Methods
###############################################################################
def create_user_attr
  @test_user_attr ||= Fabricate.attributes_for(:test_user)
end

def find_user
  create_user_attr
  @user ||= User.where(:email => @test_user_attr[:email]).first
end

def delete_user
  create_user_attr
  @user ||= User.where(:email =>@test_user_attr[:email]).first
  @user.destroy unless @user.nil?
end

def create_user
  delete_user
  @user = Fabricate(:test_user, contact_information: Fabricate.build(:contact_information))
end

def sign_up
  delete_user
  visit '/signup'
  fill_in "user_handle", :with =>@test_user_attr[:handle]
  fill_in "user_email", :with =>@test_user_attr[:email]
  fill_in "user_password", :with =>@test_user_attr[:password]
  fill_in "user_password_confirmation", :with =>@test_user_attr[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/'
  fill_in "user_login", :with =>@test_user_attr[:email]
  fill_in "user_password", :with =>@test_user_attr[:password]
  click_button "Sign in"
end

###############################################################################
# GIVEN
###############################################################################
Given /^I am not logged in$/ do
  visit '/signout'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_user_attr
  delete_user
end

###############################################################################
# When
###############################################################################
When /^I sign in with valid credentials$/ do
  create_user_attr
  sign_in
end

When /^I sign out$/ do
  visit '/signout'
end

When /^I sign up with valid user data$/ do
  create_user_attr
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_user_attr
  @test_user_attr.merge!(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_user_attr
  @test_user_attr.merge!(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_user_attr
  @test_user_attr.merge!(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_user_attr
  @test_user_attr.merge!(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @test_user_attr.merge!(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @test_user_attr.merge!(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with =>@test_user_attr[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

###############################################################################
# THEN
###############################################################################
Then /^I should be signed in$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Sign up"
  page.should_not have_content "Sign in"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should_not have_content "Sign out"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Emailis invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Passwordcan't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Passworddoesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Passworddoesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end