Given(/^I have users named (.+)$/) do |people|
  people.split(', ').each do |person|
    User.create!(:first_name => person)
  end
end

Given(/^I am on the homepage$/) do
  visit "/"
end

Given(/^I have a valid account$/) do
  auth = Fabricate.build(:authentication, email: "test@test.com", password: "12341234", password_confirmation: "12341234")
  user = Fabricate(:user, last_name: "last", first_name: "first", authentication: auth)
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