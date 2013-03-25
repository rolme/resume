Fabricator(:contact_information) do
  contact_type
  information { Faker::Lorem.sentence }
end

