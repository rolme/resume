Fabricator(:address) do
  name    { Faker::Lorem.word }
  street1 { Faker::Address.street_address }
  street2 { Faker::Address.street_address }
  city    { Faker::Address.city }
  state   { Faker::Address.state_abbr }
  zip     { Faker::Address.zip_code[0..4] }
  county  { Faker::Address.city }
  user
end
