Fabricator(:experience) do
  title               { Faker::Lorem.word }
  department          { Faker::Lorem.word }
  company             { Faker::Company.name }
  start_date          "2013-04-05"
  end_date            "2013-04-05"
  experienceable_id   nil
  experienceable_type nil
end
