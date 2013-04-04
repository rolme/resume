Fabricator(:contact_information) do
  user
  first_name      { Faker::Name.first_name }
  last_name       { Faker::Name.last_name }
  middle_initial  { Faker::Lorem.characters(1) }
  home_phone      { Faker::PhoneNumber.phone_number }
  mobile_phone    { Faker::PhoneNumber.cell_phone }
  contact_email   { Faker::Internet.email }
  url             { Faker::Internet.domain_name }
  github          { Faker::Lorem.word }
  linkedin        { 'in/' + Faker::Lorem.word }
  twitter         { '@' + Faker::Lorem.word }
  instagram       { Faker::Lorem.word }
  facebook        { Faker::Lorem.word }
end
