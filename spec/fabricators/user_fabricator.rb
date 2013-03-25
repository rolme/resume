Fabricator(:user) do
  new_password = Faker::Company.catch_phrase 

  first_name            { Faker::Name.first_name }
  last_name             { Faker::Name.last_name }
  authentication
end