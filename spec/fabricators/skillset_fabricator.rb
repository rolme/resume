Fabricator(:skillset) do
  header { Faker::Lorem.words(3).join(' ') }
  parent { Fabricate.build(:section) }
end

