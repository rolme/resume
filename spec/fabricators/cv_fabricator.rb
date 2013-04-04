Fabricator(:cv) do
  user
  title  { Faker::Lorem.words(2).join(' ') }
  target { Faker::Lorem.characters(3) }
end
