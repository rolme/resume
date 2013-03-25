Given(/^I have users named (.+)$/) do |people|
  people.split(', ').each do |person|
    User.create!(:first_name => person)
  end
end

Given(/^I am on the homepage$/) do
  visit "/"
end

Given(/^I have a valid account$/) do
  user = Fabricate.build(:user, email: "test@test.com", password: "password", password_confirmation: "password")
end

When(/^I fill in "(.*?)" field with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When(/^click on "(.*?)" button$/) do |arg1|
  click_button(arg1)
end

Then(/^I should see "(.*?)"\.$/) do |arg1|
  page.should have_content(arg1)
end