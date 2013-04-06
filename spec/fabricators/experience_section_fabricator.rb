Fabricator(:experience_section) do
  header { Faker::Lorem.words(3).join(' ') }
  experience
end
